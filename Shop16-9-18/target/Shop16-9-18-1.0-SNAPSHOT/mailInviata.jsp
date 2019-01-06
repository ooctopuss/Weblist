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
                <a class="navbar-brand" href="HomeU.jsp"><fmt:message key="navbar.title" /></a>
            
            
            <c:choose>
                    <c:when test = "${language == 'en'}">
                        <img src="TemplateAvatar/en.gif" width="30" height="25" />
                    </c:when>
                    <c:when test = "${language == 'it'}">
                        <img src="TemplateAvatar/it.gif" width="30" height="25" />
                    </c:when>
                </c:choose>     
            
            <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
                    <ul class="navbar-nav ">
                        <li class="nav-item active text-center">
                            <a class="nav-link" href="HomeU.jsp">
                                <img src="TemplateAvatar/home.png" width="25" height="25" />
                            </a>
                        </li>
                   
                   
<!--#############################################            NOTIFICHE               ###################################################################################-->
                    
<!--#############################################            NOTIFICHE               ###################################################################################-->                
                   
                    
                        
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
        
        
        
                    <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"><fmt:message key="button.login" /></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="LoginServlet" method="post">
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
                    <form action="RegisterServlet" method="post">
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
                    <form action="RecuperoPasswordServlet" method="post">
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
        
        
        

<br />
<div class="text-center">
    <strong><fmt:message key="sendMail.body" /></strong>
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
<script>
    $('#password1').on('keyup', function () {    
        var strength = 0
        var password = $('#password1').val();
        
        if (password.length > 7) strength += 1
        if (password.match(/([a-z].*[A-Z])|([A-Z].*[a-z])/))  strength += 1
        if (password.match(/([a-zA-Z])/) && password.match(/([0-9])/))  strength += 1 
        if (password.match(/([!,%,&,@,#,$,^,*,?,_,~])/))  strength += 1
        if (password.match(/(.*[!,%,&,@,#,$,^,*,?,_,~].*[!,%,&,@,#,$,^,*,?,_,~])/)) strength += 1
        if (strength <= 3 ) {
            
            $('#regBtn').prop('disabled', true);
            $('#result').html('Password debole').css('color', 'red');        
        } else {
            $('#regBtn').prop('disabled', false);
            $('#result').html('')
        }
    });
    
    
    
</script>

</body>
</html>