/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import model.UserAccount;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Asus
 */
public class addCreditServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        forward(request, response, "WEB-INF/views/addCredit.jsp");
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
        String errorString = null;
        String creditNewStr = request.getParameter("creditNew");
        String userIDStr = request.getParameter("userID");
        if(creditNewStr==null || creditNewStr.isEmpty()){
            errorString += "Không thể có trường trống";
        }
        
        if (errorString != null && errorString.contains("null")) {
            errorString = errorString.substring(errorString.indexOf("null") + 4, errorString.length());
        }

        UserAccount u = getUserDao().getUserbyID(userIDStr);
        
        float creditNew = 0;
        float creditOld = u.getCredit();
        int userID = 0;
        float credit =0;
        try{
            
            userID = Integer.parseInt(userIDStr);
            creditNew = Float.parseFloat(creditNewStr);
        }catch(NumberFormatException ex){
            ex.printStackTrace();
        }
        
        credit = creditOld + creditNew;
        //System.out.println(credit + " " +creditOld + " " + creditNew);
        if (errorString != null) {
            request.setAttribute("errorString", errorString);
            forward(request, response, "WEB-INF/views/addCredit.jsp");

        } else {
            getUserDao().addCredit(userID, credit);
            request.setAttribute("infoSuccess", "Thêm credit thành công!!");
            forward(request, response, "WEB-INF/views/home_authorized.jsp");
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
