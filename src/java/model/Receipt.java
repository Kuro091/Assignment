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
public class Receipt {
    private int receiptID;
    private int userID;
    private float totalprice;
    private int totalticket;
    

    public Receipt(int receiptID, int userID, float totalprice, int totalticket) {
        this.receiptID = receiptID;
        this.userID = userID;
        this.totalprice = totalprice;
        this.totalticket = totalticket;
      
    }

    public Receipt(int userID, float totalprice, int totalticket) {
        this.userID = userID;
        this.totalprice = totalprice;
        this.totalticket = totalticket;
    }
    
    
    
    
    public int getReceiptID() {
        return receiptID;
    }

    public void setReceiptID(int receiptID) {
        this.receiptID = receiptID;
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

  
    
    
    
}
