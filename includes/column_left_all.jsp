<%-- 
    Document   : column_left_all
    Created on : Nov 27, 2020, 3:23:33 PM
    Author     : Sophie
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<aside id="sidebarA">
    <nav>
      <ul>
        <li><a href="<c:url value='/' />">
                Home</a></li>
        <li><a href="/JavaProject2/catalog/">
                Catalog</a></li>

        <li><a href="/JavaProject2/catalog/1/view.jsp?page=1">
                Automotive</a></li>
        <li><a href="/JavaProject2/catalog/2/view.jsp?page=1">
                Electronics</a></li>
        <li><a href="/JavaProject2/catalog/3/view.jsp?page=1">
                Toys</a></li>
      </ul>
    </nav>
</aside>
