/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.entities;

/**
 *
 * @author octopussy
 */
public class Logo {
    private int id;
    private String indirizzo;

    public Logo(int id) {
        this.id = id;
    }
    public Logo(String indirizzo){
        this.indirizzo = indirizzo;
    }

    public Logo(int id, String indirizzo) {
        this.id = id;
        this.indirizzo = indirizzo;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIndirizzo() {
        return indirizzo;
    }

    public void setIndirizzo(String indirizzo) {
        this.indirizzo = indirizzo;
    }
    
    
}
