/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Tools;

import java.io.Serializable;

/**
 *
 * @author octopussy
 */
public class Notifiche implements Serializable{
    private int idProdotto;
    private int idLista;
    private String nomeProdotto;
    private String nomeLista;
    private int fin; // 0 dopo, 1 tra 59 e 0 secondi prima, 2 tra 1.59 e 1.

    public Notifiche(int idProdotto, int idLista, String nomeProdotto, String nomeLista,int fin) {
        this.idProdotto = idProdotto;
        this.idLista = idLista;
        this.nomeProdotto = nomeProdotto;
        this.nomeLista = nomeLista;
        this.fin = fin;
    }

    public String getNomeProdotto() {
        return nomeProdotto;
    }

    public void setNomeProdotto(String nomeProdotto) {
        this.nomeProdotto = nomeProdotto;
    }

    public String getNomeLista() {
        return nomeLista;
    }

    public void setNomeLista(String nomeLista) {
        this.nomeLista = nomeLista;
    }
    
    

    public Notifiche(int idProdotto, int idLista) {
        this.idProdotto = idProdotto;
        this.idLista = idLista;
    }

    public int getIdProdotto() {
        return idProdotto;
    }

    public void setIdProdotto(int idProdotto) {
        this.idProdotto = idProdotto;
    }

    public int getIdLista() {
        return idLista;
    }

    public void setIdLista(int idLista) {
        this.idLista = idLista;
    }

    public int getFin() {
        return fin;
    }

    public void setFin(int fin) {
        this.fin = fin;
    }
    
    
    
}
