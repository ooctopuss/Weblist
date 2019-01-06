/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.daos;

import db.entities.Immagine;
import db.exceptions.DAOException;
import java.util.List;

/**
 *
 * @author octopussy
 */
public interface ImmagineDAO extends DAO<Immagine, Integer>{
   public Immagine getImmagine(String indirizzo);
   public void updateImmagine(Immagine immagine);
   public void deleteImmagine(String indirizzo);
   public void insertImmagine(Immagine immagine);
   public void insertImmagineProdotto(Immagine immagine);
   public void insertImmagineCategoriaLista(Immagine immagine);
   public List<Immagine> getAllImmaginiProdotto(int idProdotto);
   public List<Immagine> getAllImmaginiCategoriaLista(int idCategoriaLista);
   public List<Immagine> getAllProdotto()throws DAOException;
   public List<Immagine> getAllCategoriaLista()throws DAOException;
   public Long lastId() throws DAOException;
   
}
