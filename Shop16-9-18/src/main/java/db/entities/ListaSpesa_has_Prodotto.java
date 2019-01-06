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
public class ListaSpesa_has_Prodotto implements Serializable{
    private int idListaSpesa;
    private int idProdotto;
    private int checked;

    public ListaSpesa_has_Prodotto(int idListaSpesa, int idProdotto, int checked) {
        this.idListaSpesa = idListaSpesa;
        this.idProdotto = idProdotto;
        this.checked = checked;
    }

    public ListaSpesa_has_Prodotto(int idListaSpesa, int idProdotto) {
        this.idListaSpesa = idListaSpesa;
        this.idProdotto = idProdotto;
    }

    public int getIdListaSpesa() {
        return idListaSpesa;
    }

    public void setIdListaSpesa(int idListaSpesa) {
        this.idListaSpesa = idListaSpesa;
    }

    public int getIdProdotto() {
        return idProdotto;
    }

    public void setIdProdotto(int idProdotto) {
        this.idProdotto = idProdotto;
    }
    public int getChecked() {
        return checked;
    }

    public void setChecked(int checked) {
        this.checked = checked;
    }
    
    
}
