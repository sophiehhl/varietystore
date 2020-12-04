<%-- 
    Document   : header
    Created on : Nov 21, 2020, 8:59:19 PM
    Author     : Sophie
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
    <head>
    <meta charset="utf-8">
    <title>Variety Store</title>
    <link rel="shortcut icon" href="<c:url value='/images/favicon.ico'/>">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value='/styles/main.css'/> ">

    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    </head>
<body>

    <header>
        <img src="<c:url value='/images/logo.png'/>" 
             alt="Variety Store Logo" width="85">
        <h1>Variety Store</h1>
        <h2>All kinds of things here!</h2>
    </header>
    <nav id="nav_bar">
        <ul>
            <li><a href="<c:url value='/order/showCart'/>">
                    Show Cart</a></li>
        </ul>
    </nav>
</html>
