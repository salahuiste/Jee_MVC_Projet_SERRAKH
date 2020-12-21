package Facades;
import java.sql.Date;
import java.util.List;

import javax.ejb.Remote;

import Entity.Categorie;
import Entity.Client;
import Entity.CommandeClient;
import Entity.Produit;
import Entity.ProduitCommande;

@Remote
public interface BoutiqueEJBRemote {
	public Client ajouterClient(String name, String email, String telephone, String adresse);
	public List<Categorie> getAllCategory();
	public Categorie getCategory(int id);
	public Categorie ajouterCategorie(String nom);
	public Produit getProduct(int id);
	public List<Produit> getProducts(int cat);
	public CommandeClient ajouterCommandeClient(double montant,Date date_creation, Client cl);
	public ProduitCommande ajouterCommandeProduit(CommandeClient commande, Produit pr, int quantity);
}
