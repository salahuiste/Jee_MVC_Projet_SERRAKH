package cart;

import java.util.ArrayList;
import java.util.List;

import Entity.Produit;

public class Cart {
	private List<CartItem> products;
	private int nbItems;
	private double total;
	public Cart() {
		products=new ArrayList<CartItem>();
		nbItems=0;
		total=0;
	}
	private int isNewItem(Produit pr) {
		for(int i=0;i<products.size();i++) {
			if(products.get(i).getProduit().getId()==pr.getId())
				return i;
		}
		return -1;
	}
	public synchronized void addItem(Produit pr) {
		int indexPr=isNewItem(pr);
		//si le produit existe déjâ dans le panier on incrèmente la quantité
			if(indexPr>=0) {
				products.get(indexPr).addItem();
			}else {
				CartItem cItem=new CartItem(pr,(short) 1);
				products.add(cItem);
			}
	}
	public synchronized CartItem getProduct(int id) {
		for(int i=0;i<products.size();i++) {
			if(products.get(i).getProduit().getId()==id) {
				return products.get(i);
			}
		}
		return null;
	}
	public synchronized void incrementProduct(int id_pro) {
		CartItem item=getProduct(id_pro);
		Short quantity=(short) ((short)item.getQuantity()+1);
		update(item.getProduit(),quantity.toString());
	}
	public synchronized void decrementProduct(int id_pro) {
		CartItem item=getProduct(id_pro);
		Short quantity=(short) ((short)item.getQuantity()-1);
		update(item.getProduit(),quantity.toString());
	}
	public synchronized void update(Produit pro, String quantite) {
		if(pro==null)
			return;
		short qty=-1;
		qty=Short.parseShort(quantite);
		System.out.println(qty);
		if(qty>=0) {
			for(int i=0;i<products.size();i++) {
				if(products.get(i).getProduit().getId()==pro.getId()) {
					if(qty!=0) {
						products.get(i).setQuantity(qty);
					}
				}else { //si la quantité == 0, on retire/supprime le produit du panier
					products.remove(products.get(i));
					break;
				}
			}
		}
	}
	public synchronized int getTotalOfItems() {
		int quantity=0;
		for(int i=0;i<products.size();i++) {
			quantity+=products.get(i).getQuantity();
		}
		return quantity;
	}
	public synchronized List<CartItem> getItems() {

	    return products;
	  }
	public synchronized double getSubTotal() {
		double total=0;
		for(int i=0;i<products.size();i++) {
			total+=products.get(i).getQuantity()*products.get(i).getProduit().getPrix();
		}
		return total;
	}
	public synchronized double getTotal() {
		this.total=getSubTotal();
		return this.total;
	}
	public synchronized void clear() {
		products.clear();
		total=0;
		nbItems=0;
	}
}
