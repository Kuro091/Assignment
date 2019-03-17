/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import context.DBContext;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import view.UserDao;

/**
 *
 * @author Admin
 */
public class BaseServlet extends HttpServlet {
    
    protected DBContext dbContext;
    protected UserDao userDao;
    public DBContext getDbContext() {
        return dbContext;
    }

    public UserDao getUserDao(){
        return userDao;
    }
    @Override
    public void init() throws ServletException {
        super.init(); //To change body of generated methods, choose Tools | Templates.
        dbContext = new DBContext();
        userDao = new UserDao(dbContext);
    }
    
    protected void forward(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException
    {
        RequestDispatcher view = request.getRequestDispatcher(path);
        view.forward(request, response);
    }
    
    
}
