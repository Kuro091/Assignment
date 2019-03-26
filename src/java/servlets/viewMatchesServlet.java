/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import context.DBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Match;
import view.MatchDao;

/**
 *
 * @author Asus
 */
public class viewMatchesServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<Match> matches;
        try {
            //ArrayList<Match> matches = getMatchDao().getAllMatches();

            int currentPage = Integer.valueOf(request.getParameter("p"));
            if(currentPage!=0){
                double recordsPerPage = 5;
                double rows = getMatchDao().getMatchListSize();
                int nOfPages = (int) Math.ceil(rows / recordsPerPage);
                //System.out.println(rows + " " + nOfPages);
                
                matches = getMatchDao().getMatches(currentPage);
                request.setAttribute("noOfPages", nOfPages);
                request.setAttribute("currentPage", currentPage);
                
            }else{
                matches = getMatchDao().getMatches(1);
            }
            // java.util.Date date = new java.util.Date(matches.get(0).getDatetime().getTime());
            //           SimpleDateFormat sdf = new SimpleDateFormat("dd-mm-yyyy");
            // System.out.print(sdf.p);
            request.setAttribute("matches", matches);
            forward(request, response, "/WEB-INF/views/viewMatches.jsp");

        } catch (Exception e) {
        }
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
