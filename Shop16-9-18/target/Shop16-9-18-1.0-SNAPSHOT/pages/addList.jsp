<%-- 
    Document   : footer
    Created on : 29-set-2018, 12.00.24
    Author     : octopussy
--%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="internazional.messages" />

<c:if test="${param.cont == 1}">
    <div class="alert alert-danger alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <strong><fmt:message key="error" /></strong>  <fmt:message key="duplicateProd" />
    </div>
</c:if>

<c:if test="${param.u == 1}">
    <div class="alert alert-danger alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <strong><fmt:message key="error" /></strong>  <fmt:message key="emailNotAssociate" />
    </div>
</c:if>
<c:if test="${param.u == 2}">
    <div class="alert alert-danger alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <strong><fmt:message key="error" /></strong>  <fmt:message key="listCondUser" />
    </div>
</c:if>


<script>
    function checkBoxSubit(e) {
        var form = document.createElement('form');
        form.style.display = 'none';
        var input = document.createElement('input');
        var input1 = document.createElement('input');
        input1.name = "idProdottoC";
        input1.type = "text";
        input1.value = e.value;

        input.name = "idL";
        input.type = "hidden";
        input.value = document.getElementById("idL").value;

        
        form.action = '../CheckProdServlet';
        form.method = 'post';
        form.appendChild(input1);
        form.appendChild(input);
        document.body.appendChild(form);
        form.submit();
    }

    function checkBoxSubit1(e) {
        var form = document.createElement('form');
        form.style.display = 'none';
        var input = document.createElement('input');
        var input1 = document.createElement('input');
        input1.name = "idProdottoC";
        input1.type = "text";
        input1.value = e.value;

        input.name = "idL";
        input.type = "hidden";
        input.value = document.getElementById("idL").value;

        
        form.action = '../CheckProdServlet';
        form.method = 'post';
        form.appendChild(input1);
        form.appendChild(input);
        document.body.appendChild(form);
        form.submit();
    }

