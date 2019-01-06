/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.daos;

import db.entities.Logo;

/**
 *
 * @author octopussy
 */
public interface LogoDAO extends DAO<Logo, Integer>{
   public Logo getLogo(String indirizzo);
   public void updateLogo(Logo logo);
   public void deleteLogo(String indirizzo);
   public void insertLogo(Logo logo);
    
}
