package Entity;

import java.io.Serializable;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Produit_commande")
public class ProduitCommande implements Serializable{
	@EmbeddedId
	private KeyPrCom cle;
	private int quantite;
	public ProduitCommande() {}
	public ProduitCommande(KeyPrCom cle, int quantite) {
		this.cle=cle;
		this.quantite = quantite;
	}
	
	
	
	public void setCle(KeyPrCom cle) {this.cle = cle;}	
	public void setQuantite( int quantite) {	this.quantite = quantite;	}
	
	public KeyPrCom getCommande_client_id() {	return this.cle;	}
	public int getQuantite() {	return this.quantite;	}
	
}
