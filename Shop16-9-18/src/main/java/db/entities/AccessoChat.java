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
public class AccessoChat implements Serializable{
    private int idListaSpesa;
    private int idUtente;
    private Timestamp ultimo;

    public AccessoChat(int idListaSpesa, int idUtente) {
        this.idListaSpesa = idListaSpesa;
        this.idUtente = idUtente;
    }

    public AccessoChat(int idListaSpesa, int idUtente, Timestamp ultimo) {
        this.idListaSpesa = idListaSpesa;
        this.idUtente = idUtente;
        this.ultimo = ultimo;
    }

    public int getIdListaSpesa() {
        return idListaSpesa;
    }

    public void setIdListaSpesa(int idListaSpesa) {
        this.idListaSpesa = idListaSpesa;
    }

    public int getIdUtente() {
        return idUtente;
    }

    public void setIdUtente(int idUtente) {
        this.idUtente = idUtente;
    }

    public Timestamp getUltimo() {
        return ultimo;
    }

    public void setUltimo(Timestamp ultimo) {
        this.ultimo = ultimo;
    }
    
    
    
}
