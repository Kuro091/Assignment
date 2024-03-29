package model;


import java.util.ArrayList;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Asus
 */
public class UserAccount {
    private int userID;
    private String userName;
    private String password;
    private float credit;
    private int phone;

    @Override
    public String toString() {
        return "UserAccount{" + "userID=" + userID + ", userName=" + userName + ", password=" + password + ", credit=" + credit + ", phone=" + phone + ", address=" + address + ", roles=" + roles + '}';
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }


    private String address;

    public float getCredit() {
        return credit;
    }

    public void setCredit(float credit) {
        this.credit = credit;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
    private List<String> roles;

    public UserAccount() {
    }

    public UserAccount(String userName, String password, String... roles) {
        this.userName = userName;
        this.password = password;
        this.roles = new ArrayList<String>();
        
        if(roles!=null){
            for(String r: roles){
                System.out.println("ROLE IS" + r);
                this.roles.add(r);
            }
        }
        
        this.setPhone(0);
        this.setAddress("");
        this.setCredit(9999);
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<String> getRoles() {
        return roles;
    }

    public void setRoles(List<String> roles) {
        this.roles = roles;
    }

    public UserAccount(int userID) {
        this.userID = userID;
    }
    
    
    
}
