package Facades;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ejb.Stateless;

import Entity.Categorie;
import Entity.Client;

@Stateless
public class FacadeClient extends FacadeAbstraite<Client> {
	@PersistenceContext(unitName = "boutique")
	private EntityManager em;
	public FacadeClient() {
		super(Client.class);
	}
	@Override
	protected EntityManager getEntityManager() {
		// TODO Auto-generated method stub
		return em;
	}
}
