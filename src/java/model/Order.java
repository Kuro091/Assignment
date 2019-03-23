/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author admin
 */
public class Order {
    private int orderID;
    private int userID;
    private float totalprice;
    private int totalticket;
    private int matchID;

    public Order(int orderID, int userID, float totalprice, int totalticket, int matchID) {
        this.orderID = orderID;
        this.userID = userID;
        this.totalprice = totalprice;
        this.totalticket = totalticket;
        this.matchID = matchID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public float getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(float totalprice) {
        this.totalprice = totalprice;
    }

    public int getTotalticket() {
        return totalticket;
    }

    public void setTotalticket(int totalticket) {
        this.totalticket = totalticket;
    }

    public int getMatchID() {
        return matchID;
    }

    public void setMatchID(int matchID) {
        this.matchID = matchID;
    }
    
    
}

