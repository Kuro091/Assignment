/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import model.Matches;
import java.util.ArrayList;
/**
 *
 * @author admin
 */
public class MatchesManagement {
    MatchesDao matchesdao;

    public MatchesManagement(MatchesDao matchesdao) {
        this.matchesdao = matchesdao;
    }
    
    public ArrayList<Matches> getAllMatches(){
        return matchesdao.getAllMatches();
    }
}
