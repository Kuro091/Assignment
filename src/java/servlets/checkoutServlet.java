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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String totalPriceStr = request.getParameter("totalprice");
        String username = request.getParameter("username");
        String receiptidStr = request.getParameter("receiptid");
        String matchid = request.getParameter("matchid");
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
        System.out.print(message);
        request.setAttribute("message", message);
        request.setAttribute("receipt", r);
        request.setAttribute("matchid", matchid);
        request.setAttribute("user", user);
        forward(request, response, "/WEB-INF/views/checkout.jsp");
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        
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
