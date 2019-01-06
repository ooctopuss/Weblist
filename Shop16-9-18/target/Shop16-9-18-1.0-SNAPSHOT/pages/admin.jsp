<%-- 
    Document   : footer
    Created on : 29-set-2018, 12.00.24
    Author     : octopussy
--%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>   

<div class="bg">
    <div class="titHom text-center">
        <fmt:message key="navbar.title" />        
    </div>
    <div class="pText text-center">
        <strong><fmt:message key="bg.text" /></strong>
    </div>
    <a href="#oraVedi"><img class="arrow d-none d-lg-block" src="../TemplateAvatar/arrow.png" /></a>
</div>
<br />
<div class="text-center">
    <fmt:message key="index.intro" />
</div>
<br /><br />
<c:choose>
    <c:when test ="${sessionScope.utente.admin == 1}">
        <div class="container-fluid text-center">
            <div class="row text-center" id="oraVedi">
                <div class="col-md-1"></div>
                <div class="col-md-5">
                <div class="card text-white bg-info mb-5" style="max-width: 50rem;">
                    <a class="panel-link" href="Prodotto.jsp">
                        <div class="card-body">
                            <h3 class="card-title text-center"><strong><fmt:message key="card.products" /></strong></h3>
                        </div>
                    </a>
                </div>
                </div>
                <div class="col-md-5">
                <div class="card text-white bg-info mb-5" style="max-width: 50rem;">
                    <a class="panel-link" href="CategProdotto.jsp">
                        <div class="card-body">
                            <h3 class="card-title text-center"><strong><fmt:message key="card.categoryProd" /></strong></h3>
                        </div>
                    </a>
                </div>
                </div>
                <div class="col-md-1"></div>
                <div class="col-md-3"></div>
                <div class="col-md-6">
                <div class="card text-white bg-info mb-5" style="max-width: 50rem;">
                    <a class="panel-link" href="CategListe.jsp">
                        <div class="card-body">
                            <h3 class="card-title text-center"><strong><fmt:message key="card.categoryLists" /></strong></h3>
                        </div>
                    </a>
                </div>            
                </div>        
                <div class="col-md-3"></div>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        
    </c:otherwise>
</c:choose>

