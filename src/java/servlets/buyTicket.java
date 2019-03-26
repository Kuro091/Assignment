/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;

/**
 *
 * @author admin
 */
public class buyTicket extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String matchIDStr = request.getParameter("matchID");
        UserAccount user = getUserDao().getUserbyName(username);
        int matchID = 0;

        try {
            matchID = Integer.parseInt(matchIDStr);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        int number_of_ticket_availble = 0;
        ArrayList<Ticket> ticket = getTicketDao().getTicketByMatchID(matchID);
        for (Ticket t : ticket) {
            if (t.getIsAvailable() == 1) {
                number_of_ticket_availble++;
            }
        }
        Match match = getMatchDao().getMatchByID(matchID);

        request.setAttribute("match", match);
        request.setAttribute("user", user);
        request.setAttribute("ticket", number_of_ticket_availble);
        forward(request, response, "/WEB-INF/views/buyTicket.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String matchIDStr = request.getParameter("matchID");
        String amountStr = request.getParameter("amount");
        int matchID = 0, amount = 0;
        String message = "";
        String status = "";
        try {
            matchID = Integer.parseInt(matchIDStr);
            amount = Integer.parseInt(amountStr);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        UserAccount user = getUserDao().getUserbyName(username);
        request.setAttribute("user", user);
        float credit = user.getCredit(); // kiểm tra tiền của user

        // kiểm tra số vé
        int number_of_ticket_availble = 0;
        ArrayList<Ticket> ticket = getTicketDao().getTicketByMatchID(matchID);
        for (Ticket t : ticket) {
            if (t.getIsAvailable() == 1) {
                number_of_ticket_availble++;
            }

        }

        int check_receipt = 0;
        Receipt r1 = null;
        ArrayList<Receipt> rece = getReceiptDao().getAllReceiptById(user.getUserID());
        for (Receipt r : rece) {
            if (r.isStatus() == false) {
                check_receipt++;
                r1 = new Receipt(r.getReceiptID(), r.getUserID(), r.getTotalprice(), r.getTotalticket(), r.isStatus(),r.isIsAccept(),r.getMatchID());
            }
        }

        //
        float totalprice = 0;
        Receipt r = new Receipt(user.getUserID(), totalprice, 0, false,false,matchID);

        if (check_receipt == 0) {
            if (ticket != null && number_of_ticket_availble >= amount) { // nếu còn vé
                float price = ticket.get(0).getCost();
                totalprice = amount * price;
                r.setTotalprice(totalprice);
                r.setTotalticket(amount);
                r.setMatchID(matchID);
                System.out.println(matchID);
                //  user.setCredit(credit - totalprice);
                //getUserDao().editCredit(user);
                getTicketDao().updateTicket(matchID, amount);
                getMatchDao().updateMatchTicket(matchID, amount);

                getReceiptDao().createReceipt(r);

                message += "Thanh toán thành công";

                Receipt receipt = getReceiptDao().getLastReceiptByUserid(user.getUserID());
                request.setAttribute("receipt", receipt);
                request.setAttribute("matchid", matchIDStr);
                request.setAttribute("message", message);
                forward(request, response, "/WEB-INF/views/orderstatus.jsp");

            } else {
                // hết vé hoặc số vé mua lớn hơn số vé còn lại
                message = " Không đủ vé để mua";
                amount = 0;

                request.setAttribute("message", message);
                request.setAttribute("user", user);
                Match m = getMatchDao().getMatchByID(matchID);
                request.setAttribute("match", m);
                String ticketLeft = request.getParameter("ticketLeft");
                request.setAttribute("matchid", matchIDStr);
                request.setAttribute("ticket", ticketLeft);
                forward(request, response, "/WEB-INF/views/buyTicket.jsp");

            }

        } else {
            message = "Có hóa đơn chưa thanh toán.Bạn không để đặt thêm vé.Xin hãy thanh toán hóa đơn cũ";
            request.setAttribute("message", message);
            request.setAttribute("receipt", r1);
            request.setAttribute("matchid", matchID);

            forward(request, response, "/WEB-INF/views/orderstatus.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
