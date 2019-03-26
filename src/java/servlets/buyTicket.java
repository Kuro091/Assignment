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

        //System.out.println(username + " " + matchID + " " + amount);
        UserAccount user = getUserDao().getUserbyName(username);
        float credit = user.getCredit(); // kiểm tra tiền của user

        //System.out.println(user.toString());
        // kiểm tra số vé
        int number_of_ticket_availble = 0;
        ArrayList<Ticket> ticket = getTicketDao().getTicketByMatchID(matchID);
        for (Ticket t : ticket) {
            if (t.getIsAvailable() == 1) {
                number_of_ticket_availble++;
            }
        }
        System.out.println(number_of_ticket_availble + " " + amount + (number_of_ticket_availble >= amount));

        //
        float totalprice = 0;
        Receipt r = new Receipt();
        if (ticket != null && number_of_ticket_availble >= amount) { // nếu còn vé
            float price = ticket.get(0).getCost();
            totalprice = amount * price;

            r.setReceiptID(getReceiptDao().getReceiptListSize() + 1);
            r.setUserID(user.getUserID());
            r.setTotalprice(totalprice);
            r.setTotalticket(amount);
            r.setStatus(false);

            //  user.setCredit(credit - totalprice);
            //getUserDao().editCredit(user);
            getTicketDao().updateTicket(matchID, amount);
            getMatchDao().updateMatchTicket(matchID, amount);

            //System.out.println("RECEIPT: "  + r.toString());
            getReceiptDao().createReceipt(r);

            message += "Thanh toán thành công";

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

        Receipt receipt = getReceiptDao().getLastReceiptByUserid(user.getUserID());
        //System.out.println(receipt.toString());

        request.setAttribute("user", user);
        request.setAttribute("receipt", receipt);
        request.setAttribute("matchid", matchIDStr);
        request.setAttribute("message", message);
        forward(request, response, "/WEB-INF/views/orderStatus.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
