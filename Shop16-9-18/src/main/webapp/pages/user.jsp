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
<div class="container-fluid text-center">
    <div class="row text-center" id="oraVedi">
        <div class="col-md-1"></div>
        <div class="col-md-5">
        <div class="card text-white bg-info mb-5" style="max-width: 50rem;">
            <a class="panel-link" href="" data-toggle="modal" data-target="#aggLista">
                <div class="card-body">
                    <h3 class="card-title text-center"><strong><fmt:message key="button.doList" /></strong></h3>
                </div>
            </a>
        </div>
        </div>
        <div class="col-md-5">
        <div class="card text-white bg-info mb-5" style="max-width: 50rem;">
            <a class="panel-link" href="chkListe.jsp">
                <div class="card-body">
                    <h3 class="card-title text-center"><strong><fmt:message key="button.lists" /></strong></h3>
                </div>
            </a>
        </div>
        </div>
        </div>     
</div>

<!-- Modal per aggiungere il lista -->  
<div class="modal fade" id="aggLista" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"><fmt:message key="modal.addList.title" /></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="../CreaListaServlet" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="modal-body mx-12">
                        <div class="md-form mb-5">
                            <label><fmt:message key="modal.addList.name" /></label>
                            <input type="text" name="nome" class="form-control" id="nome" placeholder="<fmt:message key="modal.addList.labelName" />" required>
                        </div>
                        <div class="md-form mb-5">
                            <label><fmt:message key="modal.addList.description" /></label>
                            <input type="text" name="descrizione" class="form-control" id="note" placeholder="<fmt:message key="modal.addList.labelDescription" />" required>
                        </div>
                        <div class="md-form mb-5">
                            <label><fmt:message key="modal.addList.category" /></label>
                            
                            <select class="custom-select" id="catL" name = "catL">
                                <option selected><fmt:message key="modal.addList.labelCategory" /> <c:out value="${cat.id}"></c:out></option>
                                <c:forEach items ="${sessionScope.categorieL}" var="cat">
                                    <option value="${cat.id}">${cat.nome}</option>   
                                </c:forEach>
                            </select>
                        </div>
                        <div class="md-form mb-5">
                            <label><fmt:message key="modal.addList.img" /></label>
                            <input type="file" name="immagine" class="form-control" id="immagine" placeholder="" required>
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