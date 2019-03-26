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

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet buyTicket</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet buyTicket at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doPost(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String matchIDStr = request.getParameter("matchID");
        UserAccount user = getUserDao().getUserbyName(username);
        request.setAttribute("user", user);
        int matchID = 0;

        try {
            matchID = Integer.parseInt(matchIDStr);

        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        Match match = getMatchDao().getMatchByID(matchID);

        ArrayList<Receipt> receipt = getReceiptDao().getAllReceiptByUserID(user.getUserID());

        int check_receipt = 0;
        Receipt r1 = null;
        // kiểm tra xem có hóa đơn nào chưa thanh toán
        for (Receipt r : receipt) {
            if (r.isStatus() == false) {
                check_receipt++;
                r1 = new Receipt(r.getReceiptID(), r.getUserID(), r.getTotalprice(), r.getTotalticket(), r.isStatus());
            }
        }
        //
        if (check_receipt == 0) {// nếu tất cả các hóa đơn đã được thanh toán
            int number_of_ticket_availble = 0;
            ArrayList<Ticket> ticket = getTicketDao().getTicketByMatchID(matchID);
            for (Ticket t : ticket) {
                if (t.getIsAvailable() == 1) {
                    number_of_ticket_availble++;
                }

            }
            request.setAttribute("match", match);

            request.setAttribute("ticket", number_of_ticket_availble);
            forward(request, response, "/WEB-INF/views/buyTicket.jsp");
        } else { // nếu có hóa đơn chưa được thanh toán
            String message = "Xin hãy thanh toán hóa đơn chưa được xử lí";
            request.setAttribute("message", message);
            request.setAttribute("receipt", r1);
            request.setAttribute("matchid", match.getMatchID());

            forward(request, response, "/WEB-INF/views/checkout.jsp");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
