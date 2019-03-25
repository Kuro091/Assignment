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
        String totalPriceStr = request.getParameter("totalprice");
        String username = request.getParameter("username");
        String receiptidStr = request.getParameter("receiptid");
        String message = "";
        int receiptid = 0;
        float totalprice = 0;
        
        try{
            receiptid = Integer.parseInt(receiptidStr);
            totalprice = Float.parseFloat(totalPriceStr);
        }catch(NumberFormatException e){
            e.printStackTrace();
        }
        
        UserAccount user = getUserDao().getUserbyName(username);
        float credit = user.getCredit();
        Receipt r = getReceiptDao().getReceiptById(receiptid);
        
        if(credit >= totalprice){
            r.setStatus(true);
            getReceiptDao().updateReceiptStatus(receiptid);
            user.setCredit(credit - totalprice);
            getUserDao().editCredit(user);
            
            message += "Mua vé thành công";
        }else{
            message += "Không đủ tiền, bạn muốn nạp thêm tiền hay hủy đơn?";
        }
        
        request.setAttribute(message, "message");
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