</script>
<c:set var="idLista" value ="${param.adascaowdwd}"></c:set>
<c:choose>
    <c:when test="${sessionScope.utente != null}">
        <div class="container-fluid">
            <br />
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-5">
                    <div class="card">
                        <div class="card-header"><fmt:message key="card.title.elements" /> </div>
                        <div class="card-body">
                            <ul class="list-group list-group-flush">
                                <c:forEach var="lista" items="${sessionScope.listeP}">
                                    <c:if test="${lista.idListaSpesa == idLista}">
                                        <c:forEach var ="prod" items="${sessionScope.prodotti}">
                                            <c:if test="${prod.id == lista.idProdotto}">
                                                <c:if test="${lista.checked == 0}">
                                                    <li class="list-group-item">
                                                        ${prod.nome} 

                                                        <c:forEach items="${sessionScope.utentiL}" var="ut">
                                                            <c:if test="${ut.idListaSpesa == idLista && sessionScope.utente.id == ut.idUtente}">
                                                                <c:choose>
                                                                    <c:when test="${ut.elProd == 1}">
                                                                        <button type="button" class="btn btn-danger btn-sm text-center" data-toggle="modal" data-id-prodotto ="${prod.id}" data-id-lista="${idLista}" data-target="#rimuoviProd" style="float: right">
                                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="23" viewBox="0 -3 24 25"><path opacity=".87" fill="none" d="M0 0h24v24H0V0z"/><path d="M12 2C6.47 2 2 6.47 2 12s4.47 10 10 10 10-4.47 10-10S17.53 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zm3.59-13L12 10.59 8.41 7 7 8.41 10.59 12 7 15.59 8.41 17 12 13.41 15.59 17 17 15.59 13.41 12 17 8.41z"/></svg>
                                                                        </button>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <button disabled type="button" class="btn btn-danger btn-sm text-center" data-toggle="modal" data-id-prodotto ="${prod.id}" data-id-lista="${idLista}" data-target="#rimuoviProd" style="float: right">
                                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="23" viewBox="0 -3 24 25"><path opacity=".87" fill="none" d="M0 0h24v24H0V0z"/><path d="M12 2C6.47 2 2 6.47 2 12s4.47 10 10 10 10-4.47 10-10S17.53 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zm3.59-13L12 10.59 8.41 7 7 8.41 10.59 12 7 15.59 8.41 17 12 13.41 15.59 17 17 15.59 13.41 12 17 8.41z"/></svg>
                                                                        </button>   
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:if>
                                                        </c:forEach>

                                                        <button type="button" class="btn btn-info btn-sm text-center" data-toggle="modal" data-target="#info" data-id-prodotto="${prod.id}" data-categoria-prodotto="${prod.nomeCat}" data-note-prodotto="${prod.note}" data-nome-prodotto="${prod.nome}"  data-logo-prodotto="${prod.indirizzoL}"  data-toggle="collapse" data-target="#${prod.id}" aria-expanded="false" aria-controls="${prod.id}" style="float: right">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="23" viewBox="0 -3 24 25"><path fill="none" d="M0 0h24v24H0V0z"/><path d="M11 7h2v2h-2zm0 4h2v6h-2zm1-9C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8z"/></svg>
                                                        </button>

                                                        <label class="checkbox">
                                                            <input type="hidden" name="idL" id ="idL" value="${idLista}">
                                                            <input type="checkbox" onClick="checkBoxSubit(this);" value="${prod.id}" />
                                                            <span class="default"></span>
                                                        </label>
                                                        <div class="collapse mb-2" id="${prod.id}">
                                                            <div class="card card-body">
                                                                <!--Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.-->
                                                            </div>
                                                        </div>

                                                    </li>
                                                </c:if>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                </c:forEach>
                            </ul>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item list-group-item-primary" ><fmt:message key="card.title.selectedElements" /><a id="arrow" href="#" onclick="show('elementHide');" style="float: right"><svg xmlns="http://www.w3.org/2000/svg" width="10" height="16" viewBox="0 0 10 16"><path fill-rule="evenodd" d="M5 11L0 6l1.5-1.5L5 8.25 8.5 4.5 10 6l-5 5z"/></svg></a></li>
                                <div id="elementHide">
                                    <c:forEach var="lista" items="${sessionScope.listeP}">
                                        <c:if test="${lista.idListaSpesa == idLista}">
                                            <c:forEach var ="prod" items="${sessionScope.prodotti}">
                                                <c:if test="${prod.id == lista.idProdotto}">
                                                    <c:if test="${lista.checked == 1}">
                                                        <li class="list-group-item list-group-item-info" >
                                                            <del>${prod.nome}</del>
                                                            <c:forEach items="${sessionScope.utentiL}" var="ut">
                                                                <c:if test="${ut.idListaSpesa == idLista && sessionScope.utente.id == ut.idUtente}">
                                                                    <c:choose>
                                                                        <c:when test="${ut.elProd == 1}">
                                                                            <button type="button" class="btn btn-danger btn-sm text-center" data-toggle="modal" data-target="#rimuoviProd" data-id-prodotto ="${prod.id}" data-id-lista="${idLista}" style="float: right">
                                                                                <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" viewBox="3 1 20 20"><path opacity=".87" fill="none" d="M0 0h24v24H0V0z"/><path d="M12 2C6.47 2 2 6.47 2 12s4.47 10 10 10 10-4.47 10-10S17.53 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zm3.59-13L12 10.59 8.41 7 7 8.41 10.59 12 7 15.59 8.41 17 12 13.41 15.59 17 17 15.59 13.41 12 17 8.41z"/></svg>
                                                                            </button>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <button disabled type="button" class="btn btn-danger btn-sm text-center" data-toggle="modal" data-target="#rimuoviProd" data-id-prodotto ="${prod.id}" data-id-lista="${idLista}" style="float: right">
                                                                                <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" viewBox="3 1 20 20"><path opacity=".87" fill="none" d="M0 0h24v24H0V0z"/><path d="M12 2C6.47 2 2 6.47 2 12s4.47 10 10 10 10-4.47 10-10S17.53 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zm3.59-13L12 10.59 8.41 7 7 8.41 10.59 12 7 15.59 8.41 17 12 13.41 15.59 17 17 15.59 13.41 12 17 8.41z"/></svg>
                                                                            </button>    
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </c:if>
                                                            </c:forEach>
                                                            <button type="button" class="btn btn-info btn-sm text-center" data-toggle="modal" data-target="#info" data-id-prodotto="${prod.id}" data-categoria-prodotto="${prod.nomeCat}" data-note-prodotto="${prod.note}" data-nome-prodotto="${prod.nome}" data-logo-prodotto="${prod.indirizzoL}" data-toggle="collapse" data-target="#${prod.id}" aria-expanded="false" aria-controls="${prod.id}" style="float: right">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" viewBox="3 1 20 20"><path fill="none" d="M0 0h24v24H0V0z"/><path d="M11 7h2v2h-2zm0 4h2v6h-2zm1-9C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8z"/></svg>
                                                            </button>
                                                            <label class="checkbox">
                                                                <input type="hidden" name="idL" id ="idL" value="${idLista}">
                                                                <input type="checkbox" onClick="checkBoxSubit1(this);" value="${prod.id}" />

                                                                <span class="default"></span>
                                                            </label>
                                                            <div class="collapse mb-2" id="88">
                                                                <div class="card card-body">
                                                                    <!-- Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. -->
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </c:if>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-1"></div>
                <div class="col-md-4">
                    <form action="../AggProdLista" method="post"><br />
                        <label for="autocomplete-2" id="target"><fmt:message key="card.addRapid" /></label>
                        <c:forEach items="${sessionScope.utentiL}" var="ut">
                            <c:if test="${ut.idListaSpesa == idLista && sessionScope.utente.id == ut.idUtente}">
                                <c:choose>
                                    <c:when test="${ut.aggProd == 1}">
                                        <button type="submit" class="btn btn-success btn-sm text-center" style="float: right"><fmt:message key="button.add" /></button> 
                                    </c:when>
                                    <c:otherwise>
                                        <button disabled type="submit" class="btn btn-success btn-sm text-center" style="float: right"><fmt:message key="button.add" /></button> 
                                    </c:otherwise>
                                </c:choose>
                            </c:if>
                        </c:forEach>
                        <input type="hidden" value="${idLista}" name ="idList" id="idList">
                        <select id="autocomplete-2" name="autocomplete-2" class="form-control select2-allow-clear" multiple="multiple" style="width:100%">
                            <c:forEach var="prod" items="${sessionScope.prodottiR}">
                                <option value="${prod.id}">${prod.nome}</option>
                            </c:forEach>
                        </select>
                        <small id="searchHelp" class="form-text text-muted"><fmt:message key="card.addRapid.small" /></small>

                    </form>
                    <!--###############################################--><br />
                    <div class="card">
                        <div class="card-header"><fmt:message key="card.title.manageList" /></div>
                        <div class="card-body">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">
                                    <fmt:message key="card.manageList.modify" />
                                    <c:forEach var="lista" items="${sessionScope.listeS}">
                                        <c:if test="${lista.id == idLista}">
                                            <c:forEach items="${sessionScope.utentiL}" var="ut">
                                                <c:if test="${ut.idListaSpesa == idLista && sessionScope.utente.id == ut.idUtente}">
                                                    <c:choose>
                                                        <c:when test="${ut.modCat == 1}">
                                                            <button type="button" class="btn btn-warning btn-sm text-center" data-toggle="modal" data-target="#manageList" data-id-lista="${idLista}" data-nome-lista="${lista.nome}" data-descrizione-lista="${lista.descrizione}" data-categoria-lista="${lista.idCategoriaLista}" style="float: right">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path clip-rule="evenodd" fill="none" d="M0 0h24v24H0z"/><path d="M22.7 19l-9.1-9.1c.9-2.3.4-5-1.5-6.9-2-2-5-2.4-7.4-1.3L9 6 6 9 1.6 4.7C.4 7.1.9 10.1 2.9 12.1c1.9 1.9 4.6 2.4 6.9 1.5l9.1 9.1c.4.4 1 .4 1.4 0l2.3-2.3c.5-.4.5-1.1.1-1.4z"/></svg>
                                                            </button>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <button type="button" disabled class="btn btn-warning btn-sm text-center" data-toggle="modal" data-target="#manageList" data-id-lista="${idLista}" data-nome-lista="${lista.nome}" data-descrizione-lista="${lista.descrizione}" data-categoria-lista="${lista.idCategoriaLista}" style="float: right">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path clip-rule="evenodd" fill="none" d="M0 0h24v24H0z"/><path d="M22.7 19l-9.1-9.1c.9-2.3.4-5-1.5-6.9-2-2-5-2.4-7.4-1.3L9 6 6 9 1.6 4.7C.4 7.1.9 10.1 2.9 12.1c1.9 1.9 4.6 2.4 6.9 1.5l9.1 9.1c.4.4 1 .4 1.4 0l2.3-2.3c.5-.4.5-1.1.1-1.4z"/></svg>
                                                            </button>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </c:forEach>

                                </li>
                                <li class="list-group-item">
                                    <fmt:message key="card.manageList.share" />
                                    
                                    <c:set var ="ncontS" value="0"></c:set>

                                    <c:forEach var="utL" items="${sessionScope.utentiL}">
                                        <c:choose>
                                            <c:when test="${utL.idListaSpesa == idLista && sessionScope.utente.id == utL.idUtente && utL.proprietario == 1}"> 
                                                <button type="button" class="btn btn-success btn-sm text-center" data-toggle="modal" data-target="#condividiModal" style="float: right">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="none" d="M0 0h24v24H0V0z"/><path d="M18 16.08c-.76 0-1.44.3-1.96.77L8.91 12.7c.05-.23.09-.46.09-.7s-.04-.47-.09-.7l7.05-4.11c.54.5 1.25.81 2.04.81 1.66 0 3-1.34 3-3s-1.34-3-3-3-3 1.34-3 3c0 .24.04.47.09.7L8.04 9.81C7.5 9.31 6.79 9 6 9c-1.66 0-3 1.34-3 3s1.34 3 3 3c.79 0 1.5-.31 2.04-.81l7.12 4.16c-.05.21-.08.43-.08.65 0 1.61 1.31 2.92 2.92 2.92s2.92-1.31 2.92-2.92c0-1.61-1.31-2.92-2.92-2.92zM18 4c.55 0 1 .45 1 1s-.45 1-1 1-1-.45-1-1 .45-1 1-1zM6 13c-.55 0-1-.45-1-1s.45-1 1-1 1 .45 1 1-.45 1-1 1zm12 7.02c-.55 0-1-.45-1-1s.45-1 1-1 1 .45 1 1-.45 1-1 1z"/></svg>
                                                </button>
                                                <c:set var ="ncontS" value="1"></c:set>
                                            </c:when>
                                            <c:otherwise>
                                               
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                    <c:if test="${ncontS == 0}">
                                        <button disabled type="button" class="btn btn-success btn-sm text-center" data-toggle="modal" data-target="#condividiModal" style="float: right">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="none" d="M0 0h24v24H0V0z"/><path d="M18 16.08c-.76 0-1.44.3-1.96.77L8.91 12.7c.05-.23.09-.46.09-.7s-.04-.47-.09-.7l7.05-4.11c.54.5 1.25.81 2.04.81 1.66 0 3-1.34 3-3s-1.34-3-3-3-3 1.34-3 3c0 .24.04.47.09.7L8.04 9.81C7.5 9.31 6.79 9 6 9c-1.66 0-3 1.34-3 3s1.34 3 3 3c.79 0 1.5-.31 2.04-.81l7.12 4.16c-.05.21-.08.43-.08.65 0 1.61 1.31 2.92 2.92 2.92s2.92-1.31 2.92-2.92c0-1.61-1.31-2.92-2.92-2.92zM18 4c.55 0 1 .45 1 1s-.45 1-1 1-1-.45-1-1 .45-1 1-1zM6 13c-.55 0-1-.45-1-1s.45-1 1-1 1 .45 1 1-.45 1-1 1zm12 7.02c-.55 0-1-.45-1-1s.45-1 1-1 1 .45 1 1-.45 1-1 1z"/></svg>
                                        </button>
                                    </c:if>
                                    
                                    
                                    
                                    
                                    
                                </li>
                                <li class="list-group-item">
                                    <fmt:message key="card.manageList.modifyShare" />
                                    <c:set var ="ncont" value="0"></c:set>

                                    <c:forEach var="utL" items="${sessionScope.utentiL}">
                                        <c:choose>
                                            <c:when test="${utL.idListaSpesa == idLista && sessionScope.utente.id == utL.idUtente && utL.proprietario == 1}"> 
                                                <button type="button" class="btn btn-primary btn-sm text-center" data-toggle="modal" data-id-prodotto ="${prod.id}" data-id-lista="${idLista}" data-target="#opzioniShare" style="float: right">
                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24"><defs><path id="a" d="M0 0h24v24H0V0z"/></defs><clipPath id="b"><use xlink:href="#a" overflow="visible"/></clipPath><path clip-path="url(#b)" d="M14 10H2v2h12v-2zm0-4H2v2h12V6zM2 16h8v-2H2v2zm19.5-4.5L23 13l-6.99 7-4.51-4.5L13 14l3.01 3 5.49-5.5z"/></svg>
                                                </button>
                                                 <c:set var ="ncont" value="1"></c:set>
                                            </c:when>
                                            <c:otherwise>
                                               
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                    <c:if test="${ncont == 0}">
                                        <button disabled type="button" class="btn btn-primary btn-sm text-center" data-toggle="modal" data-id-prodotto ="${prod.id}" data-id-lista="${idLista}" data-target="#opzioniShare" style="float: right">
                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24"><defs><path id="a" d="M0 0h24v24H0V0z"/></defs><clipPath id="b"><use xlink:href="#a" overflow="visible"/></clipPath><path clip-path="url(#b)" d="M14 10H2v2h12v-2zm0-4H2v2h12V6zM2 16h8v-2H2v2zm19.5-4.5L23 13l-6.99 7-4.51-4.5L13 14l3.01 3 5.49-5.5z"/></svg>
                                        </button>
                                    </c:if>
                                        
                                </li>
                                <li class="list-group-item">
                                    <fmt:message key="card.manageList.deleteList" />
                                    <c:set var ="ncontE" value="0"></c:set>
                                    <c:forEach var="utL" items="${sessionScope.utentiL}">
                                        <c:choose>
                                            <c:when test="${utL.idListaSpesa == idLista && sessionScope.utente.id == utL.idUtente && utL.elLista == 1}"> 
                                                <button type="button" class="btn btn-danger btn-sm text-center" data-toggle="modal" data-id-lista="${idLista}" data-target="#rimuoviLista" style="float: right">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="23" viewBox="0 -3 24 25"><path opacity=".87" fill="none" d="M0 0h24v24H0V0z"/><path d="M12 2C6.47 2 2 6.47 2 12s4.47 10 10 10 10-4.47 10-10S17.53 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zm3.59-13L12 10.59 8.41 7 7 8.41 10.59 12 7 15.59 8.41 17 12 13.41 15.59 17 17 15.59 13.41 12 17 8.41z"/></svg>
                                                </button>
                                                 <c:set var ="ncontE" value="1"></c:set>
                                            </c:when>
                                            <c:otherwise>
                                               
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                    <c:if test="${ncontE == 0}">
                                        <button disabled type="button" class="btn btn-danger btn-sm text-center" data-toggle="modal" data-id-lista="${idLista}" data-target="#rimuoviLista" style="float: right">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="23" viewBox="0 -3 24 25"><path opacity=".87" fill="none" d="M0 0h24v24H0V0z"/><path d="M12 2C6.47 2 2 6.47 2 12s4.47 10 10 10 10-4.47 10-10S17.53 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zm3.59-13L12 10.59 8.41 7 7 8.41 10.59 12 7 15.59 8.41 17 12 13.41 15.59 17 17 15.59 13.41 12 17 8.41z"/></svg>
                                        </button>
                                    </c:if>
                                    
                                    
                                </li>
                            </ul>
                        </div>
                    </div> 
                    <!--#######################################################################################--><br />
                    <div class="card">
                        <div class="card-header"><fmt:message key="card.title.addPro" />
                            <c:forEach items="${sessionScope.utentiL}" var="ut">
                                <c:if test="${ut.idListaSpesa == idLista && sessionScope.utente.id == ut.idUtente}">
                                    <c:choose>
                                        <c:when test="${ut.aggProd == 1}">
                                            <button type="button" id ="agP" name="agP" class="btn btn-success btn-sm text-center" data-toggle="modal" data-target="#aggiungiProdotto" data-placement="bottom"style="float: right"><fmt:message key="button.products" /></button>
                                        </c:when>
                                        <c:otherwise>
                                            <button disabled type="button" class="btn btn-success btn-sm text-center" data-toggle="modal" data-target="#aggiungiProdotto"  data-placement="bottom" style="float: right"><fmt:message key="button.products" /></button>
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                            </c:forEach>
                        </div>
                        <div class="card-body">
                            <table id="tabProd" class="table table-striped table-hover display text-center responsive nowrap" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th><fmt:message key="catLogo" /></th>
                                        <th><fmt:message key="signModal.name" /></th>                                
                                        <th><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M4.48 7.27c.26.26 1.28 1.33 1.28 1.33l.56-.58-.88-.91 1.69-1.8s-.76-.74-.43-.45c.32-1.19.03-2.51-.87-3.44C4.93.5 3.66.2 2.52.51l1.93 2-.51 1.96-1.89.52-1.93-2C-.19 4.17.1 5.48 1 6.4c.94.98 2.29 1.26 3.48.87zm6.44 1.94l-2.33 2.3 3.84 3.98c.31.33.73.49 1.14.49.41 0 .82-.16 1.14-.49.63-.65.63-1.7 0-2.35l-3.79-3.93zM16 2.53L13.55 0 6.33 7.46l.88.91-4.31 4.46-.99.53-1.39 2.27.35.37 2.2-1.44.51-1.02L7.9 9.08l.88.91L16 2.53z"/></svg> <fmt:message key="button.add" /></th>
                                        <th><fmt:message key="admin.prodCat" /></th>
                                        <th><fmt:message key="admin.prodNotes" /></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="prod" items="${sessionScope.prodottiR}">

                                        <tr>
                                            <td><img src = "${sessionScope.uploadDir}${"\\"}${prod.indirizzoL}"height="42" width="42"></td>
                                            <td>${prod.nome}</td>
                                            <td><c:forEach items="${sessionScope.utentiL}" var="ut">
                                                    <c:if test="${ut.idListaSpesa == idLista && sessionScope.utente.id == ut.idUtente}">
                                                        <c:choose>
                                                            <c:when test="${ut.aggProd == 1}">
                                                                <a href="../AggProdLista?pro=${prod.id}&list=${idLista}" class="btn btn-success btn-rounded mb-4" ><svg xmlns="http://www.w3.org/2000/svg" width="12" height="16" viewBox="0 0 12 16"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg></a>
                                                                </c:when>
                                                                <c:otherwise>
                                                                <button class="btn btn-success btn-rounded mb-4" disabled><svg xmlns="http://www.w3.org/2000/svg" width="12" height="16" viewBox="0 0 12 16"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg></button>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:if>
                                                    </c:forEach>
                                            </td>  
                                            <td>${prod.nomeCat}</td>
                                            <td>${prod.note}</td>
                                        </tr>

                                    </c:forEach>  
                                </tbody> 
                            </table>
                        </div>
                    </div> 
                </div>
            </div>
        </div> 
    </c:when>
    <c:otherwise>
        <div class="container-fluid">
            <br />
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-5">
                    <div class="card">
                        <div class="card-header"><fmt:message key="card.title.elements" /></div>
                        <div class="card-body">
                            <ul class="list-group list-group-flush">
                                <c:forEach var="lista" items="${sessionScope.listeP}">
                                    <c:if test="${lista.idListaSpesa == idLista}">
                                        <c:forEach var ="prod" items="${sessionScope.prodotti}">
                                            <c:if test="${prod.id == lista.idProdotto}">
                                                <c:if test="${lista.checked == 0}">
                                                    <li class="list-group-item">
                                                        ${prod.nome} 

                                                        <button type="button" class="btn btn-danger btn-sm text-center" data-toggle="modal" data-id-prodotto ="${prod.id}" data-id-lista="${idLista}" data-target="#rimuoviProd" style="float: right">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="23" viewBox="0 -3 24 25"><path opacity=".87" fill="none" d="M0 0h24v24H0V0z"/><path d="M12 2C6.47 2 2 6.47 2 12s4.47 10 10 10 10-4.47 10-10S17.53 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zm3.59-13L12 10.59 8.41 7 7 8.41 10.59 12 7 15.59 8.41 17 12 13.41 15.59 17 17 15.59 13.41 12 17 8.41z"/></svg>
                                                        </button>


                                                        <button type="button" class="btn btn-info btn-sm text-center" data-toggle="modal" data-target="#info" data-id-prodotto="${prod.id}" data-categoria-prodotto="${prod.nomeCat}" data-note-prodotto="${prod.note}" data-nome-prodotto="${prod.nome}" data-logo-prodotto="${prod.indirizzoL}" data- data-toggle="collapse" data-target="#${prod.id}" aria-expanded="false" aria-controls="${prod.id}" style="float: right">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="23" viewBox="0 -3 24 25"><path fill="none" d="M0 0h24v24H0V0z"/><path d="M11 7h2v2h-2zm0 4h2v6h-2zm1-9C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8z"/></svg>
                                                        </button>

                                                        <label class="checkbox">
                                                            <input type="hidden" name="idL" id ="idL" value="${idLista}">
                                                            <input type="checkbox" onClick="checkBoxSubit(this);" value="${prod.id}" />
                                                            <span class="default"></span>
                                                        </label>
                                                        <div class="collapse mb-2" id="${prod.id}">
                                                            <div class="card card-body">
                                                                <!-- Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.-->
                                                            </div>
                                                        </div>

                                                    </li>
                                                </c:if>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                </c:forEach>
                            </ul>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item list-group-item-primary" ><fmt:message key="card.title.selectedElements" /><a id="arrow" href="#" onclick="show('elementHide');" style="float: right"><svg xmlns="http://www.w3.org/2000/svg" width="10" height="16" viewBox="0 0 10 16"><path fill-rule="evenodd" d="M5 11L0 6l1.5-1.5L5 8.25 8.5 4.5 10 6l-5 5z"/></svg></a></li>
                                <div id="elementHide">
                                    <c:forEach var="lista" items="${sessionScope.listeP}">
                                        <c:if test="${lista.idListaSpesa == idLista}">
                                            <c:forEach var ="prod" items="${sessionScope.prodotti}">
                                                <c:if test="${prod.id == lista.idProdotto}">
                                                    <c:if test="${lista.checked == 1}">
                                                        <li class="list-group-item list-group-item-info" >
                                                            <del>${prod.nome}</del>
                                                            <button type="button" class="btn btn-danger btn-sm text-center" data-toggle="modal" data-target="#rimuoviProd" data-id-prodotto ="${prod.id}" data-id-lista="${idLista}" style="float: right">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" viewBox="3 1 20 20"><path opacity=".87" fill="none" d="M0 0h24v24H0V0z"/><path d="M12 2C6.47 2 2 6.47 2 12s4.47 10 10 10 10-4.47 10-10S17.53 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zm3.59-13L12 10.59 8.41 7 7 8.41 10.59 12 7 15.59 8.41 17 12 13.41 15.59 17 17 15.59 13.41 12 17 8.41z"/></svg>
                                                            </button>

                                                            <button type="button" class="btn btn-info btn-sm text-center" data-toggle="modal" data-target="#info" data-id-prodotto="${prod.id}" data-categoria-prodotto="${prod.nomeCat}" data-note-prodotto="${prod.note}" data-nome-prodotto="${prod.nome}" data-logo-prodotto="${prod.indirizzoL}" data-toggle="collapse" data-target="#${prod.id}" aria-expanded="false" aria-controls="${prod.id}" style="float: right">
                                                                <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" viewBox="3 1 20 20"><path fill="none" d="M0 0h24v24H0V0z"/><path d="M11 7h2v2h-2zm0 4h2v6h-2zm1-9C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8z"/></svg>
                                                            </button>
                                                            <label class="checkbox">
                                                                <input type="hidden" name="idL" id ="idL" value="${idLista}">
                                                                <input type="checkbox" onClick="checkBoxSubit1(this);" value="${prod.id}" />

                                                                <span class="default"></span>
                                                            </label>
                                                            <div class="collapse mb-2" id="88">
                                                                <div class="card card-body">
                                                                    <!-- Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.-->
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </c:if>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-1"></div>
                <div class="col-md-4">
                    <form action="../AggProdLista" method="post"><br />
                        <label for="autocomplete-2" id="target"><fmt:message key="card.addRapid" /></label>
                        <button id="inVVelo" type="submit" class="btn btn-success btn-sm text-center" style="float: right" ><fmt:message key="button.add" /></button> 

                        <input type="hidden" value="${idLista}" name ="idList" id="idList">
                        <select id="autocomplete-2" name="autocomplete-2" class="form-control select2-allow-clear" multiple="multiple" style="width:100%" >
                            <c:forEach var="prod" items="${sessionScope.prodottiR}">
                                <option value="${prod.id}">${prod.nome}</option>
                            </c:forEach>
                        </select>
                        <small id="searchHelp" class="form-text text-muted"><fmt:message key="card.addRapid.small" /></small>

                    </form>
                    <!--###############################################--><br />
                    <div class="card">
                        <div class="card-header"><fmt:message key="card.title.manageList" /></div>
                        <div class="card-body">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">
                                    <fmt:message key="card.manageList.modify" />
                                    <c:forEach var="lista" items="${sessionScope.listeS}">
                                        <c:if test="${lista.id == idLista}">
                                            <button type="button" class="btn btn-warning btn-sm text-center" data-toggle="modal" data-target="#manageList" data-id-lista="${idLista}" data-nome-lista="${lista.nome}" data-descrizione-lista="${lista.descrizione}" data-categoria-lista="${lista.idCategoriaLista}" style="float: right">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path clip-rule="evenodd" fill="none" d="M0 0h24v24H0z"/><path d="M22.7 19l-9.1-9.1c.9-2.3.4-5-1.5-6.9-2-2-5-2.4-7.4-1.3L9 6 6 9 1.6 4.7C.4 7.1.9 10.1 2.9 12.1c1.9 1.9 4.6 2.4 6.9 1.5l9.1 9.1c.4.4 1 .4 1.4 0l2.3-2.3c.5-.4.5-1.1.1-1.4z"/></svg>
                                            </button>
                                        </c:if>
                                    </c:forEach>

                                </li>
                                <li class="list-group-item">
                                    <fmt:message key="card.manageList.share" />
                                    <button disabled type="button" class="btn btn-success btn-sm text-center" data-toggle="modal" data-target="#condividiModal" style="float: right">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="none" d="M0 0h24v24H0V0z"/><path d="M18 16.08c-.76 0-1.44.3-1.96.77L8.91 12.7c.05-.23.09-.46.09-.7s-.04-.47-.09-.7l7.05-4.11c.54.5 1.25.81 2.04.81 1.66 0 3-1.34 3-3s-1.34-3-3-3-3 1.34-3 3c0 .24.04.47.09.7L8.04 9.81C7.5 9.31 6.79 9 6 9c-1.66 0-3 1.34-3 3s1.34 3 3 3c.79 0 1.5-.31 2.04-.81l7.12 4.16c-.05.21-.08.43-.08.65 0 1.61 1.31 2.92 2.92 2.92s2.92-1.31 2.92-2.92c0-1.61-1.31-2.92-2.92-2.92zM18 4c.55 0 1 .45 1 1s-.45 1-1 1-1-.45-1-1 .45-1 1-1zM6 13c-.55 0-1-.45-1-1s.45-1 1-1 1 .45 1 1-.45 1-1 1zm12 7.02c-.55 0-1-.45-1-1s.45-1 1-1 1 .45 1 1-.45 1-1 1z"/></svg>
                                    </button>
                                </li>
                                <li class="list-group-item">
                                    <fmt:message key="card.manageList.modifyShare" />
                                    <button disabled type="button" class="btn btn-primary btn-sm text-center" data-toggle="modal" data-id-prodotto ="${prod.id}" data-id-lista="${idLista}" data-target="#opzioniShare" style="float: right">
                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24"><defs><path id="a" d="M0 0h24v24H0V0z"/></defs><clipPath id="b"><use xlink:href="#a" overflow="visible"/></clipPath><path clip-path="url(#b)" d="M14 10H2v2h12v-2zm0-4H2v2h12V6zM2 16h8v-2H2v2zm19.5-4.5L23 13l-6.99 7-4.51-4.5L13 14l3.01 3 5.49-5.5z"/></svg>
                                    </button>
                                </li>
                                <li class="list-group-item">
                                    <fmt:message key="card.manageList.deleteList" />
                                    <button type="button" class="btn btn-danger btn-sm text-center" data-toggle="modal" data-id-lista="${idLista}" data-target="#rimuoviLista" style="float: right">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="23" viewBox="0 -3 24 25"><path opacity=".87" fill="none" d="M0 0h24v24H0V0z"/><path d="M12 2C6.47 2 2 6.47 2 12s4.47 10 10 10 10-4.47 10-10S17.53 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zm3.59-13L12 10.59 8.41 7 7 8.41 10.59 12 7 15.59 8.41 17 12 13.41 15.59 17 17 15.59 13.41 12 17 8.41z"/></svg>
                                    </button>
                                </li>
                            </ul>
                        </div>
                    </div> 
                    <!--#######################################################################################--><br />
                    <div class="card">
                        <div class="card-header"><fmt:message key="card.title.addPro" />
                            <button type="button" id ="agP" name="agP" class="btn btn-success btn-sm text-center" data-toggle="modal" data-target="#aggiungiProdotto" data-placement="bottom"style="float: right">Aggiungi Prodotto</button>
                        </div>
                        <div class="card-body">
                            <table id="tabProd" class="table table-striped table-hover display text-center responsive nowrap" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th><fmt:message key="catLogo" /></th>
                                        <th><fmt:message key="signModal.name" /></th>                                
                                        <th><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M4.48 7.27c.26.26 1.28 1.33 1.28 1.33l.56-.58-.88-.91 1.69-1.8s-.76-.74-.43-.45c.32-1.19.03-2.51-.87-3.44C4.93.5 3.66.2 2.52.51l1.93 2-.51 1.96-1.89.52-1.93-2C-.19 4.17.1 5.48 1 6.4c.94.98 2.29 1.26 3.48.87zm6.44 1.94l-2.33 2.3 3.84 3.98c.31.33.73.49 1.14.49.41 0 .82-.16 1.14-.49.63-.65.63-1.7 0-2.35l-3.79-3.93zM16 2.53L13.55 0 6.33 7.46l.88.91-4.31 4.46-.99.53-1.39 2.27.35.37 2.2-1.44.51-1.02L7.9 9.08l.88.91L16 2.53z"/></svg> <fmt:message key="button.add" /></th>
                                        <th><fmt:message key="admin.prodCat" /></th>
                                        <th><fmt:message key="admin.prodNotes" /></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="prod" items="${sessionScope.prodottiR}">

                                        <tr>
                                            <td><img src = "${sessionScope.uploadDir}${"\\"}${prod.indirizzoL}"height="42" width="42"></td>
                                            <td>${prod.nome}</td>
                                            <td>
                                                <a href="../AggProdLista?pro=${prod.id}&list=${idLista}" class="btn btn-success btn-rounded mb-4" ><svg xmlns="http://www.w3.org/2000/svg" width="12" height="16" viewBox="0 0 12 16"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg></a>
                                            </td>  
                                            <td>${prod.nomeCat}</td>
                                            <td>${prod.note}</td>
                                        </tr>

                                    </c:forEach>  
                                </tbody> 
                            </table>
                        </div>
                    </div> 
                </div>
            </div>
        </div>

    </c:otherwise>
