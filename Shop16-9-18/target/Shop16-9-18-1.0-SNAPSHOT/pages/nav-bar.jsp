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
                        <img src="../TemplateAvatar/en.gif" width="30" height="25" />
                    </c:when>
                    <c:when test = "${language == 'it'}">
                        <img src="../TemplateAvatar/it.gif" width="30" height="25" />
                    </c:when>
                </c:choose>    
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon">
                    <c:if test="${sessionScope.notif != 0}">
                        <img src="../TemplateAvatar/notifica.png" class="notify" width="8" height="8" />
                    </c:if>
                </span>
            </button>
                   
                   
            <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
                    <ul class="navbar-nav ">
                        
                    <c:if test ="${sessionScope.utente.admin == 1}">
                        <li class="nav-item active text-center">
                            <a class="nav-link" href="Home.jsp">
                                <img src="../TemplateAvatar/home.png" width="25" height="25" />
                            </a>
                        </li> 
                    </c:if>
                        
                    <c:if test ="${sessionScope.utente.admin == 0}">
                        <li class="nav-item active text-center">
                            <a class="nav-link" href="HomeU.jsp">
                                <img src="../TemplateAvatar/home.png" width="25" height="25" />
                            </a>
                        </li> 
                    </c:if>
                    <c:if test="${sessionScope.utente.admin == 0}">
                     <!--CHAT-->
                        <div id="chatN">
                            
                        </div>
                    </c:if>
                    
<!--#############################################            NOTIFICHE               ###################################################################################-->
            <c:if test="${sessionScope.utente != null}">
                <c:if test="${sessionScope.utente.admin == 0}">
                <div id="liN">
                    <c:choose>
                        <c:when test="${sessionScope.notif == 0}">
                            <li class="nav-item dropdown text-center">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <img src="../TemplateAvatar/bell1.png" width="25" height="25" />
                                </a>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink" name="nF" id="nF">
                                    <a class="nav-link text-center" href="">NESSUNA NOTIFICA</a>
                                    <div class="dropdown-divider"></div>
                                </div>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item dropdown text-center" >
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <img src="../TemplateAvatar/bell3.png" width="25" height="25" />
                                </a>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink" name="nF" id="nF">
                                    <c:forEach items ="${sessionScope.notifiche}" var="noti">
                                        <a class="nav-link text-center" href="../VistoNServlet?idLista=${noti.idLista}&idProdotto=${noti.idProdotto}">Il prodotto ${noti.nomeProdotto} della lista spesa ${noti.nomeLista} sta finendo.</a>
                                        <div class="dropdown-divider"></div>
                                    </c:forEach>
                                      
                                </div>
                            </li>
                        </c:otherwise>
                    </c:choose>  
                </div>
                </c:if>
            </c:if>       
<!--#############################################            NOTIFICHE               ###################################################################################-->                
<!-- geoloc -->
            <c:if test="${sessionScope.utente.admin == 0 || sessionScope.utente == null}">

                <div id="locN">
                     <li class="nav-item dropdown text-center">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img src="../TemplateAvatar/localizzazioneNo.png" width="25" height="25" />
                        </a>
                    </li>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink" >
                    </div>
                    
                </div>
            </c:if>
<!-- fine geoloc -->
                    
                    <c:if test="${sessionScope.utente.admin == 1}">
                        <li class="nav- item text-center">
                            <a class="nav-link" href="Utenti.jsp">
                                <img src="../TemplateAvatar/users.png" width="25" height="25" />
                            </a>
                        </li>
                    </c:if>
                    <c:choose>
                        <c:when test="${sessionScope.utente.admin == 1}">
                            <li class="nav-item dropdown text-center">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <img src="../TemplateAvatar/list.png" width="25" height="25" />
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
                                   <img src="../TemplateAvatar/list.png" width="25" height="25" />
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
                                    <img src="../TemplateAvatar/settings.png" width="25" height="25" />
                                </a>
                            </li>
                            <li class="nav- item text-center">
                                <a class="nav-link" href="../LogoutServlet">
                                    <img src="../TemplateAvatar/logout.png" width="25" height="25" />
                                </a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </nav>

            
            <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"><fmt:message key="button.login" /></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="../LoginServlet" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="exampleInputEmail1"><fmt:message key="signModal.email" /></label>
                        <input type="text" name="email" class="form-control" id="email" placeholder="<fmt:message key="signModal.email.labelEmail" />" required>
                        <small id="emailHelp" class="form-text text-muted"><fmt:message key="login.label.small.email" /></small>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1"><fmt:message key="login.psw" /></label>
                        <input type="password" name="password" class="form-control" id="password" placeholder="<fmt:message key="login.psw.labelPsw" />" required>
                        <small id="pswHelp" class="form-text text-muted"><a href="#" target="_blank" data-toggle="modal" data-target="#recModal"><fmt:message key="login.label.small.rescuepsw" /></a></small>
                    </div>
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="remember" name="remember">
                        <label class="form-check-label" for="exampleCheck1"><fmt:message key="login.label.remember" /></label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal"><fmt:message key="button.cancel" /></button>
                    <button type="submit" class="btn btn-success" value="Login"><fmt:message key="button.login" /></button>
                </div>
            </form>
        </div>
    </div>
</div>
        
        <div class="modal fade" id="regModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle"><fmt:message key="button.register" /></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="../RegisterServlet" method="post">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="exampleInputEmail1"><fmt:message key="signModal.name" /></label>
                                <input type="text" name="nome" class="form-control" id="nome" placeholder="<fmt:message key="signModal.name.labelName" />" required />
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1"><fmt:message key="signModal.surname" /></label>
                                <input type="text" name="cognome" class="form-control" id="cognome" placeholder="<fmt:message key="signModal.surname.labelSurname" />" required/>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1"><fmt:message key="signModal.email" /></label>
                                <input type="text" name="email" class="form-control" id="email" placeholder="<fmt:message key="signModal.email.labelEmail" />" required>
                                <small id="emailHelp" class="form-text text-muted"><fmt:message key="login.label.small.email" /></small>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1"><fmt:message key="login.psw" /></label>
                                <input type="password" name="password1" class="form-control" id="password1" placeholder="<fmt:message key="login.psw.labelPsw" />" required >
                                <small id="passHelp" class="form-text text-muted"><fmt:message key="signModal.psw.small" /></small>
                                <span id="result" class="result"></span>
                            </div>  
                            
                            <c:if test="${sessionScope.utenteAnon != null}">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="importa" name="importa" value="${sessionScope.utenteAnon}">
                                    <label class="form-check-label" for="exampleCheck1"><fmt:message key="importList" /></label>
                                    <small id="passHelp" class="form-text text-muted"><fmt:message key="importList.message" /></small>
                                </div>
                            </c:if>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal"><fmt:message key="button.cancel" /></button>
                            <button type="submit" class="btn btn-success" id="regBtn" value="Login" disabled><fmt:message key="signModal.button" /></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="modal fade" id="recModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle"><fmt:message key="rescuepsw" /></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="../RecuperoPasswordServlet" method="post">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="exampleInputEmail1"><fmt:message key="login.email" /></label>
                                <input type="text" name="email" class="form-control" id="email" placeholder="<fmt:message key="signModal.email.labelEmail" />" required />
                            </div>
                        </div>    
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal"><fmt:message key="button.cancel" /></button>
                            <button type="submit" class="btn btn-success"  value="Invia email"><fmt:message key="button.sendMail" /></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>            
