<%-- 
    Document   : Mappa
    Created on : 30-nov-2018, 0.42.40
    Author     : octopussy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<c:set var ="title" value="Mappa" scope="session"></c:set>
<%@include file="nav-bar.jsp" %>

    
    <div class="embed-responsive embed-responsive-16by9">
  <iframe class="embed-responsive-item" src="${param.mappa}"></iframe>
</div>

    
    
<%@include file="footer.jsp" %>      
  <%@include file="ControlloChat.jsp" %>
<%@include file="ControlloGeo.jsp" %>

