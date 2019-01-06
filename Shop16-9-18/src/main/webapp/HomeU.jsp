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

<c:set var ="title" value="Home" scope="session"></c:set>



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
                <span class="navbar-toggler-icon"></span>
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

                                <a class="nav-link text-center" href="Chat.jsp"> </a>
                                <div class="dropdown-divider"></div>
                                </div>
                            </li>
                    </c:if>
                    
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
                                    <a class="nav-link text-center" href="pages/chkListe.jsp"><fmt:message key="button.lists" /></a>
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
            
            
            
            <c:if test="${not empty erroreSintassi}">
                
                    <c:if test="${erroreSintassi eq true}">
                        <div class="alert alert-danger alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <strong><fmt:message key="error" /></strong>  <fmt:message key="mail.worngSyntx" />
                        </div>
                    </c:if>
                
            </c:if>
            <c:if test="${not empty emailPresente}">
                
                    <c:if test="${emailPresente eq true}">
                        <div class="alert alert-danger alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <strong><fmt:message key="error" /></strong>  <fmt:message key="mail.alreadyPresent" />
                        </div>
                    </c:if>
                
            </c:if>
            <c:if test="${not empty emailPasswordErrata}">
                
                    <c:if test="${emailPasswordErrata eq true}">
                        <div class="alert alert-danger alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <strong><fmt:message key="error" /></strong>  <fmt:message key="chk.incorrect" />
                        </div>
                    </c:if>
                
            </c:if>
            <c:if test="${not empty emailErrata}">
                
                    <c:if test="${emailErrata eq true}">
                        <div class="alert alert-danger alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <strong><fmt:message key="error" /></strong>  <fmt:message key="mail.notPresent" />
                        </div>
                    </c:if>
                
            </c:if>
            <c:if test="${not empty utenteNonChecked}">
                
                    <c:if test="${utenteNonChecked eq true}">
                        <div class="alert alert-danger alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <strong><fmt:message key="error" /></strong>  <fmt:message key="confirmMail" />
                        </div>
                    </c:if>
                
            </c:if>
            
            <c:if test="${param.t == 1}">
                <div class="alert alert-danger alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong><fmt:message key="error" /></strong>  <fmt:message key="noList" />
                </div>
            </c:if>
      
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
            <form action="CreaListaAnonServlet" method="post" enctype="multipart/form-data">
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
                                <option selected><fmt:message key="modal.addList.labelCategory" /></option>
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
            
<div class="bg">
    <div class="titHom text-center">
        <fmt:message key="navbar.title" />        
    </div>
    <div class="pText text-center">
        <strong><fmt:message key="bg.text" /></strong>
    </div>
    <a href="#oraVedi"><img class="arrow d-none d-lg-block" src="TemplateAvatar/arrow.png" /></a>
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
        <c:choose>
            <c:when test="${sessionScope.utenteAnon != null}">
                <div class="card text-white bg-info mb-5" style="max-width: 50rem;">
                    <a class="panel-link" href="" data-toggle="modal" data-target="#listaCreata">
                        <div class="card-body">
                            <h3 class="card-title text-center"><strong><fmt:message key="button.doList" /></strong></h3>
                        </div>
                    </a>
                </div>
            </c:when>
            <c:otherwise>
                <div class="card text-white bg-info mb-5" style="max-width: 50rem;">
                    <a class="panel-link" href="" data-toggle="modal" data-target="#aggLista">
                        <div class="card-body">
                            <h3 class="card-title text-center"><strong><fmt:message key="button.doList" /></strong></h3>
                        </div>
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
        
        </div>
        <div class="col-md-5">
        <div class="card text-white bg-info mb-5" style="max-width: 50rem;">
            <a class="panel-link" href="pages/chkListe.jsp">
                <div class="card-body">
                    <h3 class="card-title text-center"><strong><fmt:message key="button.lists" /></strong></h3>
                </div>
            </a>
        </div>
        </div>
        </div>     
</div>

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

<div class="modal fade" id="gdpr" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"><fmt:message key="gdpr.title" /></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            
                <div class="modal-body">
                    <div class="form-group">

                    <p id="${sessionScope.gdpr}" style="text-align: justify"><fmt:message key="gdpr.body" /></p><p style="text-align: right"> <fmt:message key="gdpr.end" /></p>
                    </div>

                    <div class="modal-footer">
                        <a href="gdpr.jsp"><button type="button" class="btn btn-danger" ><fmt:message key="gdpr.cancel" /></button></a>
                        <a href="GdprServlet"><button type="button" class="btn btn-success" ><fmt:message key="gdpr.ok" /></button></a>
                    </div>
                </div>
            
        </div>
    </div>
</div>
<div class="modal fade" id="listaCreata" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"><fmt:message key="advertList" /></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            
                <div class="modal-body">
                    <div class="form-group">

                    <p style="text-align: justify"><fmt:message key="advertList.body" /> </p>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-success" data-dismiss="modal"><fmt:message key="button.go" /></button>
                    </div>
                </div>
            
        </div>
    </div>
</div>



        


<!-- File per navbar -->  
<script src="js/jquery-3.2.1.slim.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<!-- Data tables -->               
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/responsive/1.0.7/js/dataTables.responsive.min.js"></script>
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
<script>
    $(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
        });
    });
</script>
<c:if test="${languages == ''}">
    
</c:if>
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
        
        <c:if test="${sessionScope.gdpr != 1}">
    $(window).on('load',function () {
        jQuery.noConflict(); 
    $('#gdpr').modal('show'); 
    });
    </c:if>
    </script>

</body>
</html>
