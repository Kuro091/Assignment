/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Ticket;
import model.Order;
import model.Match;
import view.TicketDao;
import view.OrderDao;
import view.MatchDao;


/**
 *
 * @author admin
 */
@WebServlet(name = "buyTicket", urlPatterns = {"/buyTicket"})
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
        String userIDstr = request.getParameter("userID");
       String matchIDstr = request.getParameter("matchID");
        System.out.println(userIDstr +" " +matchIDstr );
        String amountStr = request.getParameter("amount");
        int matchID = 0, amount = 0,userID = 0;
        try {
           // userID = Integer.parseInt(userIDstr);
            matchID = Integer.parseInt(matchIDstr);
            amount = Integer.parseInt(amountStr);
        } catch (NumberFormatException e) {

        }
        ArrayList<Ticket> ticket = getTicketDao().getTicketByMatch(matchID);
        System.out.println(matchID+" "+matchIDstr+" "+ticket.size());
        float totalprice = amount * getTicketDao().getTicketPricebyMatch(matchID);
        
        Order order = new Order(1, userID, totalprice, amount, matchID);
        getOrderDao().createOrder(order);
        
        request.setAttribute("order", order);
          forward(request, response, "/WEB-INF/views/buyTicket.jsp");
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
