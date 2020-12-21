package cart;

import Entity.Produit;

public class CartItem {
	private Produit produit;
	private short quantity;
	public CartItem() {}
	public CartItem(Produit produit, short quantity) {
		this.produit=produit;
		this.quantity=quantity;
	}
	public void setProduit(Produit pr) { this.produit=produit;}
	public void setQuantity(short qt) { this.quantity=qt;}
	public short getQuantity() { return quantity;}
	public Produit getProduit() { return produit;}
	public void addItem() {
		quantity++;
	}
	public void removeItem() {
		quantity--;
	}
	public double getTotalProduit() {
		double prixTotal=0;
		prixTotal=quantity*produit.getPrix();
		return prixTotal;
	}
 }
