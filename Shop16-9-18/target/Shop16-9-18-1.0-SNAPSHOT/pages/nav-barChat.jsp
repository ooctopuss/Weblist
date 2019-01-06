<%-- 
    Document   : nav-bar
    Created on : 29-set-2018, 11.43.38
    Author     : octopussy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <title><c:out value ="${sessionScope.title}"></c:out></title>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="stylesheet" href="../css/bootstrap.min.css">
            <link rel="stylesheet" href="../css/style.css">
            <link rel="stylesheet" href="../css/floating-labels.css">
            <link rel="stylesheet" href="../css/forms.css">
            <link rel="stylesheet" href="../css/chat.css">
            <link rel="stylesheet" href="../css/chat2.css">
            <!--Autocomplete-->
            <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet">
            <!-- INCLUDO FILE PER DATATABLE -->
            <link rel="stylesheet" type="text/css" href="../css/jquery.dataTables.min.css">
            <link rel="stylesheet" type="text/css" href="../css/responsive.dataTables.min.css">
        </head>
        <body>
            