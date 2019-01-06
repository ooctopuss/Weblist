<%-- 
    Document   : Home
    Created on : 29-set-2018, 11.43.24
    Author     : octopussy
--%>
<%@page isErrorPage="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="internazional.messages" />
<!DOCTYPE html>

<c:set var ="title" value="Errore" scope="session"></c:set>
<html lang="${language}">
    <head>        
        <title><c:out value ="${sessionScope.title}"></c:out></title>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="stylesheet" href="css/bootstrap.min.css">
            <style>
                body, html {
                  height: 100%;
                  margin: 0;
                }

                .bg {
                  /* The image used */
                  background-image: url("TemplateAvatar/error404.png");

                  /* Full height */
                  height: 100%; 

                  /* Center and scale the image nicely */
                  background-position: center;
                  background-repeat: no-repeat;
                  background-size: cover;
                }
            </style>
    </head>
    <body >
        <div class="bg"></div>
    </body>
</html>
