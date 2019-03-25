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
import model.Receipt;
import model.Ticket;
import model.UserAccount;

/**
 *
 * @author admin
 */
public class checkoutServlet extends BaseServlet {

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
            out.println("<title>Servlet checkoutServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet checkoutServlet at " + request.getContextPath() + "</h1>");
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
        String amountStr = request.getParameter("amount");
        int matchID = 0,amount = 0;
        String message = "";
        System.out.print(username +" " + matchIDStr +" " + amountStr);
        try{
            matchID = Integer.parseInt(matchIDStr);
            amount = Integer.parseInt(amountStr);
        }catch(NumberFormatException e){
            e.printStackTrace();
        }
        
        UserAccount user = getUserDao().getUserbyName(username);
        float credit = user.getCredit(); // kiểm tra tiền của user
        
        // kiểm tra số vé
        int number_of_ticket_availble = 0;
        ArrayList<Ticket> ticket = getTicketDao().getTicketByMatchID(matchID); 
        for(Ticket t : ticket){
            if(t.getIsAvailable() == 1){
               number_of_ticket_availble++;
            }
            
        }
        
        //
        float totalprice = 0;
        Receipt r = new Receipt(user.getUserID(),0, 0);
        if(ticket != null && number_of_ticket_availble >= amount){ // nếu còn vé
            float price = ticket.get(0).getCost();
            totalprice = amount * price;
            
            if(credit > totalprice){ // nếu tài khoản đủ tiền
                user.setCredit(credit - totalprice);
                getUserDao().editCredit(user);
                getTicketDao().updateTicket(matchID, amount);
                getMatchDao().updateMatchTicket(matchID, amount);
                
                r = new Receipt(user.getUserID(), totalprice, amount);
                getReceiptDao().createReceipt(r);
                
                message += "Thanh toán thành công";
                
               
            }else{  // nếu tài khoản không đủ tiền
                // viết chức năng nạp tiền ở đây
                message += "Không đủ tiền trong tài khoản. Xin hãy nạp tiền";
                
            }
            
        }else{
            // hết vé hoặc số vé mua lớn hơn số vé còn lại
            message = " Không đủ vé để mua";
            amount = 0;
            
        }
        
        request.setAttribute("user", user);
        request.setAttribute("credit_left", user.getCredit());
        request.setAttribute("totalprice", totalprice);
        request.setAttribute("totalticket", amount);
        request.setAttribute("message", message);
         forward(request, response, "/WEB-INF/views/checkout.jsp");
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
