<%@ page import="java.util.List, Entity.Categorie, Entity.Produit,javax.servlet.http.HttpServletRequest" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {box-sizing: border-box;}

body { 
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.example_b {
	color: #fff !important;
	text-transform: uppercase;
	text-decoration: none;
	background: #60a3bc;
	padding: 20px;
	border-radius: 50px;
	display: inline-block;
	border: none;
	transition: all 0.4s ease 0s;
	font-size:10px;
	width:100%;
	height:10%;
}
.example_b:hover {
	text-shadow: 0px 0px 6px rgba(255, 255, 255, 1);
	-webkit-box-shadow: 0px 5px 40px -10px rgba(0,0,0,0.57);
	-moz-box-shadow: 0px 5px 40px -10px rgba(0,0,0,0.57);
	transition: all 0.4s ease 0s;
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
.styled-table {
    border-collapse: collapse;
    margin: 25px 0;
    font-size: 0.9em;
    font-family: sans-serif;
    min-width: 400px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}
.styled-table thead tr {
    background-color: #009879;
    color: #ffffff;
    text-align: left;
}
.styled-table th,
.styled-table td {
    padding: 12px 15px;
}
.styled-table tbody tr {
    border-bottom: 1px solid #dddddd;
}

.styled-table tbody tr:nth-of-type(even) {
    background-color: #f3f3f3;
}

.styled-table tbody tr:last-of-type {
    border-bottom: 2px solid #009879;
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

<div style="padding-left:20px;" align="center">
	<div>
		<%Categorie cat=(Categorie)request.getAttribute("category");%>
		<h1><%=cat.getName()%></h1>
	</div>
  	<div>
  		<table class="styled-table">
  		<thead>
	  		<tr>
	  			<th>ID</th>
	  			<th>Produit</th>
	  			<th>Description</th>
	  			<th>Prix</th>
	  			<th>Action</th>
	  		</tr>
  		</thead>
  		<tbody>
  			<% List<Produit> prod=(List<Produit>)request.getAttribute("products");%>
  			<% for(int i = 0; i < prod.size(); i+=1) { %>
	        <tr>
	        	<td><%=prod.get(i).getId() %></td>      
	            <td><%=prod.get(i).getName()%></td>
	            <td><%=prod.get(i).getDescription()%></td>
	            <td><%=prod.get(i).getPrix()%></td>
	            <td><a class="example_b" href="${pageContext.request.contextPath}/addtocart?<%=prod.get(i).getId()%>" rel="nofollow noopener">Ajouter au panier</a></td>
	        </tr>
			    <% } %>
  			</tbody>
  		</table>
  	</div>
</div>
</body>
</html>
