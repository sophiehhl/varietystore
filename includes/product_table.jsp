<%-- 
    Document   : product_table
    Created on : Nov 21, 2020, 9:23:31 PM
    Author     : Sophie
--%>
<h1>${product.name}</h1>
<br/>
<img src="${product.imageURL}" width="175" height="175" alt="Album Image">
<p>Product ID: <b> ${product.id} </b></p>
<p>Product Price: <b>$${product.price}</b></p>
<p>${product.details}</p>