</c:choose>

<div class="modal fade" id="condividiModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"><fmt:message key="modal.listShare" /></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="../CondListaServlet" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <div class="form-group">
                            <label for="exampleInputEmail1"><fmt:message key="signModal.email" /></label>
                            <input type="hidden" name ="idL" id="idL" value ="${idLista}">
                            <input type="email" name="email" class="form-control" id="email" placeholder="<fmt:message key="signModal.email.labelEmail" />" required />
                        </div>

                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="modCat" name ="modCat">
                            <label class="form-check-label" for="exampleCheck1"><fmt:message key="modal.listShare.mod" /></label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="aggProd" name="aggProd">
                            <label class="form-check-label" for="exampleCheck1"><fmt:message key="modal.listShare.add" /></label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="elProd" name="elProd">
                            <label class="form-check-label" for="exampleCheck1"><fmt:message key="modal.listShare.delP" /></label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="elLista" name="elLista">
                            <label class="form-check-label" for="exampleCheck1"><fmt:message key="modal.listShare.delL" /></label>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal"><fmt:message key="button.cancel" /></button>
                        <button type="submit" class="btn btn-success"  value="Invia email"><fmt:message key="button.share" /></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>   

<div class="modal fade" id="info" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"><img id="pL"  width="150" height="80"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <div class="form-group">
                    <ul class="list-group list-group-flush text-right">
                        <li class="list-group-item">
                            <strong style="float: left"><fmt:message key="signModal.name" /></strong> <p  id="no"></p>
                        </li>
                        <li class="list-group-item">
                            <strong style="float: left"><fmt:message key="button.category" /></strong> <p  id="cat"></p>
                        </li>
                        <li class="list-group-item">
                            <strong style="float: left"><fmt:message key="admin.prodNotes" /></strong> <p  id="not"></p>
                        </li>
                        <li class="list-group-item">
                            <strong style="float: left"><fmt:message key="button.image" /></strong>
                            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                                
                                
                            </div>




                        </li>
                    </ul>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal"><fmt:message key="button.close" /></button>
                </div>
            </div>

        </div>
    </div>
