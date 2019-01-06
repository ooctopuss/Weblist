/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.entities;

import java.io.Serializable;

/**
 *
 * @author octopussy
 */
public class Types implements Serializable{
    private int idTypes;
    private String nomeIng;
    private String nomeIt;

    public Types(String nomeIng, String nomeIt) {
        this.nomeIng = nomeIng;
        this.nomeIt = nomeIt;
    }

    public Types(int idTypes, String nomeIng, String nomeIt) {
        this.idTypes = idTypes;
        this.nomeIng = nomeIng;
        this.nomeIt = nomeIt;
    }
    
    

    public int getIdTypes() {
        return idTypes;
    }

    public void setIdTypes(int idTypes) {
        this.idTypes = idTypes;
    }

    public String getNomeIng() {
        return nomeIng;
    }

    public void setNomeIng(String nomeIng) {
        this.nomeIng = nomeIng;
    }

    public String getNomeIt() {
        return nomeIt;
    }

    public void setNomeIt(String nomeIt) {
        this.nomeIt = nomeIt;
    }
    
    
    
}
