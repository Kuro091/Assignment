/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import model.Match;
import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
public class MatchDao {
      private Connection connection;

    public MatchDao(DBContext dbContext) {
        try {
            connection = dbContext.getConnection();
        } catch (Exception ex) {
            Logger.getLogger(MatchDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ArrayList<Match> getAllMatches(){
        ArrayList<Match> matches = new ArrayList();
         try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from Match");
            while (rs.next()) {
                Match m = new Match(rs.getInt(1),rs.getString(2), rs.getString(3), rs.getTime(4),rs.getString(5),rs.getInt(6),rs.getDate(4));
                matches.add(m);
            }
        } catch (SQLException e) {
            
        }
        return matches;
    }
    
    public Match getMatchById(int matchId){
        Match m = null;
        try{
            String sql = "select * from Match where matchID = ?";
            PreparedStatement psmt = connection.prepareStatement(sql);
            psmt.setInt(1, matchId);
        }catch(SQLException se){
            
        }
        return m;
    }
}
