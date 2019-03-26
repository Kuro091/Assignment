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
import model.*;
import java.util.ArrayList;
import jdk.nashorn.internal.ir.LiteralNode;
/**
 *
 * @author admin
 */
public class viewOrders extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String useridStr = request.getParameter("userid");
        System.out.println("xxx");
        System.out.println(useridStr);
        System.out.println("yyy");
        int userid=0;
        String message = "";
        try{
            userid = Integer.parseInt(useridStr);
        }catch(NumberFormatException e){
            e.printStackTrace();
        }
        ArrayList<Receipt> pay_receipt = getReceiptDao().getAllPayReceiptById(userid);
        ArrayList<Receipt> unpay_receipt = getReceiptDao().getAllUnPayReceiptById(userid);
         System.out.print(pay_receipt.toString());
         
        request.setAttribute("pay", pay_receipt);
        request.setAttribute("unpay", unpay_receipt);
        forward(request, response, "/WEB-INF/views/viewOrders.jsp");
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
