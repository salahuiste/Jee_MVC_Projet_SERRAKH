package Facades;

import javax.persistence.EntityManager;

import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceUtil;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import Entity.Categorie;

@Stateless
public class FacadeCategorie extends FacadeAbstraite<Categorie> {
	@PersistenceContext(unitName = "boutique")
	private EntityManager em;
	public FacadeCategorie() {
		super(Categorie.class);
	}
	@Override
	protected EntityManager getEntityManager() {
		// TODO Auto-generated method stub
		return em;
	}

}
