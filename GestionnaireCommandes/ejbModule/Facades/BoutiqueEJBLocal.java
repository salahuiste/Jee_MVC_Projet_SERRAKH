package Facades;
import java.sql.Date;
import java.util.List;

import javax.ejb.Local;

import Entity.Categorie;
import Entity.Client;
import Entity.CommandeClient;
import Entity.Produit;
import Entity.ProduitCommande;

@Local
public interface BoutiqueEJBLocal {
	public Client ajouterClient(String name, String email, String telephone, String adresse);
	public List<Categorie> getAllCategory();
	public Categorie getCategory(int id);
	public Categorie ajouterCategorie(String nom);
	public CommandeClient ajouterCommandeClient(double montant, Date date_creation, Client cl);
	public ProduitCommande ajouterCommandeProduit(CommandeClient commande, Produit pr, int quantity);

}
