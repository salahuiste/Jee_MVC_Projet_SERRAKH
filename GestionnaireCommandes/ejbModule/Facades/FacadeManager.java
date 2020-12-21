package Facades;

import javax.ejb.Stateless;

import java.sql.Date;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.SessionContext;
import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import javax.persistence.Query;

import Entity.Client;
import Entity.CommandeClient;
import Entity.KeyPrCom;
import Entity.Produit;
import Entity.ProduitCommande;
import Entity.Categorie;

@TransactionManagement(value = TransactionManagementType.CONTAINER)
@TransactionAttribute(value = TransactionAttributeType.REQUIRED)
@Stateless(name="boutiqueJNDI")
public class FacadeManager implements BoutiqueEJBRemote,BoutiqueEJBLocal {
	//@PersistenceContext(type = PersistenceContextType.TRANSACTION)
	@PersistenceContext(unitName = "boutique")
	  private EntityManager em;
	@Resource
	  private SessionContext context;
	@EJB 
	  private FacadeCategorie categories;
	@EJB
	  private FacadeProduit produitF; 
	@EJB
	  private FacadeProduitCommande produitcommandeF;
	@EJB
	private FacadeCommandeClient commandeCl;
	public FacadeManager() {
		categories=new FacadeCategorie();
		commandeCl=new FacadeCommandeClient();
	}
	public Client ajouterClient(String name, String email, String telephone, String adresse) {
		Client cl=new Client(name,email,telephone,adresse);
		em.persist(cl);
		return cl;
	}
	public List<Categorie> getAllCategory(){
		Query q=em.createQuery("select c from Categorie c");
		
		 List<Categorie> cat= (List<Categorie>) q.getResultList();
		 return cat;
	}
	public Categorie getCategory(int id) {
		Query q=em.createQuery("select c from Categorie c where c.id=:id_cat").setParameter("id_cat", id);
		Categorie cat=(Categorie) q.getSingleResult();
		
		return cat;
	}
	public Categorie ajouterCategorie(String nom) {
		Categorie ct= new Categorie(nom);
		em.persist(ct);
		return ct;
	}
	@Override
	public Produit getProduct(int id) {
		// TODO Auto-generated method stub
		Query q=em.createQuery("select p from Produit p where p.id=:id_pro").setParameter("id_pro", id);
		Produit pr=(Produit) q.getSingleResult();
		return pr;
	}
	@Override
	public List<Produit> getProducts(int cat) {
		// TODO Auto-generated method stub
		Query q=em.createQuery("select p from Produit p where p.categorie.id=:id_cat").setParameter("id_cat",cat);
		List<Produit> pr=(List<Produit>) q.getResultList();
		return pr;
	}
	@Override
	public CommandeClient ajouterCommandeClient(double montant, Date date_creation, Client cl) {
		CommandeClient commandeCl=new CommandeClient();
		commandeCl.setMontant(montant);
		commandeCl.setClient_id(cl);
		commandeCl.setDate_creation(date_creation);
		Random number = new Random();
	    int i = number.nextInt(999999999);
	    commandeCl.setNo_confirmation(i);
	    em.persist(commandeCl);
		//em.persist(commandeCl);
		return commandeCl;
	}
	@Override
	public ProduitCommande ajouterCommandeProduit(CommandeClient commande, Produit pr, int quantity) {
		ProduitCommande commande_produit=new ProduitCommande();
		KeyPrCom key=new KeyPrCom();
		key.setCommandeClientId(commande);
		key.setProduitId(pr);
		commande_produit.setCle(key);
		commande_produit.setQuantite(quantity);
		em.persist(commande_produit);
		return commande_produit;
	}

}
