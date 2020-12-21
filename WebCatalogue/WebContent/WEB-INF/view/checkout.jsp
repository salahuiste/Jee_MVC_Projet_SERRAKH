<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List, cart.Cart, cart.CartItem, Entity.Produit,javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
* {box-sizing: border-box;}

body { 
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.header {
  overflow: hidden;
  background-color: #f1f1f1;
  padding: 20px 10px;
}

.header a {
  float: left;
  color: black;
  text-align: center;
  padding: 12px;
  text-decoration: none;
  font-size: 18px; 
  line-height: 25px;
  border-radius: 4px;
}

.header a.logo {
  font-size: 25px;
  font-weight: bold;
}

.header a:hover {
  background-color: #ddd;
  color: black;
}

.header a.active {
  background-color: dodgerblue;
  color: white;
}

.header-right {
  float: right;
}

@media screen and (max-width: 500px) {
  .header a {
    float: none;
    display: block;
    text-align: left;
  }
  
  .header-right {
    float: none;
  }
}
</style>
</head>
<body>

<jsp:include page="./includes/header.jsp" />
<% Cart cart=(Cart) session.getAttribute("cart");
List<CartItem> items=cart.getItems();%>
<% if(cart==null || cart.getItems().size()<=0){ %>
<div align="center">
	<div><h2>Votre panier est vide!</h2></div>
	<div><a href="${pageContext.request.contextPath}/category">Go to shop</a></div>
</div>
<%}else{ %>
<div aligne="center">
	<table>
	<% for(int i=0;i<items.size();i++){ %>
		<tr>
			<td><%= String.valueOf(items.get(i).getQuantity()) %>*<%=items.get(i).getProduit().getName()%></td>
			<td><%= String.valueOf(items.get(i).getTotalProduit())%></td>
		</tr>
	<%} %>
	</table>
</div>
<div class="container" align="center">
  <h2>Form control: input</h2>
  <p>Pour passer votre commande, veuillez remplir les champs ci-dessous:</p>
  <form action="confirmation" method="post">
    <div class="form-group">
      <label for="fullname">Nom et prénom :</label>
      <input type="text" class="form-control" id="fullname" name="fullname" required>
    </div>
    <div class="form-group">
      <label for="email">Email :</label>
      <input type="text" class="form-control" id="email" name="email" required>
    </div>
    <div class="form-group">
      <label for="adresse">Adresse :</label>
      <input type="text" class="form-control" id="adresse" name="adresse" required>
    </div>
    <div class="form-group">
      <label for="tel">Téléphone :</label>
      <input type="text" class="form-control" id="tel" name="tel" >
    </div>
    <div>
    	<button class="btn btn-primary">Valider la commande</button>
    </div>
  </form>
</div>
<% } %>
</body>
</html>
