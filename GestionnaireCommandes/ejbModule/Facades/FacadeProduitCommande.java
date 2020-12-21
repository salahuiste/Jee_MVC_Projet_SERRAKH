package Facades;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import Entity.ProduitCommande;

@Stateless
public class FacadeProduitCommande extends FacadeAbstraite<ProduitCommande> {
	@PersistenceContext(unitName = "boutique")
	EntityManager em;
	
	public FacadeProduitCommande() {
		super(ProduitCommande.class);
	}
	@Override
	protected EntityManager getEntityManager() {
		// TODO Auto-generated method stub
		return em;
	}
}
