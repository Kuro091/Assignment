/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;
import model.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
public class updatecreditServlet extends BaseServlet {

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
 
        forward(request, response, "/WEB-INF/updatecredit.jsp");
        
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
        
        
            
           String id = request.getParameter("id");
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            int credit =0, newCredit=0;
            
            int phone=0;
            try{
                phone = Integer.parseInt(request.getParameter("phone"));
            }catch(NumberFormatException e){
                
            }
            
            
            
  
            if(phone<0 || !Integer.toString(phone).matches("\\d{10}")   ){
                errorString += "Chưa điền đủ đúng phone number format!!<br/>";
            }
            
            
            
            
            if(errorString != null && errorString.contains("null")){
                errorString = errorString.substring(errorString.indexOf("null")+4, errorString.length());
            }
            //Nếu có lỗi thì báo, ko thì insert rồi redirect lại trang home
            if(errorString!=null){
                request.setAttribute("errorString", errorString);
                Customer p = new Customer(id, name, email,  phone, Boolean.parseBoolean(status));
                request.setAttribute("user", p);
                RequestDispatcher dispatcher = request.getServletContext()
                    .getRequestDispatcher("/WEB-INF/updatecredit.jsp");
                dispatcher.forward(request, response);
                return;
            }else{
                getUserDao().editCredit(p);
                request.setAttribute("infoSuccess", "Đăng ký thành công!!");
                response.sendRedirect(request.getContextPath() + "/index");
            }
      
        
        
        
        

        
       String username = request.getParameter("username");
        String creditStr = request.getParameter("credit");
        String moneyStr = request.getParameter("money");
        
        System.out.println(username + " "+creditStr+" "+moneyStr+" ");
        float credit = 0,money = 0;
        try{
            credit = Float.parseFloat(creditStr);
            money = Float.parseFloat(moneyStr);
        }catch(NumberFormatException e){
            e.printStackTrace();
        }
        UserAccount user = getUserDao().getUserbyName(username);
        user.setCredit(credit + money);
        getUserDao().editCredit(user);
        
        request.setAttribute("user", user);
        
         forward(request, response, "/WEB-INF/updatecredit.jsp");
       
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