</div>

<div class="modal fade" id="rimuoviProd" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"><fmt:message key="removeProd" /></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="../rimuoviProdServlet" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <input type ="hidden" name="idProdotto" id="idProdotto">
                        <input type ="hidden" name="idList" id="idList">

                        <fmt:message key="advRemoveProd" /><br /><small><fmt:message key="small.advRemoveProd" /></small>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal"><fmt:message key="button.cancel" /></button>
                        <button type="submit" class="btn btn-success"><fmt:message key="button.remove" /></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div> 

<!-- Modal per aggiungere il lista -->  
<div class="modal fade" id="manageList" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"><fmt:message key="modal.modifyList" /></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="../ModListaPServlet" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="modal-body mx-12">
                        <div class="md-form mb-5">
                            <label><fmt:message key="modal.addList.name" /></label>
                            <input type="hidden" name="idLista" class="form-control" id="idLista" placeholder="<fmt:message key="modal.addList.labelName" />" >

                            <input type="text" name="nome" class="form-control" id="nome" placeholder="<fmt:message key="modal.addList.labelName" />" required>
                        </div>
                        <div class="md-form mb-5">
                            <label><fmt:message key="modal.addList.description" /></label>
                            <input type="text" name="descrizione" class="form-control" id="descrizione" placeholder="<fmt:message key="modal.addList.labelDescription" />" required>
                        </div>
                        <div class="md-form mb-5">
                            <label><fmt:message key="modal.addList.category" /></label>

                            <select class="custom-select" id="catL" name = "catL">
                                <option selected><fmt:message key="modal.addList.labelCategory" /></option>
                                <c:forEach items ="${sessionScope.categorieL}" var="cat">
                                    <option value="${cat.id}">${cat.nome}</option>   
                                </c:forEach>
                            </select>
                        </div>
                        <div class="md-form mb-5">
                            <label><fmt:message key="modal.addList.img" /></label>
                            <input type="file" name="immagine" class="form-control" id="immagine" placeholder="" >
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal"><fmt:message key="button.cancel" /></button>
                    <button type="submit" class="btn btn-success"><fmt:message key="button.modify" /></button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal per aggiungere il prodotto -->  
