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
public class CategoriaProdotto implements Serializable{
    private int id;
    private String nome;
    private String descrizione;
    private int idLogo;
    private String indirizzoL;
    

    public CategoriaProdotto(int id, String nome, String descrizione, int idLogo) {
        this.id = id;
        this.nome = nome;
        this.descrizione = descrizione;
        this.idLogo = idLogo;
    }
    public CategoriaProdotto(int id, String nome, String descrizione, int idLogo,String indirizzoL) {
        this.id = id;
        this.nome = nome;
        this.descrizione = descrizione;
        this.idLogo = idLogo;
        this.indirizzoL = indirizzoL;
    }
    
      public CategoriaProdotto(String nome, String descrizione, int idLogo) {
       
        this.nome = nome;
        this.descrizione = descrizione;
        this.idLogo = idLogo;
    }


    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    public int getIdLogo() {
        return idLogo;
    }

    public void setIdLogo(int idLogo) {
        this.idLogo = idLogo;
    }

    public String getIndirizzoL() {
        return indirizzoL;
    }

    public void setIndirizzoL(String indirizzoL) {
        this.indirizzoL = indirizzoL;
    }
    
    
    
}
