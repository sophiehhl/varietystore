<%-- 
    Document   : index
    Created on : Nov 21, 2020, 9:34:25 PM
    Author     : Sophie
--%>

<jsp:include page="/includes/header.jsp" />
<jsp:include page="/includes/column_left_all.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!-- start the middle column -->

<section>
    
    <h1>Categories</h1>
<sql:query var="product" dataSource="jdbc/javaproject">
    SELECT * FROM categories
</sql:query>

            <c:forEach var="products" items="${product.rows}">
                <br/><a href="/JavaProject2/catalog/${products.CategoryID}/view.jsp?page=1"><c:out value="${products.CategoryName}" /></a>

            </c:forEach>

</section>

<!-- end the middle column -->


<jsp:include page="/includes/footer.jsp" />
