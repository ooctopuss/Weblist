<%-- 
    Document   : footer
    Created on : 29-set-2018, 12.00.24
    Author     : octopussy
--%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>   

<div class="container-fluid">
    <br />

    <div class="row text-center">
        <c:choose>
            <c:when test="${sessionScope.utente != null}">
                <c:set var="nL" value="0"></c:set>
                <c:forEach var="utL" items="${sessionScope.utentiL}">
                    <c:if test="${utL.idUtente == sessionScope.utente.id}">
                        <div class="col-md-3">
                            <div class="card mb-3">
                                <c:forEach var="liste" items="${sessionScope.listeS}">
                                    <c:set var="idLista" value="${utL.idListaSpesa}"></c:set>
                                    <c:if test="${idLista == liste.id}">
                                        <c:set var="nL" value="${nl+1}"></c:set>
                                        <c:set var="idImm" value ="${liste.idImmagine}"></c:set>
                                            <c:set var="cont" value="${0}"></c:set>
                                                <c:forEach var="imm" items="${sessionScope.immaginiCL}">
                                                    <c:if test="${liste.idCategoriaLista == imm.idCategoriaLista}">
                                                        <c:if test="${cont == 0}">
                                                            <div id="carouselExampleControls${imm.idCategoriaLista}" class="carousel slide" data-ride="carousel">
                                                                <div class="carousel-inner">
                                                        </c:if>
                                                        <c:choose>
                                                            <c:when test="${cont == 0}">
                                                                <div class="carousel-item active">
                                                                    <img class="card-img-top" src="${sessionScope.uploadDir}${"\\"}${imm.indirizzo}" alt="Card image cap" height="250" width="200">
                                                                </div>

                                                                <c:set var="cont" value="${cont+1}"></c:set>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="carousel-item ">
                                                                    <img class="card-img-top" src="${sessionScope.uploadDir}${"\\"}${imm.indirizzo}" alt="Card image cap" height="250" width="200">
                                                                </div>
                                                            </c:otherwise>
                                                       </c:choose>
                                                    </c:if>
                                                </c:forEach>
                                                                </div>
                                                        </div>
                                            <div class="card-body">
                                                <c:forEach var="catL" items="${sessionScope.categorieL}">
                                                    <c:if test="${catL.id == liste.idCategoriaLista && idLista == liste.id}">
                                                        <h5 class="card-title">${liste.nome}</h5>
                                                        <h5 class="card-title">${catL.nome}</h5>
                                                        <p class="card-text">${catL.descrizione}</p>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                            <ul class="list-group list-group-flush">
                                                <c:set var="con" value="0"></c:set>
                                                <c:forEach var="lista" items="${sessionScope.listeP}">
                                                    <c:if test="${lista.idListaSpesa == idLista}">
                                                        <c:forEach var ="prod" items="${sessionScope.prodotti}">
                                                            <c:if test="${prod.id == lista.idProdotto}">
                                                                <c:set var="con" value="${con+1}"></c:set>
                                                                    <c:if test="${con <=3}">
                                                                        <li class="list-group-item">${prod.nome}</li>
                                                                    </c:if>
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:if>
                                                </c:forEach>

                                            </ul>
                                            <div class="card-body">
                                                <a href="Lista.jsp?adascaowdwd=${utL.idListaSpesa}"><button type="button" class="btn btn-primary"><fmt:message key="button.completeList" /></button></a>
                                            </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
                <c:if test="${nL == 0}">
                    <p><fmt:message key="error.noList" /></p>
                    
                </c:if>
            </c:when>
            <c:otherwise>
                <div class="col-md-3">
                    <div class="card mb-3">
                        <c:forEach var="liste" items="${sessionScope.listeS}">
                            <c:set var="idLista" value="${sessionScope.utenteAnon}"></c:set>
                                    <c:if test="${idLista == liste.id}">
                                        <c:set var="idImm" value ="${liste.idImmagine}"></c:set>
                                            <c:set var="cont" value="${0}"></c:set>
                                                <c:forEach var="imm" items="${sessionScope.immaginiCL}">
                                                    <c:if test="${liste.idCategoriaLista == imm.idCategoriaLista}">
                                                        <c:if test="${cont == 0}">
                                                            <div id="carouselExampleControls${imm.idCategoriaLista}" class="carousel slide" data-ride="carousel">
                                                                <div class="carousel-inner">
                                                        </c:if>
                                                        <c:choose>
                                                            <c:when test="${cont == 0}">
                                                                <div class="carousel-item active">
                                                                    <img class="card-img-top" src="${sessionScope.uploadDir}${"\\"}${imm.indirizzo}" alt="Card image cap" height="250" width="200">
                                                                </div>

                                                                <c:set var="cont" value="${cont+1}"></c:set>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="carousel-item ">
                                                                    <img class="card-img-top" src="${sessionScope.uploadDir}${"\\"}${imm.indirizzo}" alt="Card image cap" height="250" width="200">
                                                                </div>
                                                            </c:otherwise>
                                                       </c:choose>
                                                    </c:if>
                                                </c:forEach>
                                                                </div>
                                                        </div>
                                            <div class="card-body">
                                                <c:forEach var="catL" items="${sessionScope.categorieL}">
                                                    <c:if test="${catL.id == liste.idCategoriaLista && idLista == liste.id}">
                                                        <h5 class="card-title">${liste.nome}</h5>
                                                        <h5 class="card-title">${catL.nome}</h5>
                                                        <p class="card-text">${catL.descrizione}</p>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                            <ul class="list-group list-group-flush">
                                                <c:set var="con" value="0"></c:set>
                                                <c:forEach var="lista" items="${sessionScope.listeP}">
                                                    <c:if test="${lista.idListaSpesa == idLista}">
                                                        <c:forEach var ="prod" items="${sessionScope.prodotti}">
                                                            <c:if test="${prod.id == lista.idProdotto}">
                                                                <c:set var="con" value="${con+1}"></c:set>
                                                                    <c:if test="${con <=3}">
                                                                        <li class="list-group-item">${prod.nome}</li>
                                                                    </c:if>
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:if>
                                                </c:forEach>

                                            </ul>
                                            <div class="card-body">
                                                <a href="Lista.jsp?adascaowdwd=${sessionScope.utenteAnon}"><button type="button" class="btn btn-primary"><fmt:message key="button.completeList" /></button></a>
                                            </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
            </c:otherwise>
        </c:choose>

    </div>
</div>

