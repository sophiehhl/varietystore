<%-- 
    Document   : view
    Created on : Dec 1, 2020, 11:41:58 PM
    Author     : aaron
--%>
<%@page import="java.util.List"%>
<%@ page import="variety.business.Product" %>
<%@ page import="variety.data.ProductDB" %>
<jsp:include page="/includes/header.jsp" />
<jsp:include page="/includes/column_left_all.jsp" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<section>
        <sql:query var = "products" dataSource="jdbc/javaproject">
        SELECT * FROM products WHERE CategoryID = 3
    </sql:query>
    <h1>Toys</h1>
            <div class="dropdown dropright">
  <a class="btn btn-outline-info btn-sm dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Sort By
  </a>

  <div class="dropdown-menu " aria-labelledby="dropdownMenuLink">
    <a class="dropdown-item" href="/JavaProject2/catalog/3/view1.jsp?page=1">Sort Alphabetically</a>
    <a class="dropdown-item" href="/JavaProject2/catalog/3/view2.jsp?page=1">Sort Alphabetically Z-A</a>
    <a class="dropdown-item" href="/JavaProject2/catalog/3/view3.jsp?page=1">Sort Highest Price</a>
    <a class="dropdown-item" href="/JavaProject2/catalog/3/view4.jsp?page=1">Sort Lowest Price</a>
    <a class="dropdown-item" href="/JavaProject2/catalog/3/view.jsp?page=1">Revert</a>
  </div>
</div>

        <%  
String spageid=request.getParameter("page");  
int pageid=Integer.parseInt(spageid);  
int total=8;  
int pageNumber=0;
if(pageid==1){}  
else{  
    pageid=pageid-1;  
    pageNumber=pageid;
    pageid=pageid*total+1;  
}  
List<Product> list= ProductDB.getRecords(pageid,total,3);
out.print("<table border='1' cellpadding='5'>");  
out.print("<tr><th>ID</th><th>Name</th><th>Price</th>");
for(Product p:list){  
    out.print("<tr><td>"+p.getId()+"</td><td>"+ "<a href='product/" + p.getId() + "'>"+p.getName()+ "</a>" + "</td><td>"+p.getPrice()+"</td></tr>");  
}  
out.print("</table>");  
if(pageNumber==0)
{
out.print("<t>1</t>" + "<a href='view.jsp?page=2'>2</a>" + "<a href='view.jsp?page=3'>3</a>");
}
if(pageNumber==1)
{
out.print("<a href='view.jsp?page=1'>1</a>" + "<t>2</t>" + "<a href='view.jsp?page=3'>3</a>");
}
if(pageNumber==2)
{
out.print("<a href='view.jsp?page=1'>1</a>" + "<a href='view.jsp?page=2'>2</a>" + "<t>3</t>");
}
%>  
</section>

<!-- end the middle column -->
<jsp:include page="/includes/footer.jsp" />
</html>
