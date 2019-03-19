/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import context.DBContext;
import filter.SecurityConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.UserAccount;

/**
 *
 * @author Asus
 */
public class UserDao {

    private Connection connection;

    public UserDao(DBContext dbContext) {
        try {
            connection = dbContext.getConnection();
        } catch (Exception ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public UserAccount findUser(String userName, String password) {
        UserAccount u = null;
        try {
            String sql = "select * from Users where username = ? AND password = ?";
            PreparedStatement psmt = connection.prepareStatement(sql);
            psmt.setString(1, userName);
            psmt.setString(2, password);

            ResultSet rs = psmt.executeQuery();
            String role = "";
            boolean isAdmin = false, isUser = false;
            if (rs.next()) {
                String[] roles = rs.getString("Roles").split(",");
                for(String oneRole: roles){
                    if (oneRole.trim().equalsIgnoreCase("Admin")){
                        isAdmin = true;
                    }
                    if (oneRole.trim().equalsIgnoreCase("User")){
                        isUser = true;
                    }
                }
                if(isAdmin && isUser){
                    role = SecurityConfig.ROLE_ADMIN+", "+SecurityConfig.ROLE_USER;
                }else if(isAdmin){
                    role = SecurityConfig.ROLE_ADMIN;
                }else if(isUser){
                    role = SecurityConfig.ROLE_USER;
                }
                u = new UserAccount(userName, password, role);
                isAdmin = false; isUser = false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return u;
    }
}
