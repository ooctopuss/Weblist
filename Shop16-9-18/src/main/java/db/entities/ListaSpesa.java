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
public class ListaSpesa implements Serializable {
    private int id;
    private String nome;
    private String descrizione;
    private int idCategoriaLista;
    private int idImmagine;

    public ListaSpesa(String nome, String descrizione, int idCategoriaLista, int idImmagine) {
        this.nome = nome;
        this.descrizione = descrizione;
        this.idCategoriaLista = idCategoriaLista;
        this.idImmagine = idImmagine;
    }
    

    public ListaSpesa(int id, String nome, String descrizione, int idCategoriaLista,int idImmagine) {
        this.id = id;
        this.nome = nome;
        this.descrizione = descrizione;
        this.idCategoriaLista = idCategoriaLista;
        this.idImmagine = idImmagine;
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

    public int getIdCategoriaLista() {
        return idCategoriaLista;
    }

    public void setIdCategoriaLista(int idCategoriaLista) {
        this.idCategoriaLista = idCategoriaLista;
    }

    public int getIdImmagine() {
        return idImmagine;
    }

    public void setIdImmagine(int idImmagine) {
        this.idImmagine = idImmagine;
    }
    
    
    
    
}
