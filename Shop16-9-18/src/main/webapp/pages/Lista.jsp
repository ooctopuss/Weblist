<%-- 
    Document   : footer
    Created on : 29-set-2018, 12.00.24
    Author     : octopussy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>


<c:set var ="title" value="Gestisci lista" scope="session"></c:set>

<%@include file="nav-bar.jsp" %>

<%@include file="addList.jsp" %>
<%@include file="footer3.jsp" %>
<%@include file="ControlloProd.jsp" %>
<%@include file="ControlloChat.jsp" %>
<%@include file="ControlloGeo.jsp" %>

<%@include file="footerAuto.jsp" %>
