<%-- 
    Document   : CategListe
    Created on : 30-set-2018, 16.23.01
    Author     : octopussy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>




<c:set value ="Categoria lista" var ="title" scope="session"></c:set>
<%@include file="nav-bar.jsp" %>

<%@include file="TabellaCL.jsp" %>
<%@include file="footer2.jsp" %>
