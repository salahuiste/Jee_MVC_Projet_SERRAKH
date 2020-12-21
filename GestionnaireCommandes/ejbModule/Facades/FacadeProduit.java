package Facades;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import Entity.Produit;

@Stateless
public class FacadeProduit extends FacadeAbstraite<Produit>{
	@PersistenceContext(unitName = "boutique")
	private EntityManager em;
	public FacadeProduit() {
		super(Produit.class);
	}
	@Override
	protected EntityManager getEntityManager() {
		// TODO Auto-generated method stub
		return em;
	}

}
