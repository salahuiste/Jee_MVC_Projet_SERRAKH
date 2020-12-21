package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Hashtable;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entity.Categorie;
import Entity.Produit;
import Facades.BoutiqueEJBRemote;
import Facades.FacadeCategorie;
import Facades.FacadeManager;
import global.Global;

import javax.naming.Context;
import javax.naming.InitialContext;

@WebServlet(name="global_serv",urlPatterns= {"/home","/category","/category/*"})
public class Controller extends HttpServlet{
	private static final long serialVersionUID = 1L;
	//private FacadeManager manager=new FacadeManager();
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
			List<Categorie> cat=remote.getAllCategory();
			String[] action=request.getRequestURI().split("/");
			String method=request.getMethod().toLowerCase();			
			if((action.length==1 ||action[2].equals("home")) && method.equals("get")) {
				home(request,response);
			}
			else if(action[2].equals("category") && method.equals("get")) {
				/*String categoryId=request.getQueryString();
				System.out.println("ID : "+categoryId);*/
				if(action.length<=3) {
					request.setAttribute("category", remote.getAllCategory());
					category(request,response);
				}else {
					int categoryId=Integer.parseInt(action[3]);
					List<Produit> pro=remote.getProducts(categoryId);
					System.out.println("Size of products : "+pro.size());
					request.setAttribute("category", remote.getCategory(categoryId));
					request.setAttribute("products", pro);
					product_cat(request,response);
				}
				
				
			}
			}
		catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	private void product_cat(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.getRequestDispatcher(Global.product_cat).forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		};
		
	}
	private void home(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.getRequestDispatcher(Global.home).forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		};
	}
	private void category(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.getRequestDispatcher(Global.category).forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		};
	}

}
