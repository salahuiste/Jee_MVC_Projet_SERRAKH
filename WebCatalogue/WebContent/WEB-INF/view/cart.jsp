<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List, cart.Cart, cart.CartItem, Entity.Produit,javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Votre panier</title>
<script>
$('.visibility-cart').on('click',function(){
    
	  var $btn =  $(this);
	  var $cart = $('.cart');
	  console.log($btn);
	  
	  if ($btn.hasClass('is-open')) {
	     $btn.removeClass('is-open');
	     $btn.text('O')
	     $cart.removeClass('is-open');     
	     $cart.addClass('is-closed');
	     $btn.addClass('is-closed');
	  } else {
	     $btn.addClass('is-open');
	     $btn.text('X')
	     $cart.addClass('is-open');     
	     $cart.removeClass('is-closed');
	     $btn.removeClass('is-closed');
	  }

	                  
	});

	  // SHOPPING CART PLUS OR MINUS
	  $('a.qty-minus').on('click', function(e) {
	    e.preventDefault();
	    var $this = $(this);
	    var $input = $this.closest('div').find('input');
	    var value = parseInt($input.val());
	    
	    if (value > 1) {
	      value = value - 1;
	    } else {
	      value = 0;
	    }
	    
	    $input.val(value);
	        
	  });

	  $('a.qty-plus').on('click', function(e) {
	    e.preventDefault();
	    var $this = $(this);
	    var $input = $this.closest('div').find('input');
	    var value = parseInt($input.val());

	    if (value < 100) {
	    value = value + 1;
	    } else {
	      value =100;
	    }

	    $input.val(value);
	  });

	// RESTRICT INPUTS TO NUMBERS ONLY WITH A MIN OF 0 AND A MAX 100
	$('input').on('blur', function(){

	  var input = $(this);
	  var value = parseInt($(this).val());

	    if (value < 0 || isNaN(value)) {
	      input.val(0);
	    } else if
	      (value > 100) {
	      input.val(100);
	    }
	});
</script>
<style>
html {
  background: #bbc3c6;
  font: 62.5%/1.5em "Trebuchet Ms", helvetica;
}

* {
  box-sizing: border-box;
  -webkit-font-smoothing: antialiased;
  font-smoothing: antialiased;
}

@font-face {
    font-family: 'Shopper';
    src: url('http://www.shopperfont.com/font/Shopper-Std.ttf');
}

.shopper {
  text-transform: lowercase;
  font: 2em 'Shopper', sans-serif;
  line-height: 0.5em;
  display: inline-block;
}



h1 {
  text-transform: uppercase;
  font-weight: bold;
  font-size: 2.5em;
}

p {
  font-size: 1.5em;
  color: #8a8a8a;
}

input {
  border: 0.3em solid #bbc3c6;
  padding: 0.5em 0.3em; 
  font-size: 1.4em;
  color: #8a8a8a;
  text-align: center;
}

img {
  max-width: 9em;
  width: 100%;
  overflow: hidden; 
  margin-right: 1em;
}

a {
  text-decoration: none;
}

.container {
  max-width: 75em;
  width: 95%;
  margin: 40px auto;  
  overflow: hidden;
  position: relative;
  
  border-radius: 0.6em;
  background: #ecf0f1;
  box-shadow: 0 0.5em 0 rgba(138, 148, 152, 0.2);
}

.heading {
  padding: 1em;
  position: relative;
  z-index: 1;
  color: #f7f7f7;
  background: #f34d35;
}

.cart {
  margin: 2.5em;
  overflow: hidden;
}

.cart.is-closed {
  height: 0;
  margin-top: -2.5em;
}

.table {
  background: #ffffff;
  border-radius: 0.6em;
  overflow: hidden;
  clear: both;
  margin-bottom: 1.8em;
}


.layout-inline > * {
  display: inline-block;
}

.align-center {
  text-align: center;
}

.th {
  background: #f34d35;
  color: #fff;
  text-transform: uppercase;
  font-weight: bold;
  font-size: 1.5em;
}

.tf {
  background: #f34d35;
  text-transform: uppercase;
  text-align: right;
  font-size: 1.2em;  
}

.tf p {
  color: #fff;
  font-weight: bold;
}

.col {
  padding: 1em;
  width: 12%;
}

.col-pro {
  width: 44%;
}

.col-pro > * {
  vertical-align: middle;
}

.col-qty {
  text-align: center;
  width: 17%;
}

