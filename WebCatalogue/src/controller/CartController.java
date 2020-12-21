package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Hashtable;
import java.util.List;

import javax.jms.Session;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Entity.Client;
import Entity.CommandeClient;
import Entity.Categorie;
import Entity.Produit;
import Entity.ProduitCommande;
import Facades.BoutiqueEJBRemote;
import cart.Cart;
import cart.CartItem;
import global.Global;
@WebServlet(name="cartServlet",urlPatterns= {"/cart","/addtocart","/checkout","/order","/confirmation","/clear"})
public class CartController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		try{
			final Hashtable jndiProperties = new Hashtable();
			jndiProperties.put(Context.URL_PKG_PREFIXES, "org.jboss.ejb.client.naming");
			final Context context = new InitialContext(jndiProperties);
			final String appName = "WebProject";
			final String moduleName = "GestionnaireCommandes";
			//final String distinctName = ""; //localier ejb sur jboss 7.2
			//sur jboss eap n'est plus nécessaire de spécifier distinct name
			final String beanName = "boutiqueJNDI";
			final String viewClassName = BoutiqueEJBRemote.class.getName();
			//HelloEJBRemote remote = (HelloEJBRemote)
			// context.lookup("ejb:"+appName+"/"+moduleName+"/"+
			//"/"+distinctName+"/"+beanName+"!"+viewClassName);
			BoutiqueEJBRemote remote = (BoutiqueEJBRemote) context.lookup("ejb:"+appName+"/"+moduleName+"/"+beanName+"!"+viewClassName);
			HttpSession session = request.getSession(true);
	        String userPath = request.getServletPath();
	        Cart cart=(Cart) session.getAttribute("cart");
	        if(cart==null) {
				cart=new Cart();
				session.setAttribute("cart", cart);
			}
	        if(userPath.equals("/addtocart")) {
	        	String productId=request.getQueryString();
	        	if(productId!=null) {
	        		int product_id=Integer.parseInt(productId);
	        		Produit pr=remote.getProduct(product_id);
	        		cart.addItem(pr);
	        	}
	        	cart(request,response);
	        }
	        else if(userPath.equals("/cart")) {
	        	String cart_op=request.getQueryString();
	        	System.out.println(cart_op);
	        	System.out.println(request.getParameter("add"));
	        	if(cart_op!=null && cart_op.equals("clear")) {
	        		cart.clear();
	        	}else if(cart_op!=null && cart_op.contains("add")) {
	        		System.out.println(request.getParameter("add"));
	        		cart.incrementProduct(Integer.valueOf(request.getParameter("add")));
	        	}else if(cart_op!=null && cart_op.contains("remove")) {
	        		cart.decrementProduct(Integer.valueOf(request.getParameter("remove")));
	        	}
	        	if(cart.getItems().size()==0) {
	        		cart_empty(request,response);
	        	}else {
	        		cart(request,response);
	        	}
	        }
	        else if(userPath.equals("/checkout")) {
	        	checkout(request,response);
	        }
	        else if(userPath.equals("/clear")) {
	        	cart.clear();
	        }
			}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		try{
			final Hashtable jndiProperties = new Hashtable();
			jndiProperties.put(Context.URL_PKG_PREFIXES, "org.jboss.ejb.client.naming");
			final Context context = new InitialContext(jndiProperties);
			final String appName = "WebProject";
			final String moduleName = "GestionnaireCommandes";
			//final String distinctName = ""; //localier ejb sur jboss 7.2
			//sur jboss eap n'est plus nécessaire de spécifier distinct name
			final String beanName = "boutiqueJNDI";
			final String viewClassName = BoutiqueEJBRemote.class.getName();
			//HelloEJBRemote remote = (HelloEJBRemote)
			// context.lookup("ejb:"+appName+"/"+moduleName+"/"+
			//"/"+distinctName+"/"+beanName+"!"+viewClassName);
			BoutiqueEJBRemote remote = (BoutiqueEJBRemote) context.lookup("ejb:"+appName+"/"+moduleName+"/"+beanName+"!"+viewClassName);
			HttpSession session = request.getSession(true);
	        String userPath = request.getServletPath();
	        Cart cart=(Cart) session.getAttribute("cart");
	        if(cart==null) {
				cart=new Cart();
				session.setAttribute("cart", cart);
			}
	        if(userPath.equals("/confirmation")) {
	        	java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTime().getTime());
	        	//checkout(request,response);
	        	System.out.println("Client : "+request.getParameter("fullname")+" "+request.getParameter("email")+" "+request.getParameter("adresse"));
	        	Client cl=(Client)remote.ajouterClient(request.getParameter("fullname"), request.getParameter("email"), request.getParameter("adresse"), request.getParameter("tel"));
	        	CommandeClient comCl=(CommandeClient) remote.ajouterCommandeClient(cart.getTotal(), date, cl);
	        	for(int i=0;i<cart.getItems().size();i++) {
	        		CartItem cartItem=cart.getItems().get(i);
	        		ProduitCommande pr_com=(ProduitCommande) remote.ajouterCommandeProduit(comCl, cartItem.getProduit(), cartItem.getQuantity());
	        	}
	        	System.out.println("Order has been placed!");
	        	confirmation(request,response);
	        	//end the session
	        	session.invalidate();
 	        } 
			}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	private void cart(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.getRequestDispatcher(Global.cart).forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		};
	}
	private void cart_empty(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.getRequestDispatcher(Global.cart_empty).forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		};
	}
	private void checkout(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.getRequestDispatcher(Global.checkout).forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		};
	}
	private void confirmation(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.getRequestDispatcher(Global.order).forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		};
	}
}
