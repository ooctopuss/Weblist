/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.daos;

import db.entities.Prodotto;
import db.exceptions.DAOException;
import java.util.List;

/**
 *
 * @author octopussy
 */
public interface ProdottoDAO extends DAO<Prodotto,Integer>{
    public Prodotto getProdottoPerCategoria(int id)throws DAOException ;
    public void updateProdotto(Prodotto prodotto);
    public void deleteProdotto(int id);
    public void insertProdotto(Prodotto prodotto);
    public Prodotto getId(int idLogo);
    public void insertProdottoLista(Prodotto prodotto);
    public void deleteProdottoLista(int idLista);
    public List<Prodotto> getProdottoLista();
    
    
}
