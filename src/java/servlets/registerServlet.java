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
import model.UserAccount;

/**
 *
 * @author User
 */
public class registerServlet extends BaseServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        forward(request, response, "/WEB-INF/views/register.jsp");
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
        UserAccount temp = null;
        UserAccount u = null;
        String id =request.getParameter("id");
        String name = request.getParameter("username");
        String password = request.getParameter("password");
        String phoneStr = request.getParameter("phone");
        int phone = 0;
        int credit = 100;
        
        try {
            phone = Integer.valueOf(phoneStr);
        } catch (NumberFormatException e) {

        }

      

        if (phone < 0 || !Integer.toString(phone).matches("\\d{10}")) {
            errorString += "Chưa điền đủ đúng phone number format!!<br/>";
        }
        
        System.out.println(id);
        System.out.println(phone + " " + phoneStr);


         if(getUserDao().getUserbyID(id)!=null){
                errorString += "ID already existed!<br/>";
            }
        
        if (errorString != null && errorString.contains("null")) {
            errorString = errorString.substring(errorString.indexOf("null") + 4, errorString.length());
        }

        u = new UserAccount(name, password, "USER");
        u.setCredit(credit);
        u.setPhone(phone);
        u.setUserID(id);

        //Nếu có lỗi thì báo, ko thì insert rồi redirect lại trang home
        if (errorString != null) {
            request.setAttribute("errorString", errorString);

            request.setAttribute("user", u);
            forward(request, response, "WEB-INF/views/register.jsp");

            return;
        } else {
            getUserDao().addUser(u);
            request.setAttribute("infoSuccess", "Đăng ký thành công!!");
            response.sendRedirect(request.getContextPath() + "/index");
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
