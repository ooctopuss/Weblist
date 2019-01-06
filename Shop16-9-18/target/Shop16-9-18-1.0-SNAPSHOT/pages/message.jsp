<%-- 
    Document   : footer
    Created on : 29-set-2018, 12.00.24
    Author     : octopussy
--%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="internazional.messages" />

<div class="menu">
    <a href="javascript:history.back();">
        <div class="back"><i class="fa fa-chevron-left"></i> <img src="${sessionScope.uploadDir}${"\\"}${sessionScope.utente.indirizzoI}" draggable="false"/></div>
        <div class="name">
            <c:forEach items="${sessionScope.listeS}" var="lis">
                <c:if test="${lis.id == param.list}">
                    <div class="d-none d-lg-block">${lis.nome}</div>
                       <div class="d-lg-none">
                           <c:set var = "name" value = "${fn:substring(lis.nome, 0, 15)}" ></c:set>
                           ${name}...
                       </div>
                </c:if>
            </c:forEach>
        </div>
        
    </a>
</div>
<br /><br />
<div id="mex" style="max-height: 843px; overflow-y: scroll">
    <ul class="list-unstyled" id="messages">
    </ul>
</div>


<input class="textarea" type="text" id="msg" placeholder="<fmt:message key="place.typeHere" />"/><div class="pic" onclick="invio();"></div>

