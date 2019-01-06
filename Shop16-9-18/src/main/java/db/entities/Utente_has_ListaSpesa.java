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
public class Utente_has_ListaSpesa implements Serializable{
    private int idUtente;
    private int idListaSpesa;
    private int proprietario;
    private int modCat;
    private int aggProd;
    private int elProd;
    private int elLista;

    public Utente_has_ListaSpesa(int idUtente, int idListaSpesa, int proprietario, int modCat, int aggProd, int elProd, int elLista) {
        this.idUtente = idUtente;
        this.idListaSpesa = idListaSpesa;
        
        this.proprietario = proprietario;
        this.modCat = modCat;
        this.aggProd = aggProd;
        this.elProd = elProd;
        this.elLista = elLista;
    }

    public Utente_has_ListaSpesa(int proprietario, int modCat, int aggProd, int elProd, int elLista) {
        this.proprietario = proprietario;
        this.modCat = modCat;
        this.aggProd = aggProd;
        this.elProd = elProd;
        this.elLista = elLista;
    }
    
    

    public Utente_has_ListaSpesa(int idUtente, int idListaSpesa) {
        this.idUtente = idUtente;
        this.idListaSpesa = idListaSpesa;
        
    }

    public int getIdUtente() {
        return idUtente;
    }

    public void setIdUtente(int idUtente) {
        this.idUtente = idUtente;
    }

    public int getIdListaSpesa() {
        return idListaSpesa;
    }

    public void setIdListaSpesa(int idListaSpesa) {
        this.idListaSpesa = idListaSpesa;
    }

    
    public int getProprietario() {
        return proprietario;
    }

    public void setProprietario(int proprietario) {
        this.proprietario = proprietario;
    }

    public int getModCat() {
        return modCat;
    }

    public void setModCat(int modCat) {
        this.modCat = modCat;
    }

    public int getAggProd() {
        return aggProd;
    }

    public void setAggProd(int aggProd) {
        this.aggProd = aggProd;
    }

    public int getElProd() {
        return elProd;
    }

    public void setElProd(int elProd) {
        this.elProd = elProd;
    }

    public int getElLista() {
        return elLista;
    }

    public void setElLista(int elLista) {
        this.elLista = elLista;
    }
    
    
    
}
