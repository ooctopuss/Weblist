<%-- 
    Document   : Utenti
    Created on : 12-ott-2018, 22.57.20
    Author     : octopussy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>




<c:set value="Utenti" var ="title" scope="session"></c:set>

<%@include file="nav-bar.jsp" %>
<%@include file="TabellaUtenti.jsp" %>
<%@include file="footer2.jsp" %>