<div class="modal fade" id="aggiungiProdotto" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"><fmt:message key="button.products" /></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="../AggNProdListaServlet" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="modal-body mx-12">
                        <div class="md-form mb-5">
                            <label><fmt:message key="signModal.name" /></label>
                            <input type="hidden" id="idLista" name="idLista" value="${idLista}">
                            <input type="text" name="nome" class="form-control" id="nome" placeholder="<fmt:message key="label.nameProd" />" required>
                        </div>
                        <div class="md-form mb-5">
                            <label><fmt:message key="admin.prodNotes" /></label>
                            <input type="text" name="note" class="form-control" id="note" placeholder="<fmt:message key="place.noteProd" />" required>
                        </div>
                        <div class="md-form mb-5">
                            <label><fmt:message key="admin.prodCat" /></label>

                            <select class="custom-select" id="catProd" name = "categoriaProd">
                                <option selected><fmt:message key="admin.select" /></option>
                                <c:forEach items ="${sessionScope.categorieP}" var="cat">
                                    <option value="${cat.id}">${cat.nome}</option>   
                                </c:forEach>
                            </select>
                        </div>
                        <div class="md-form mb-5">
                            <label><fmt:message key="admin.imgProd" /></label>
                            <input type="file" name="multiplefile" class="form-control" id="multiplefile" placeholder="" multiple required>
                        </div>
                        <div class="md-form mb-5">
                            <label><fmt:message key="logoProd" /></label>
                            <input type="file" name="logo" class="form-control" id="logo" placeholder="" required>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal"><fmt:message key="button.cancel" /></button>
                    <button type="submit" class="btn btn-success"><fmt:message key="button.add" /></button>
                </div>
            </form>
        </div>
    </div>
