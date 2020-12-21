package Entity;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Produit")
public class Produit implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@Column(name="nom",length=45)
	private String name;
	@Column(name="prix")
	private double prix;
	@Column(name="description",length=250)
	private String description;
	@Column(name="dernier_maj")
	private Timestamp dernier_maj;
	@ManyToOne
	private Categorie categorie;
	public Produit() {
		
	}
	public Produit(String name, double prix, String description, Timestamp dernier_maj) {
		this.name = name; this.prix = prix; this.description = description; this.dernier_maj = dernier_maj;
	}
	public void setName(String name) {this.name = name;}
	
	public void setPrix(double prix) {this.prix = prix;}
	
	public void setDescription(String description) { this.description = description;}
	public void setCategorie(Categorie cat) {
		this.categorie=cat;
	}
	public int getId() { return this.id;}
	public String getName() {return(this.name);}
	public String getDescription() {return(this.description);}
	public Timestamp getDernierMaj() {return(this.dernier_maj);}
	public double getPrix() {return(this.prix); }
	public Categorie getCategorie() {
		return this.categorie;
	}
	
	
	

	
	
}