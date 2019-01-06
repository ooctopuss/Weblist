/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.entities;

import java.io.Serializable;
import org.apache.commons.lang.RandomStringUtils;

/**
 *
 * @author octopussy
 */
public class Immagine implements Serializable{
    private int idImmagine;
    private String indirizzo;
    private int idProdotto;
    private int idCategoriaLista;

    public Immagine(int idImmagine, String indirizzo, int idProdotto,int idCategoriaLista) {
        this.idImmagine = idImmagine;
        this.indirizzo = indirizzo;
        this.idProdotto = idProdotto;
        this.idCategoriaLista = idCategoriaLista;
    }
    
    public Immagine(int idImmagine, String indirizzo, int idProdotto) {
        this.idImmagine = idImmagine;
        this.indirizzo = indirizzo;
        this.idProdotto = idProdotto;
    
    }
    public Immagine(int idImmagine, String indirizzo, int idCat, String c) {
        this.idImmagine = idImmagine;
        this.indirizzo = indirizzo;
        this.idCategoriaLista = idCat;
    
    }

    public Immagine(String indirizzo, int idProdotto) {
        this.indirizzo = indirizzo;
        this.idProdotto = idProdotto;
    }
    public Immagine(String indirizzo, int idCategoriaLista, int cont) {
        this.indirizzo = indirizzo;
        this.idCategoriaLista = idCategoriaLista;
    }
    
    

    public Immagine(int idImmagine, String indirizzo) {
        this.idImmagine = idImmagine;
        this.indirizzo = indirizzo;
    }

    public Immagine(String indirizzo) {
        this.indirizzo = indirizzo;
    }

    public String getIndirizzo() {
        return indirizzo;
    }

    public void setIndirizzo(String indirizzo) {
        this.indirizzo = indirizzo;
    }

    public int getIdImmagine() {
        return idImmagine;
    }

    public void setIdImmagine(int idImmagine) {
        this.idImmagine = idImmagine;
    }
    public static String generateUniqueFileName() {
        String filename = "";
       
        String rndchars = RandomStringUtils.randomAlphanumeric(25);
        filename = rndchars;
        return filename;
    }

    public int getIdProdotto() {
        return idProdotto;
    }

    public void setIdProdotto(int idProdotto) {
        this.idProdotto = idProdotto;
    }

    public int getIdCategoriaLista() {
        return idCategoriaLista;
    }

    public void setIdCategoriaLista(int idCategoriaLista) {
        this.idCategoriaLista = idCategoriaLista;
    }
    
    
}