</div>



<div class="modal fade" id="rimuoviLista" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"><fmt:message key="deletePerList" /></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="../EliminaListaServlet" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <input type ="hidden" name="idList" id="idList" value="${idLista}">

                        <fmt:message key="label.deleteList" /><br />
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal"><fmt:message key="button.cancel" /></button>
                        <button type="submit" class="btn btn-success"><fmt:message key="button.remove" /></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="opzioniShare" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"><fmt:message key="permisUser" /></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <div class="form-group">
                    <ul class="list-group list-group-flush text-right">
                        <c:set var ="nC" value="0"></c:set>

                        <c:forEach var="utL" items="${sessionScope.utentiL}">
                            <c:if test="${utL.idListaSpesa == idLista }">
                                <c:set var ="nC" value="${nC +1}"></c:set>
                                <c:if test="${utL.proprietario != 1}">
                                    <li class="list-group-item" id="showPermessi${utL.idUtente}">
                                        <strong style="float: left">E-mail:</strong> 
                                        <p  id="no">
                                            <c:forEach var ="utente" items="${sessionScope.utenti}">
                                                <c:if test="${utente.id == utL.idUtente}">
                                                    ${utente.email}
                                                    <c:set var="emailUt" value="${utente.email}"></c:set>

                                                </c:if>
                                            </c:forEach>
                                        </p>
                                    </li> 
                                    <div id="hidePermessi${utL.idUtente}">
                                        <form action="../ModCondServlet" method="post">
                                            <input type="hidden" name="idUtente" id="idUtente" value="${utL.idUtente}">
                                            <input type="hidden" name="idLista" id="idLista" value="${idLista}">
                                            <strong style="float: left"><fmt:message key="modal.listShare.mod" /></strong> 
                                            <div class="form-check" style="float: right">
                                                <label class="form-check-label" for="exampleCheck1"> </label>
                                                <c:choose>
                                                    <c:when test="${utL.modCat == 1}">
                                                        <input type="checkbox" class="form-check-input" id="modCat" name ="modCat" checked>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="checkbox" class="form-check-input" id="modCat" name ="modCat" >
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>                                    
                                            <br />
                                            <strong style="float: left"><fmt:message key="addPerProd" /></strong> 
                                            <div class="form-check" style="float: right">
                                                <label class="form-check-label" for="exampleCheck1"> </label>
                                                <c:choose>
                                                    <c:when test="${utL.aggProd == 1}">
                                                        <input type="checkbox" class="form-check-input" id="aggProd" name ="aggProd" checked>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="checkbox" class="form-check-input" id="aggProd" name ="aggProd">
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>                                    
                                            <br />
                                            <strong style="float: left"><fmt:message key="deletePerProd" /></strong> 
                                            <div class="form-check" style="float: right">
                                                <label class="form-check-label" for="exampleCheck1"> </label>
                                                <c:choose>
                                                    <c:when test="${utL.elProd == 1}">
                                                        <input type="checkbox" class="form-check-input" id="elProd" name ="elProd" checked>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="checkbox" class="form-check-input" id="elProd" name ="elProd">
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>                                    
                                            <br />
                                            <strong style="float: left"><fmt:message key="deletePerList" /></strong> 
                                            <div class="form-check" style="float: right">
                                                <label class="form-check-label" for="exampleCheck1"> </label>
                                                <c:choose>
                                                    <c:when test="${utL.elLista == 1}">
                                                        <input type="checkbox" class="form-check-input" id="elLista" name ="elLista" checked>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="checkbox" class="form-check-input" id="elLista" name ="elLista">
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <br /><div class="dropdown-divider"></div>
                                            <strong style="float: left"><fmt:message key="deleteShare" /></strong> 
                                            <div class="form-check" style="float: right">
                                                <label class="form-check-label" for="exampleCheck1"> </label>
                                                <input type="checkbox" class="form-check-input" id="annulla" name ="annulla">
                                            </div><br />
                                            <div class="dropdown-divider"></div>                                    
                                            <br />
                                            <div style="text-align: center">
                                                <button type="submit" class="btn btn-success" ><fmt:message key="updatePermission" /></button>
                                            </div><br />
                                        </form>
                                    </div>
                                </c:if>
                            </c:if>
                        </c:forEach>
                    </ul>                    
                        <c:if test="${nC <= 1}">
                            <p><fmt:message key="notShare" /></p>
                        </c:if>
                    
                </div>
            </div>
            <div class="modal-footer">                        
                <button type="button" class="btn btn-danger" data-dismiss="modal"><fmt:message key="button.cancel" /></button>
            </div>
        </div>
    </div>
