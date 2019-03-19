/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author admin
 */
public class Matches {
    private int matchID;
    private String host;
    private String guest;
    private Date time;
    private String stadium;
    private int totalTicket;
    private Date date;

    public Matches(int matchID, String host, String guest, Date time, String stadium, int totalTicket,Date date) {
        this.matchID = matchID;
        this.host = host;
        this.guest = guest;
        this.time = time;
        this.stadium = stadium;
        this.totalTicket = totalTicket;
        this.date = date;
    }
    
    

    public int getMatchID() {
        return matchID;
    }

    public void setMatchID(int matchID) {
        this.matchID = matchID;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getGuest() {
        return guest;
    }

    public void setGuest(String guest) {
        this.guest = guest;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getStadium() {
        return stadium;
    }

    public void setStadium(String stadium) {
        this.stadium = stadium;
    }

    public int getTotalTicket() {
        return totalTicket;
    }

    public void setTotalTicket(int totalTicket) {
        this.totalTicket = totalTicket;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
    
    
    
}
