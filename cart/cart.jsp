<%-- 
    Document   : cart
    Created on : Nov 28, 2020, 4:42:22 PM
    Author     : Sophie
--%>

<jsp:include page="/includes/header.jsp" />
<jsp:include page="/includes/column_left_all.jsp" />

<!-- begin middle column -->

<section class="cart">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<h1>Your cart</h1>
  <c:choose>
      <c:when test="${emptyCart != null}">
          <p>Your cart is empty.</p>
      </c:when>
      <c:otherwise>
        <table>
           <tr>
            <th>Qty</th>
            <th>Name</th>
            <th>Price</th>
            <th>Amount</th>
            <th>&nbsp;</th>
         </tr>
          <c:forEach var="item" items="${cart.items}">
            <tr class="cart_row">
              <td>
                <form action="<c:url value='/order/updateItem'/>" method="post">
                  <input class="btn btn-outline-info btn-sm" type="hidden" name="productId" 
                         value="<c:out value='${item.product.id}'/>">
                  <input type=text name="quantity" 
                         value="<c:out value='${item.quantity}'/>" id="quantity">
                  <input class="btn btn-outline-info btn-sm" type="submit" value="Update">
                </form>                  
              </td>
              <td>${item.product.name}</td>
              <td>${item.product.priceCurrencyFormat}</td>
              <td>${item.totalCurrencyFormat}</td>
              <td>
                <form action="<c:url value='/order/removeItem'/>" method="post">
                  <input class="btn btn-outline-info btn-sm" type="hidden" name="productId" 
                         value="<c:out value='${item.product.id}'/>">
                  <input class="btn btn-outline-info btn-sm" type="submit" value="Remove">
                </form>                  
              </td>
            </tr>
          </c:forEach>
            <tr>
              <td colspan="2">
                <p><b>To change the quantity for an item</b>, enter the new quantity 
                      and click on the Update button.</p>
                <p><b>To remove an item</b>, click on the Remove button.</p>
              </td>
              <td colspan="3">&nbsp;</td>
            </tr>
          </table>
      </c:otherwise>
  </c:choose>

<form action="<c:url value='/catalog'/>" method="get" id="float_left">
  <input class="btn btn-outline-info btn-sm" type="submit" value="Continue Shopping">
</form>
  
<c:if test="${emptyCart == null}">
    <!-- Connection is NOT SECURE.  For testing only. -->
    <form action="<c:url value='/order/checkUser'/>" method="post">
      <input class="btn btn-outline-info btn-sm" type="submit" value="Checkout">
    </form>
    <!-- Connection is SECURE.  Before you can use it, you need to configure 
    a secure connection on your system as described in chapter 15, comment
    out the previous form, and remove the comments from the following form. -->
    <!--
    <form action="${absolutePathSecure}/order/checkUser" method="post">
      <input type="submit" value="Checkout">
    </form>
    -->
</c:if>
</section>

<!-- end middle column -->

<jsp:include page="/includes/footer.jsp" />
