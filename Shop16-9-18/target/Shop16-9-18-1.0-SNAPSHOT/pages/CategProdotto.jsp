<%-- 
    Document   : CategProdotto
    Created on : 30-set-2018, 16.22.18
    Author     : octopussy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>




<c:set var ="title" scope="session" value ="Categorie prodotti"></c:set>
<%@include file="nav-bar.jsp" %>
<%@include file="TabellaCP.jsp" %>
<%@include file="footer2.jsp" %>