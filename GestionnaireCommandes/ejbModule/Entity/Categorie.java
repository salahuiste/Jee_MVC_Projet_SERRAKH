package Entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity

@Table(name="Categorie")
public class Categorie implements Serializable {
@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@Column(name="nom",length=45)
	private String name;
	public Categorie() {
		
	}
	public Categorie(String name) {
		this.name=name;
	}
	public int getId() { return this.id;}
	public void setName(String name) {
		this.name=name;
	}
	public String getName() { return this.name; }
}