</div>

<!-- Latest compiled and minified JavaScript -->

<!-- File per navbar -->  
<script src="../js/jquery-3.2.1.slim.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>


<script >

    $("#info").on("show.bs.modal", function (event) {
        var target = $(event.relatedTarget) 
        var prodottoId = target.data("id-prodotto");
        var prodNome = target.data("nome-prodotto");
        var prodNote = target.data("note-prodotto");
        var prodCat = target.data("categoria-prodotto");
        var prodLogo = target.data("logo-prodotto");
        document.getElementById("no").innerHTML = prodNome;
        document.getElementById("not").innerHTML = prodNote;
        document.getElementById("cat").innerHTML = prodCat;
        var pic = document.getElementById('pL');
        pic.src = ("../TemplateAvatar/" + prodLogo);


        $.ajax({
            type: "POST",
            url: "../SlideshowServlet",
            data:  {
                idProd : prodottoId
            },
            success: function(html){
                $("#carouselExampleControls").html(html);
            }
        });
            
    });

    
   


</script>
<script >

    $("#rimuoviProd").on("show.bs.modal", function (event) {
        var target = $(event.relatedTarget) // Button that triggered the modal
        // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this)

        var prodottoId = target.data("id-prodotto");
        var idLista = target.data("id-lista");
        modal.find("#idList").val(idLista);

        modal.find("#idProdotto").val(prodottoId);

    });

