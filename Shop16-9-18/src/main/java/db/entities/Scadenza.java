/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.entities;

import java.io.Serializable;
import java.sql.Time;

/**
 *
 * @author octopussy
 */
public class Scadenza implements Serializable{
    private int idProdotto;
    private int idListaSpesa;
    private int media;
    private int contatore;
    private Time primo;
    private Time ultimo;
    private int visto;// 0 nessuna notifica da vedere, 1 notifica da vedere
    private int contEmail;

    public Scadenza(int idProdotto, int idListaSpesa, int media, int contatore, Time primo, Time ultimo, int visto, int contEmail) {
        this.idProdotto = idProdotto;
        this.idListaSpesa = idListaSpesa;
        this.media = media;
        this.contatore = contatore;
        this.primo = primo;
        this.ultimo = ultimo;
        this.visto = visto;
        this.contEmail = contEmail;
    }
    

    public Scadenza(int idProdotto, int idListaSpesa, int media, int contatore, Time primo, Time ultimo, int visto) {
        this.idProdotto = idProdotto;
        this.idListaSpesa = idListaSpesa;
        this.media = media;
        this.contatore = contatore;
        this.primo = primo;
        this.ultimo = ultimo;
        this.visto = visto;
    }

    public Scadenza(int idProdotto, int idListaSpesa) {
        this.idProdotto = idProdotto;
        this.idListaSpesa = idListaSpesa;
    }
    
    
    public int getIdProdotto() {
        return idProdotto;
    }

    public void setIdProdotto(int idProdotto) {
        this.idProdotto = idProdotto;
    }

    public int getIdListaSpesa() {
        return idListaSpesa;
    }

    public void setIdListaSpesa(int idListaSpesa) {
        this.idListaSpesa = idListaSpesa;
    }

    public int getMedia() {
        return media;
    }

    public void setMedia(int media) {
        this.media = media;
    }

    public int getContatore() {
        return contatore;
    }

    public void setContatore(int contatore) {
        this.contatore = contatore;
    }

    public Time getPrimo() {
        return primo;
    }

    public void setPrimo(Time primo) {
        this.primo = primo;
    }

    public Time getUltimo() {
        return ultimo;
    }

    public void setUltimo(Time ultimo) {
        this.ultimo = ultimo;
    }

    public int getVisto() {
        return visto;
    }

    public void setVisto(int visto) {
        this.visto = visto;
    }

    public int getContEmail() {
        return contEmail;
    }

    public void setContEmail(int contEmail) {
        this.contEmail = contEmail;
    }
    
    
    
}
