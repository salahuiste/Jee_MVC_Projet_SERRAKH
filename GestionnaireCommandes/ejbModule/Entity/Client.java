package Entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.sun.mail.iap.Response;

@Entity
@Table(name="Client")
public class Client implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@Column(name="nom",length=45)
	private String name;
	@Column(name="email",length=45)
	private String email;
	@Column(name="telephone",length=15)
	private String telephone;
	@Column(name="adresse",length=250)
	private String adresse;
	
	public Client(String name, String email, String telephone, String adresse) {
		this.name=name;
		this.email=email;
		this.telephone=telephone;
		this.adresse=adresse;
	}
	public Client() {
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	
	public String getName() {
		return name;
	}
	public String getEmail() {
		return email;
	}
	public String getTelephone() {
		return telephone;
	}
	public String getAdresse() {
		return adresse;
	}
	public void setName(String name) {
		this.name=name;
	}
	public void setEmail(String email) {
		this.email=email;
	}
	public void setTelephone(String telephone) {
		this.telephone=telephone;
	}
	public void setAdresse(String adresse) {
		this.adresse=adresse;
	}
}
