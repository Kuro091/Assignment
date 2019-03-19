<%-- 
    Document   : Matches
    Created on : Mar 18, 2019, 9:51:56 PM
    Author     : admin
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="model.Matches"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Lịch thi đấu</h1>
        <table>
            <tr>
                <th>Ngày</th>
                <th>Giờ thi đấu</th>
                <th>Trận đấu</th>
                <th>Địa điểm</th>
            </tr>
            
            <tbody>
                <%  ArrayList<Matches> matches = (ArrayList<Matches>)request.getAttribute("matches");
                    for(Matches m : matches)
                       
                    {
                      //  java.util.Date date = new java.util.Date(m.getDate.getTime());
                       // SimpleDateFormat sdf1 = new SimpleDateFormat("dd-mmmm-yyyy");
                       // SimpleDateFormat sdf2= new SimpleDateFormat("HH-mm-ss");
                    
                    %>
                    
                    <tr>
                        <td><%=Integer.toString(m.getDate().getDate())+"-"+Integer.toString(m.getDate().getMonth()+1)+"-"+Integer.toString(m.getDate().getYear()+1900)%></td>
                        <td><%=m.getTime()%></td>
                        <td><%=m.getHost()+"-"+m.getGuest()%></td>
                        <td><%=m.getStadium()%></td>
                    </tr>
                        
                
                    <%}
    %>
            </tbody>
        </table>
        
    </body>
    <div>
        
    </div>
</html>
