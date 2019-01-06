/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.daos;

import db.entities.ListaSpesa_has_Prodotto;
import db.exceptions.DAOException;

/**
 *
 * @author octopussy
 */
public interface ListaSpesa_has_ProdottoDAO extends DAO<ListaSpesa_has_Prodotto, Integer>{
   public ListaSpesa_has_Prodotto getListaP(int idProdotto)throws DAOException;
   public void updateListaP(ListaSpesa_has_Prodotto listaP);
   public void deleteListaP(int idLista, int idProdotto);
   public void insertListaSpesa(ListaSpesa_has_Prodotto lista);
   public boolean checkListaP(int idListaS, int idProdotto);
   public ListaSpesa_has_Prodotto getLista(int idProdotto,int idLista)throws DAOException;
       
}
