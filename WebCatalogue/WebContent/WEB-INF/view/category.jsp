<%@ page import="java.util.List, Entity.Categorie,javax.servlet.http.HttpServletRequest" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="./css/basic_style.css">
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

<div style="padding-left:20px;" align="center">
	<div>
		<h1>Categorie</h1>
	</div>
  	<div>
  		<table class="table">
  		
  			<% List<Categorie> cats=(List<Categorie>)request.getAttribute("category");%>
  			<% for(int i = 0; i < cats.size(); i+=1) { 
  				int r=252,g=194,b=189;
  				if(i%2==0){
  					r=255;
  					g=168;
  					b=168;
  				}
  			%>
        <tr>      
            <td style="text-align:center; font-size:1.2em; background-color: rgba(<%=r%>, <%=g%>, <%=b%>, 0.5);"><a style="text-decoration:none;" href="${pageContext.request.contextPath}/category/<%=cats.get(i).getId() %>"><%=cats.get(i).getName()%></a></td>
        </tr>
		    <% } %>
  			
  		</table>
  	</div>

</div>
</body>
</html>
