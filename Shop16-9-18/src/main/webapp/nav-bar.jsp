<%-- 
    Document   : nav-bar
    Created on : 29-set-2018, 11.43.38
    Author     : octopussy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="internazional.messages" />
<!DOCTYPE html>
<html lang="${language}">
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
            <!--Autocomplete-->
            <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet">
            <!-- INCLUDO FILE PER DATATABLE -->
            <link rel="stylesheet" type="text/css" href="../css/jquery.dataTables.min.css">
            <link rel="stylesheet" type="text/css" href="../css/responsive.dataTables.min.css">
        </head>
        <body>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <c:if test = "${sessionScope.utente.admin == null}">
                <a class="navbar-brand" href="HomeU.jsp"><fmt:message key="navbar.title" /></a>
            </c:if>  
            <c:if test="${sessionScope.utente.admin == 1}">
                <a class="navbar-brand" href="Home.jsp"><fmt:message key="navbar.title" /></a>
            </c:if>
            <c:if test = "${sessionScope.utente.admin == 0}">
                <a class="navbar-brand" href="HomeU.jsp"><fmt:message key="navbar.title" /></a>
            </c:if>
             <c:choose>
                    <c:when test = "${language == 'en'}">
                        <img src="TemplateAvatar/en.gif" width="30" height="25" />
                    </c:when>
                    <c:when test = "${language == 'it'}">
                        <img src="TemplateAvatar/it.gif" width="30" height="25" />
                    </c:when>
                </c:choose>    
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"><img src="../TemplateAvatar/notifica.png" class="notify" width="8" height="8" /></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
                    <ul class="navbar-nav ">
                        <li class="nav-item active text-center">
                            <a class="nav-link" href="HomeU.jsp">
                                <img src="TemplateAvatar/home.png" width="25" height="25" />
                            </a>
                        </li>
                    <c:if test ="${sessionScope.utente.admin == 1}">
                        <li class="nav-item active text-center">
                            <a class="nav-link" href="Home.jsp">
                                <img src="TemplateAvatar/home.png" width="25" height="25" />
                            </a>
                        </li> 
                    </c:if>
                        
                    <c:if test ="${sessionScope.utente.admin == 0}">
                        <li class="nav-item active text-center">
                            <a class="nav-link" href="HomeU.jsp">
                                <img src="TemplateAvatar/home.png" width="25" height="25" />
                            </a>
                        </li> 
                    </c:if>
                    <c:if test="${sessionScope.utente.admin == 0}">
                     <!--CHAT-->
                        <li class="nav-item dropdown text-center">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img src="TemplateAvatar/chat2.png" width="25" height="25" />
                            </a>

                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">

                                <a class="nav-link text-center" href="Chat.jsp"></a>
                                <div class="dropdown-divider"></div>
                                </div>
                            </li>
                    </c:if>
<!--#############################################            NOTIFICHE               ###################################################################################-->
                    <li class="nav-item dropdown text-center">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img src="TemplateAvatar/bell3.png" width="22" height="22" />
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">

                                <a class="nav-link text-center" href="Chat.jsp">NUOVA NOTIFICA</a>
                                <div class="dropdown-divider"></div>
                                </div>
                            </li>
<!--#############################################            NOTIFICHE               ###################################################################################-->                
                    <c:if test="${sessionScope.utente.admin == 1}">
                        <li class="nav- item text-center">
                            <a class="nav-link" href="Utenti.jsp">
                                <img src="TemplateAvatar/users.png" width="25" height="25" />
                            </a>
                        </li>
                    </c:if>
                    <c:choose>
                        <c:when test="${sessionScope.utente.admin == 1}">
                            <li class="nav-item dropdown text-center">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <img src="TemplateAvatar/list.png" width="25" height="25" />
                                </a>

                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">

                                    <a class="nav-link text-center" href="Prodotto.jsp"><fmt:message key="card.products" /></a>
                                    <div class="dropdown-divider"></div>
                                    <a class="nav-link text-center" href="CategProdotto.jsp"><fmt:message key="card.categoryProd" /></a>
                                    <div class="dropdown-divider"></div>
                                    <a class="nav-link text-center" href="CategListe.jsp"><fmt:message key="card.categoryLists" /></a>
                                </div>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item dropdown text-center">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                   <img src="TemplateAvatar/list.png" width="25" height="25" />
                                </a>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">                                    
                                    <a class="nav-link text-center" href="chkListe.jsp"><fmt:message key="button.lists" /></a>
                                </div>
                            </li>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${sessionScope.utente == null }">
                            <li class="nav-item text-center">
                                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#loginModal"><fmt:message key="button.login" /></button>
                            </li>
                            <li class="nav-item text-center">
                                <a class="nav-link"> </a>
                            </li>
                            <li class="nav-item text-center">
                                <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#regModal"><fmt:message key="button.register" /></button>
                            </li>    

                        </c:when>    
                        <c:otherwise>
                            <li class="nav- item text-center">
                                <a class="nav-link" href="Account.jsp">
                                    <img src="TemplateAvatar/settings.png" width="25" height="25" />
                                </a>
                            </li>
                            <li class="nav- item text-center">
                                <a class="nav-link" href="../LogoutServlet">
                                    <img src="TemplateAvatar/logout.png" width="25" height="25" />
                                </a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </nav>