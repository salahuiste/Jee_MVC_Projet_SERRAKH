package Entity;


import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="Commande_client")
public class CommandeClient implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@Column(name="montant")
	private double montant;
	@Column(name="date_creation")
	private Date date_creation;
	@Column(name="no_confirmation")	
	private int no_confirmation;
	//@ManyToOne
	//@Column(name="client_id")
	@ManyToOne
	@JoinColumn(name="client_id", nullable=false)
	private Client client_id;
	
	public CommandeClient() {}
	public CommandeClient(double montant, Date date_creation, int no_confirmation, Client client_id) {
		this.client_id = client_id; 
		this.montant = montant;
		this.date_creation = date_creation;
		this.no_confirmation = no_confirmation;
		
	}
	
	public void setMontant(double montant) {this.montant = montant;}
	public void setDate_creation(Date date_creation) {this.date_creation = date_creation;}
	public void setNo_confirmation(int no_confirmation) { this.no_confirmation = no_confirmation;}

	public void setClient_id(Client client_id) {this.client_id = client_id;}
	
	public double getMontant() {return(this.montant);}
	public Date getDate_creation() {return(this.date_creation);}
	public int getNo_confirmation() {return(this.no_confirmation);}
	public Client getClient_id() {return(this.client_id);}
	
}
