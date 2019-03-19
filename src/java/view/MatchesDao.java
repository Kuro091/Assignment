/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import model.Matches;
import context.DBContext;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.ArrayList;

/**
 *
 * @author admin
 */
public class MatchesDao {
      private Connection connection;

    public MatchesDao(DBContext dbContext) {
        try {
            connection = dbContext.getConnection();
        } catch (Exception ex) {
            Logger.getLogger(MatchesDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ArrayList<Matches> getAllMatches(){
        ArrayList<Matches> matches = new ArrayList();
         try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from Match");
            while (rs.next()) {
                Matches m = new Matches(rs.getInt(1),rs.getString(2), rs.getString(3), rs.getTime(4),rs.getString(5),rs.getInt(6),rs.getDate(4));
                matches.add(m);
            }
        } catch (SQLException e) {
            
        }
        return matches;
    }
}
