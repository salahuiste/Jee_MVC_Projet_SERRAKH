package Entity;

import java.io.Serializable;

import javax.persistence.Embeddable;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
@Embeddable
public class KeyPrCom implements Serializable{
	@ManyToOne
	@JoinColumn(name="commande_client_id", nullable=false)
	private CommandeClient commande_client_id;
	@ManyToOne
	@JoinColumn(name="produit_id", nullable=false)
	private Produit produit_id;
	public void setCommandeClientId(CommandeClient id) {
		commande_client_id=id;
	}
	public void setProduitId(Produit id) {
		produit_id=id;
	}
	public CommandeClient getCommandeClient() {
		return commande_client_id;
	}
	public Produit getProduitId() {
		return produit_id;
	}
}
