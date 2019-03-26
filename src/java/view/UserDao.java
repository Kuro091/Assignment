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
import java.util.ArrayList;
import java.util.List;
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
            String[] role = new String[10];
            int currentSize=-1;
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
                    currentSize=0;
                    role[currentSize] = SecurityConfig.ROLE_ADMIN;
                    role[++currentSize] = SecurityConfig.ROLE_USER;
                }else if(isAdmin){
                    currentSize=0;
                    role[currentSize] = SecurityConfig.ROLE_ADMIN;
                }else if(isUser){
                    currentSize=0;
                    role[currentSize] = SecurityConfig.ROLE_USER;
                }
                u = new UserAccount(userName, password, role);
                //System.out.println("RUN: " + rs.getFloat("credit"));
                u.setCredit(rs.getFloat("credit"));
                u.setUserID(rs.getInt("UserID"));
                isAdmin = false; isUser = false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return u;
    }
    
     public void addUser(UserAccount user) {
        try {
            PreparedStatement preparedStatement = connection.
                    prepareStatement("insert into Users (UserID, Username, Password, Credit, Phone, Address,Roles) values (?,?,?,?,?,?,?) ");
            preparedStatement.setInt(1, user.getUserID());
            preparedStatement.setString(2, user.getUserName());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setFloat(4, user.getCredit());
            preparedStatement.setInt(5, user.getPhone());
            preparedStatement.setString(6, user.getAddress());
            preparedStatement.setString(7, SecurityConfig.ROLE_USER);
            
        
            preparedStatement.executeUpdate();

        } catch (SQLException ex) {
             Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
     public UserAccount getUserbyID(int id) {
        try {
            PreparedStatement preparedStatement = connection.
                    prepareStatement("SELECT * FROM Users "
                            + "WHERE UserID = ?");
            preparedStatement.setInt(1, id);

            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                UserAccount p = new UserAccount();
                p.setUserID(rs.getInt("UserID"));
                p.setUserName(rs.getString("Username"));
                p.setPassword(rs.getString("Password"));               
                p.setCredit(rs.getInt("Credit"));
                p.setPhone(rs.getInt("Phone"));
                return p;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }
    
     public float getCredit(float userID) {
        float result=0;
         try {
            PreparedStatement preparedStatement = connection.
                    prepareStatement("select credit from Users where UserID= ?");
            preparedStatement.setFloat(1, userID);
            
            ResultSet rs = preparedStatement.executeQuery();
            if(rs.next()){
                result = rs.getFloat("Credit");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
     
     public void editCredit(UserAccount user) {
        try {
            PreparedStatement preparedStatement = connection.
                    prepareStatement("update Users set credit = ? where UserID= ?");
            preparedStatement.setFloat(1, user.getCredit());
            preparedStatement.setInt(2, user.getUserID());
            
            preparedStatement.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     
     public void addCredit(int userID, Float newCredit) {
        try {
            PreparedStatement preparedStatement = connection.
                    prepareStatement("update Users set credit = ? where UserID= ?");
            preparedStatement.setFloat(1, newCredit);
            preparedStatement.setInt(2, userID);
            
            preparedStatement.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     
     public UserAccount getUserbyName(String name) {
        try {
            PreparedStatement preparedStatement = connection.
                    prepareStatement("SELECT * FROM Users "
                            + "WHERE Username = ?");
            preparedStatement.setString(1, name);

            ResultSet rs = preparedStatement.executeQuery();

            List<String> roles = new ArrayList<>();
            
            if (rs.next()) {
                UserAccount p = new UserAccount();
                p.setUserID(rs.getInt(1));
                p.setUserName(rs.getString(2));
                p.setPassword(rs.getString(3));               
                p.setCredit(rs.getInt(4));
                p.setPhone(rs.getInt(5));
                String[] role = new String[5];
                role = rs.getString("roles").split(",");
                for(String r: role){
                    roles.add(r.trim());
                }
                p.setRoles(roles);
                return p;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }
    
    
}
