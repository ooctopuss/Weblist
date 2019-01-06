/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.daos;

import db.entities.AccessoChat;
import db.exceptions.DAOException;

/**
 *
 * @author Safouane
 */
public interface AccessoChatDAO extends DAO<AccessoChat, Integer>{
    public AccessoChat getAccessoChat(int idLista, int idUtente)throws DAOException;
    public void updateAccessoChat(AccessoChat accesso);
    public void deleteAccessoChat(int idLista, int idUtente);
    public void insertAccessoChat(AccessoChat accesso);
    public void insertAccessoChatU(AccessoChat accesso);

}
