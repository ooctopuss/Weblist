<%-- 
    Document   : Home
    Created on : 29-set-2018, 11.43.24
    Author     : octopussy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="internazional.messages" />
<!DOCTYPE html>

<c:set var ="title" value="Conferma mail" scope="session"></c:set>
<html lang="${language}">
    <head>        
        <title><c:out value ="${sessionScope.title}"></c:out></title>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="stylesheet" href="css/bootstrap.min.css">
            <link rel="stylesheet" href="css/style.css">
            <link rel="stylesheet" href="css/floating-labels.css">
            <link rel="stylesheet" href="css/forms.css">
            <link rel="stylesheet" href="css/chat.css">
            <!--Autocomplete-->
            <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet">
            <!-- INCLUDO FILE PER DATATABLE -->
            <link rel="stylesheet" type="text/css" href="css/jquery.dataTables.min.css">
            <link rel="stylesheet" type="text/css" href="css/responsive.dataTables.min.css">
        </head>
        <body>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <c:if test = "${sessionScope.utente.admin == null}">
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
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
               
            </div>
        </nav>

<br />
<div class="row">
    <div class="col-md-3"></div>
    <div class="col-md-6">
        <div class="text-center">
            <p style="text-align: justify"><fmt:message key="gdpr.body" /></p><p style="text-align: right"> <fmt:message key="gdpr.end" /></p>
            <a href="HomeU.jsp"><button type="button" class="btn btn-success" data-dismiss="modal"><fmt:message key="gdpr.ok" /></button></a>
        </div>
    </div>
</div>
<br /><br />
<script src="js/jquery-3.2.1.slim.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<!-- Data tables -->               
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/responsive/1.0.7/js/dataTables.responsive.min.js"></script>

<script>
    $(document).ready(function () {
        $('#tabProd').DataTable({
            "language": {
                "url": "js/lingua/Italian.json"
            }
        });

    });
</script>
<script src="js/pChat.js"></script>

</body>
</html>