/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.daos;

import db.entities.CategoriaLista;
import db.exceptions.DAOException;

/**
 *
 * @author octopussy
 */
public interface CategoriaListaDAO extends DAO<CategoriaLista, Integer>{
    public CategoriaLista getCategoriaLista(String nome)throws DAOException;
    public void updateCategoriaLista(CategoriaLista categoria);
    public void deleteCategoriaLista(int id);
    public void insertCategoriaLista(CategoriaLista categoria);
    public CategoriaLista getCatIdTypes(int idTypes) throws DAOException;
    
}
