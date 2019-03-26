/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Receipt;
import model.UserAccount;

/**
 *
 * @author admin
 */
public class cancelorderServlet extends BaseServlet {

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
            out.println("<title>Servlet cancelorderServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet cancelorderServlet at " + request.getContextPath() + "</h1>");
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
        String idStr = request.getParameter("receiptid");
        String matchidStr = request.getParameter("matchid");
        int id = 0,matchid = 0;
        try{
            id = Integer.parseInt(idStr);
            matchid = Integer.parseInt(matchidStr);
        }catch(NumberFormatException e){
            
        }
        System.out.print(idStr);
        String message = "";
        Receipt r = getReceiptDao().getReceiptById(id);
        UserAccount user = getUserDao().getUserbyID(r.getUserID());
        if(r.isStatus() == true && r.isIsAccept() == true){
            message += "Đã giao hàng, không hoàn tiền";
        }else if(r.isStatus() == true && r.isIsAccept() == false){
            message += "Hủy đơn thành công. Đã hoàn tiền";
            getUserDao().addCredit(r.getUserID(), user.getCredit()+r.getTotalprice());
            getTicketDao().reupdateTicket(matchid, r.getTotalticket());
        }else{
            getReceiptDao().deleteReceiptById(id);
            getTicketDao().reupdateTicket(matchid, r.getTotalticket());
            message += "Hủy đơn thành công";
        }
        request.setAttribute("message", message);
        forward(request, response, "/WEB-INF/views/cancelorder.jsp");
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