.col-numeric p {
  font: bold 1.8em helvetica;
}

.col-total p {
  color: #12c8b1;
}

.tf .col {
  width: 20%;
}

.row > div {
  vertical-align: middle;
}

.row-bg2 {
  background: #f7f7f7;
}

.visibility-cart {
  position: absolute;
  color: #fff;
  top: 0.5em;
  right: 0.5em;
  font:  bold 2em arial;
  border: 0.16em solid #fff;
  border-radius: 2.5em;
  padding: 0 0.22em 0 0.25em ;
}

.col-qty > * {
  vertical-align: middle; 
}

.col-qty > input {
  max-width: 2.6em;
}


a.qty {
  width: 1em;
  line-height: 1em;
  border-radius: 2em;
  font-size: 2.5em;
  font-weight: bold;
  text-align: center;
  background: #43ace3;  
  color: #fff;
}

a.qty:hover {
  background: #3b9ac6;
}

.btn {
  padding: 10px 30px;
  border-radius: 0.3em;
  font-size: 1.4em;
  font-weight: bold;
  background: #43ace3;
  color: #fff;
  box-shadow: 0 3px 0 rgba(59,154,198, 1)
}

.btn:hover {
  box-shadow: 0 3px 0 rgba(59,154,198, 0)
}

.btn-update {
  float: right;
  margin: 0 0 1.5em 0;
}

.transition {
  transition: all 0.3s ease-in-out;
}

@media screen and ( max-width: 755px) {
  .container {
    width: 98%;
  }
  
  .col-pro {
    width: 35%;
  }
  
  .col-qty {
    width: 22%;
  }
  
  img {
    max-width: 100%;
    margin-bottom: 1em;
  }
}
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
@media screen and ( max-width: 591px) {
  
}
</style>
</head>
<body>
<jsp:include page="./includes/header.jsp" />
<% Cart cart=(Cart) session.getAttribute("cart");%>

<div class="container">
  <div class="heading">
    <h1>
      <span class="shopper">s</span> Shopping Cart
    </h1>
    
    <a href="#" class="visibility-cart transition is-open">X</a>    
  </div>
  
  <div class="cart transition is-open">
    
    <a href="#" class="btn btn-update">Update cart</a>
    
    
    <div class="table">
      
      <div class="layout-inline row th">
        <div class="col col-pro">Produit</div>
        <div class="col col-price align-center "> 
          Prix
        </div>
        <div class="col col-qty align-center">Quantit�</div>
        <div class="col">Total</div>
      </div>
      <% List<CartItem> items=(List<CartItem>) cart.getItems();%>
  			<% for(int i = 0; i < items.size(); i+=1) { %>
      <div class="layout-inline row">
        
        <div class="col col-pro layout-inline">
          <p><%= items.get(i).getProduit().getName()%></p>
        </div>
        
        <div class="col col-price col-numeric align-center ">
          <p><%= String.valueOf(items.get(i).getProduit().getPrix()) %>$</p>
        </div>

        <div class="col col-qty layout-inline">
          <a href="${pageContext.request.contextPath}/cart?remove=<%= items.get(i).getProduit().getId() %>" class="qty qty-minus">-</a>
            <input type="numeric" value="<%=items.get(i).getQuantity()%>" />
          <a href="${pageContext.request.contextPath}/cart?add=<%= items.get(i).getProduit().getId() %>" class="qty qty-plus">+</a>
        </div>
        
        <div class="col col-vat col-numeric">
          <p>0$</p>
        </div>
        <div class="col col-total col-numeric">               <p> <%= String.valueOf(items.get(i).getTotalProduit()) %>$</p>
        </div>
      </div>
      
		<% } %>
  
       <div class="tf">
         <div class="row layout-inline">
           <div class="col"></div>
         </div>
         <div class="row layout-inline">
           <div class="col">
             <p>Shipping</p>
           </div>
           <div class="col"></div>
         </div>
          <div class="row layout-inline">
           <div class="col">
             <p>Total:<%= String.valueOf(cart.getTotal()) %>$</p>
           </div>
           <div class="col"></div>
         </div>
       </div>         
  </div>
    <a href="${pageContext.request.contextPath}/checkout" class="btn btn-update">Passer la commande</a>
  	<a href="${pageContext.request.contextPath}/cart?clear" style="background-color: red;" class="btn btn-update">Vider le panier</a>
</div>
</body>
</html>