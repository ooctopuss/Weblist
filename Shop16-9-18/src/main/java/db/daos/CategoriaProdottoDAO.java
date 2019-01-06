/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.daos;

import db.entities.CategoriaProdotto;
import db.exceptions.DAOException;

/**
 *
 * @author octopussy
 */
public interface CategoriaProdottoDAO extends DAO<CategoriaProdotto,Integer>{
    public CategoriaProdotto getCategoriaProdotto(String nome)throws DAOException;
    public void updateCategoriaProdotto(CategoriaProdotto categoria);
    public void deleteCategoriaProdotto(int id);
    public void insertCategoriaProdotto(CategoriaProdotto categoria);
    
}
