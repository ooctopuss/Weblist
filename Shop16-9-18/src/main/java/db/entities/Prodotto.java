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
public class Prodotto implements Serializable{
    private int id;
    private String nome;
    private String note;
    private int idCategoriaProdotto;
    private String nomeCat;
    private int idLogo;
    private String indirizzoL;
    private int idImmagini;
    private String indirizzoI;
    private int idLista;

    public Prodotto(int id, String nome, String note, int idCategoriaProdotto, String nomeCat, int idLogo, String indirizzoL, int idLista) {
        this.id = id;
        this.nome = nome;
        this.note = note;
        this.idCategoriaProdotto = idCategoriaProdotto;
        this.nomeCat = nomeCat;
        this.idLogo = idLogo;
        this.indirizzoL = indirizzoL;
        this.idLista = idLista;
    }

    public Prodotto(String nome, String note, int idCategoriaProdotto, int idLogo, int idLista) {
        this.nome = nome;
        this.note = note;
        this.idCategoriaProdotto = idCategoriaProdotto;
       
        this.idLogo = idLogo;
        
        this.idLista = idLista;
    }

    
    
            

    public Prodotto() {
    }

    public Prodotto(int id, String nome, String note, int idCategoriaProdotto, int idLogo) {
        this.id = id;
        this.nome = nome;
        this.note = note;
        this.idCategoriaProdotto = idCategoriaProdotto;
        this.idLogo = idLogo;
    }
    
    public Prodotto(int id, String nome, String note, int idCategoriaProdotto, String nomeCat, int idLogo, String indirizzoL,int idImmagini, String indirizzoI){
    
        this.id = id;
        this.nome = nome;
        this.note = note;
        this.idCategoriaProdotto = idCategoriaProdotto;
        this.nomeCat = nomeCat;
        this.idLogo = idLogo;
        this.indirizzoL = indirizzoL;
        this.idImmagini = idImmagini;
        this.indirizzoI = indirizzoI;
    }
    public Prodotto(int id, String nome, String note, int idCategoriaProdotto, String nomeCat, int idLogo, String indirizzoL){
    
        this.id = id;
        this.nome = nome;
        this.note = note;
        this.idCategoriaProdotto = idCategoriaProdotto;
        this.nomeCat = nomeCat;
        this.idLogo = idLogo;
        this.indirizzoL = indirizzoL;
       
    }
    public Prodotto(String nome, String note, int idCategoriaProdotto, int idLogo) {
       
        this.nome = nome;
        this.note = note;
        this.idCategoriaProdotto = idCategoriaProdotto;
        this.idLogo = idLogo;
        
    }

    public int getIdLista() {
        return idLista;
    }

    public void setIdLista(int idLista) {
        this.idLista = idLista;
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

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getIdCategoriaProdotto() {
        return idCategoriaProdotto;
    }

    public void setIdCategoriaProdotto(int idCategoriaProdotto) {
        this.idCategoriaProdotto = idCategoriaProdotto;
    }

    public int getIdLogo() {
        return idLogo;
    }

    public void setIdLogo(int idLogo) {
        this.idLogo = idLogo;
    }

    public int getIdImmagini() {
        return idImmagini;
    }

    public void setIdImmagini(int idImmagini) {
        this.idImmagini = idImmagini;
    }

    public String getNomeCat() {
        return nomeCat;
    }

    public void setNomeCat(String nomeCat) {
        this.nomeCat = nomeCat;
    }

    public String getIndirizzoL() {
        return indirizzoL;
    }

    public void setIndirizzoL(String indirizzoL) {
        this.indirizzoL = indirizzoL;
    }

    public String getIndirizzoI() {
        return indirizzoI;
    }

    public void setIndirizzoI(String indirizzoI) {
        this.indirizzoI = indirizzoI;
    }
    
    
    
}
