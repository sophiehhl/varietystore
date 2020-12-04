<%-- 
    Document   : complete
    Created on : Nov 28, 2020, 10:56:29 PM
    Author     : Sophie
--%>

<jsp:include page="/includes/header.jsp" />
<jsp:include page="/includes/column_left_all.jsp" />
<%-- Use the following left column instead after you configure a 
     secure connection as described in chapter 15.
<jsp:include page="/includes/column_left_all_absolute.jsp" />
--%>

<!-- begin middle column -->

<section>

<h1>Thank you, ${user.firstName}</h1>

<!-- store email address as a global variable and use EL to display it -->

<p>Your order has been submitted. We have sent your order information to your email.
Look forward to seeing you again soon! :P</p>

</section>

<!-- end middle column -->

<jsp:include page="/includes/footer.jsp" />
