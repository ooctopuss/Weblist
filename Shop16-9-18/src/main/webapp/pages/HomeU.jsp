<%-- 
    Document   : Home
    Created on : 29-set-2018, 11.43.24
    Author     : octopussy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>

<c:set var ="title" value="Home" scope="session"></c:set>
<%@include file="nav-bar.jsp" %>



<%@include file="user.jsp" %>
<%@include file="footer.jsp" %>
<%@include file="ControlloProd.jsp" %>
<%@include file="ControlloChat.jsp" %>
<%@include file="ControlloGeo.jsp" %>
