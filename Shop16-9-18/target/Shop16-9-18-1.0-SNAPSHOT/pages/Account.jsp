<%-- 
    Document   : Account
    Created on : 2-ott-2018, 10.56.58
    Author     : octopussy
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>




<c:set var ="title" value="Account" scope="session"></c:set>
<%@include file="nav-bar.jsp" %>


<div class="container-fluid">
    <br />
    <div class="row">
        <div class="col-sm-4">
            
                <div class="form-group">
                    
                    <input type="image" src="${sessionScope.uploadDir}${"\\"}${sessionScope.utente.indirizzoI}" class="img-fluid rounded imgSotto" alt="immagine profilo"/>
                    
                </div>
                        
            
        </div>
        <div class="col-sm-7">
            <form method ="POST" action="../ModAccServlet" id="formCompleto" enctype='multipart/form-data'>
                <div class="form-group">
                    <label><fmt:message key="signModal.name" /></label>
                    <input type="text" class="form-control" id="nome" name="nome" value ="${sessionScope.utente.nome}" >
                </div>
                <div class="form-group">
                    <label><fmt:message key="signModal.surname" /></label>
                    <input type="text" class="form-control" id="cognome" name ="cognome" value ="${sessionScope.utente.cognome}" >
                </div>
                <div class="form-group">
                    <label><fmt:message key="signModal.email" /></label>
                    <input type="hidden" name ="email" id="name" value ="${sessionScope.email}">
                    <input type="email" class="form-control" id="modUtent" value ="${sessionScope.utente.email}" disabled="">
                </div>
                <div class="form-group">
                    <label><fmt:message key="login.psw" /></label>
                    <div class="input-group mb-3">
                        <input type="password" class="form-control"  aria-label="Recipient's username" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-success" type="button" data-toggle="modal" data-target="#modPsw"><fmt:message key="account.button.modPsw" /></button>
                        </div>
                    </div>
                    <div style="color:red">${errorMessage}</div>
                </div>
            
            
                <div class="form-group">
                    <label><fmt:message key="account.photo" /></label>
                    <div class="input-group mb-3">
                        <input type="file" name="profilo" id="profilo" />
                    </div>
                    <div style="color:red">${errorMessage}</div>
                </div>
                
            </form>
        </div>

    </div>
                <div class="row">
                    <div class="col-sm-4">
                    </div>
                    <div class="col-sm-7">
                        <button type="submit" class="btn btn-warning" form="formCompleto" value="Salva" style="float: right"><strong><fmt:message key="account.saveChanges" /></strong></button>
                <br />
                    </div>
                </div>
</div>
                
<div class="modal fade" id="modPsw" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"><fmt:message key="account.modal.title" /></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="ModPswServlet" method="post" >

                <div class="modal-body">
                    <div class="modal-body mx-12">
                        <input type="hidden" value="${sessionScope.utente.email}" name="email" id="email">
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
                        <div class="md-form mb-5">
                            <label><fmt:message key="account.modal.newPsw" /></label>
                            <input type="password" name="password1" class="form-control" id="password1" placeholder="<fmt:message key="login.psw.labelPsw" />" required>
                            <small id="passHelp" class="form-text text-muted"><fmt:message key="signModal.psw.small" /></small>
                        </div>
                        <div class="md-form mb-5">
                            <label><fmt:message key="account.modal.confirmPsw" /></label>
                            <input type="password" name="password2" class="form-control" id="password2" placeholder="<fmt:message key="login.psw.labelPsw" />" required>
                        </div>
                        <span id='message'></span><br/>
                        <span id="result" class="result"></span>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal"><fmt:message key="button.cancel" /></button>
                    <button type="submit" id ="modBtn" class="btn btn-success"><fmt:message key="button.modify" /></button>
                </div>
            </form>
        </div>
    </div>
</div>



<script src="../js/jquery-3.2.1.slim.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>

<%@include file="footer2.jsp" %>

<script>
    $('#password1, #password2').on('keyup', function () {
        if ($('#password1').val() == $('#password2').val()) {
            $('#message').html('Matching').css('color', 'green');
            $('#modBtn').prop('disabled', false);
        } else{
            $('#modBtn').prop('disabled', true);
            $('#message').html('Not Matching').css('color', 'red');
        }
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
            $('#modBtn').prop('disabled', true);
            $('#result').html('Password debole').css('color', 'red');        
        } else {
            $('#modBtn').prop('disabled', false);
            $('#result').html('')
        }
    });
    
    
    
</script>
<%@include file="ControlloChat.jsp" %>





