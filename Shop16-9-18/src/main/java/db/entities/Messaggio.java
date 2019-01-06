/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.entities;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author Safouane
 */
public class Messaggio implements Serializable{
    private int idMessaggio;
    private String messaggio;
    private int ListaSpesa_idListaSpesa;
    private int Utente_idUtente;
    private Timestamp oraInvio;

    public Messaggio() {
    }
    public Messaggio(String messaggio, int ListaSpesa_idListaSpesa, int Utente_idUtente) {
        
        this.messaggio = messaggio;
        this.ListaSpesa_idListaSpesa = ListaSpesa_idListaSpesa;
        this.Utente_idUtente = Utente_idUtente;
        
    }
    
    public Messaggio(int idMessaggio, String messaggio, int ListaSpesa_idListaSpesa, int Utente_idUtente, Timestamp oraInvio) {
        this.idMessaggio = idMessaggio;
        this.messaggio = messaggio;
        this.ListaSpesa_idListaSpesa = ListaSpesa_idListaSpesa;
        this.Utente_idUtente = Utente_idUtente;
        this.oraInvio = oraInvio;
    }

  
    public Messaggio(int idMessaggio, String messaggio, int ListaSpesa_idListaSpesa, int Utente_idUtente) {
        this.idMessaggio = idMessaggio;
        this.messaggio = messaggio;
        this.ListaSpesa_idListaSpesa = ListaSpesa_idListaSpesa;
        this.Utente_idUtente = Utente_idUtente;
    }

    
    public int getIdMessaggio() {
        return idMessaggio;
    }

    public void setIdMessaggio(int idMessaggio) {
        this.idMessaggio = idMessaggio;
    }
    
    public Timestamp getOraInvio() {
        return oraInvio;
    }

    public void setOraInvio(Timestamp oraInvio) {
        this.oraInvio = oraInvio;
    }
    
    public String getMessaggio() {
        return messaggio;
    }

    public void setMessaggio(String messaggio) {
        this.messaggio = messaggio;
    }

    public int getListaSpesa_idListaSpesa() {
        return ListaSpesa_idListaSpesa;
    }

    public void setListaSpesa_idListaSpesa(int ListaSpesa_idListaSpesa) {
        this.ListaSpesa_idListaSpesa = ListaSpesa_idListaSpesa;
    }

    public int getUtente_idUtente() {
        return Utente_idUtente;
    }

    public void setUtente_idUtente(int Utente_idUtente) {
        this.Utente_idUtente = Utente_idUtente;
    }
    
    
    
}