</script>
<script >

    $("#manageList").on("show.bs.modal", function (event) {
        var target = $(event.relatedTarget) // Button that triggered the modal
        // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this)


        var idLista = target.data("id-lista");
        var nome = target.data("nome-lista");
        var descrizione = target.data("descrizione-lista");
        var idCat = target.data("categoria-lista");
        modal.find("#idList").val(idLista);

        modal.find("#nome").val(nome);
        modal.find("#descrizione").val(descrizione);
        modal.find("#catL").val(idCat);
        modal.find("#idLista").val(idLista);

    });

</script>

<script>
    $(document).ready(function () {
        $('#tabProd').DataTable({
            "language": {
                "url": "../js/lingua/Italian.json"
            },
            "fnDrawCallback": function (oSettings) {
                if ($(".dataTables_empty")[0]) {
                    $('#agP').prop("disabled", false);
                } else {
                    $('#agP').prop("disabled", true);
                }
            }
        });
    });
</script>
<script>
    $("#arrow").click(function () {
        $("#elementHide").toggle("slow");
        return false;
    });
</script>

<!-- Funzione per mostrare o meno la tabella-->
<c:forEach var="utL" items="${sessionScope.utentiL}">
    <c:if test="${utL.idListaSpesa == idLista}">
        <script>
            $("#showPermessi${utL.idUtente}").click(function () {
                $("#hidePermessi${utL.idUtente}").toggle("slow");
            });
        </script>
    </c:if>
</c:forEach>