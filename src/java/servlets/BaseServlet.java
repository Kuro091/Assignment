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
import view.MatchDao;
import view.UserDao;
import view.TicketDao;
import model.Ticket;
import view.OrderDao;

/**
 *
 * @author Admin
 */
public class BaseServlet extends HttpServlet {
    
    protected DBContext dbContext;
    protected UserDao userDao;
    protected MatchDao matchDao;
    protected TicketDao ticketDao;
    protected OrderDao orderDao;
    
    public DBContext getDbContext() {
        return dbContext;
    }

    public UserDao getUserDao(){
        return userDao;
    }
    
    public MatchDao getMatchDao(){
        return matchDao;
    }
    
    public TicketDao getTicketDao(){
        return ticketDao;
    }
    
    public OrderDao getOrderDao(){
        return orderDao;
    }
    
    @Override
    public void init() throws ServletException {
        super.init(); //To change body of generated methods, choose Tools | Templates.
        dbContext = new DBContext();
        userDao = new UserDao(dbContext);
        matchDao = new MatchDao(dbContext);
        ticketDao = new TicketDao(dbContext);
        orderDao = new OrderDao(dbContext);
    }
    
    protected void forward(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException
    {
        RequestDispatcher view = request.getRequestDispatcher(path);
        view.forward(request, response);
    }
    
    
}
