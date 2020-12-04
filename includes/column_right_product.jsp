<%-- 
    Document   : column_right_product
    Created on : Nov 21, 2020, 9:16:41 PM
    Author     : Sophie
--%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <aside id="sidebarB">
        <form method="post" action="<c:url value='/order/addItem'/>">
            <input type="hidden" name="productId" value="${product.id}">
            <input type="image" src="<c:url value='/images/addtocart.png'/>" 
                   width="113" alt="Add to Cart">
        </form>
    </aside>
