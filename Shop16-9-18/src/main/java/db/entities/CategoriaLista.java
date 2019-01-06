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
public class CategoriaLista implements Serializable{
    private int id;
    private String nome;
    private String descrizione;
    private int idImmagini;
    private String indirizzoI;
    private int idTypes;

    public int getIdTypes() {
        return idTypes;
    }

    public void setIdTypes(int idTypes) {
        this.idTypes = idTypes;
    }
    
    
    
    public CategoriaLista(String nome, String descrizione, int idImmagini, int idTypes) {
      
        this.nome = nome;
        this.descrizione = descrizione;
        this.idImmagini = idImmagini;
        this.idTypes = idTypes;
    }
    public CategoriaLista(String nome, String descrizione, int idTypes) {
      
        this.nome = nome;
        this.descrizione = descrizione;
        this.idTypes = idTypes;
        
    }
    
    public CategoriaLista(int id, String nome, String descrizione,int idTypes) {
        this.id = id;
        this.nome = nome;
        this.descrizione = descrizione;
        this.idTypes = idTypes;

    }
    
    public CategoriaLista(int id, String nome, String descrizione, int idImmagini ,String indirizzoI,int idTypes) {
        this.id = id;
        this.nome = nome;
        this.descrizione = descrizione;
        this.idImmagini = idImmagini;
        this.indirizzoI = indirizzoI;
        this.idTypes = idTypes;
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

    public int getIdImmagini() {
        return idImmagini;
    }

    public void setIdImmagini(int idImmagini) {
        this.idImmagini = idImmagini;
    }

    public String getIndirizzoI() {
        return indirizzoI;
    }

    public void setIndirizzoI(String indirizzoI) {
        this.indirizzoI = indirizzoI;
    }
    
    
    
}
