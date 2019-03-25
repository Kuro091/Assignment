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
    private boolean status;

    public Receipt(int userID, float totalprice, int totalticket, boolean status) {
        this.userID = userID;
        this.totalprice = totalprice;
        this.totalticket = totalticket;
        this.status = status;
    }

    public Receipt(int receiptID, int userID, float totalprice, int totalticket, boolean status) {
        this.receiptID = receiptID;
        this.userID = userID;
        this.totalprice = totalprice;
        this.totalticket = totalticket;
        this.status = status;
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

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Receipt{" + "receiptID=" + receiptID + ", userID=" + userID + ", totalprice=" + totalprice + ", totalticket=" + totalticket + ", status=" + status + '}';
    }
    

   
}
