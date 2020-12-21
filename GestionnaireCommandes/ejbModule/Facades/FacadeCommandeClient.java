package Facades;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import Entity.CommandeClient;


@Stateless
public class FacadeCommandeClient extends FacadeAbstraite<CommandeClient> {
	@PersistenceContext(unitName = "boutique")
	private EntityManager em;
	public FacadeCommandeClient() {
		super(CommandeClient.class);
	}
	@Override
	protected EntityManager getEntityManager() {
		// TODO Auto-generated method stub
		return em;
	}
}
