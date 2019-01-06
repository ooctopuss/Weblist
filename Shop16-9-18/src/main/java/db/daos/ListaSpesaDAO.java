/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.daos;

import db.entities.ListaSpesa;
import db.exceptions.DAOException;

/**
 *
 * @author octopussy
 */
public interface ListaSpesaDAO extends DAO<ListaSpesa, Integer>{
   public ListaSpesa getListaSpesa(int id);
   public void updateListaSpesa(ListaSpesa lista);
   public void deleteListaSpesa(int id);
   public void insertListaSpesa(ListaSpesa lista);
   public ListaSpesa getListaImmagine(int idImmagine) throws DAOException;
    
}
