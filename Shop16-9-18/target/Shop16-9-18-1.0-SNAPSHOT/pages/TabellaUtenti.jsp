<%-- 
    Document   : TabellaUtenti
    Created on : 9-ott-2018, 20.17.26
    Author     : Safouane
--%>


<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="internazional.messages" />

<!DOCTYPE html>


<div class="container-fluid">
    
    <table id="tabProd" class="table table-striped table-hover display text-center responsive nowrap" width="100%" cellspacing="0">
        <thead>
            <tr>
                <th><fmt:message key="signModal.name" /></th>
                <th><fmt:message key="signModal.surname" /></th>
                <th><fmt:message key="signModal.email" /></th>
                <th><fmt:message key="adminChk" /></th>
                <th><fmt:message key="profilePhoto" /></th>
                <th><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M4.48 7.27c.26.26 1.28 1.33 1.28 1.33l.56-.58-.88-.91 1.69-1.8s-.76-.74-.43-.45c.32-1.19.03-2.51-.87-3.44C4.93.5 3.66.2 2.52.51l1.93 2-.51 1.96-1.89.52-1.93-2C-.19 4.17.1 5.48 1 6.4c.94.98 2.29 1.26 3.48.87zm6.44 1.94l-2.33 2.3 3.84 3.98c.31.33.73.49 1.14.49.41 0 .82-.16 1.14-.49.63-.65.63-1.7 0-2.35l-3.79-3.93zM16 2.53L13.55 0 6.33 7.46l.88.91-4.31 4.46-.99.53-1.39 2.27.35.37 2.2-1.44.51-1.02L7.9 9.08l.88.91L16 2.53z"/></svg> <fmt:message key="tab.Operation" /></th>
            </tr>
        </thead>
        <tbody>
                    
            <c:forEach var="ut" items="${sessionScope.utenti}">
                <tr>
                    <td>${ut.nome} </td>
                    <td>${ut.cognome}</td>
                    <td>${ut.email}</td>
                    <c:choose>
                        <c:when test="${ut.admin == 1}">
                            <td><svg xmlns="http://www.w3.org/2000/svg" width="12" height="16" viewBox="0 0 12 16"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg></td>    
                        </c:when>
                        <c:otherwise>
                            <td></td>
                        </c:otherwise>
                    </c:choose>
                    
                    <td><img src = "${sessionScope.uploadDir}${"\\"}${ut.indirizzoI}"height="42" width="42"></td>
                    <td>
                        <a href="" class="btn btn-warning btn-rounded mb-4" data-toggle="modal" data-target="#modUt" data-ut-id="${ut.id}" data-ut-nome="${ut.nome}" data-ut-cognome = "${ut.cognome}" data-ut-email ="${ut.email}" data-ut-admin ="${ut.admin}"><svg xmlns="http://www.w3.org/2000/svg" width="18" height="20" viewBox="0 0 14 16"><path fill-rule="evenodd" d="M0 12v3h3l8-8-3-3-8 8zm3 2H1v-2h1v1h1v1zm10.3-9.3L12 6 9 3l1.3-1.3a.996.996 0 0 1 1.41 0l1.59 1.59c.39.39.39 1.02 0 1.41z"/></svg></a>
                    </td>   
                </tr>
            </c:forEach>
                 
        </tbody> 
    </table>
</div>

<!-- Modal per modificare dati utenti -->
<div class="modal fade" id="modUt"  tabindex="-1" role="dialog" aria-labelledby="titleLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="titleLabel"><fmt:message key="admin.modUser" /></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="../ModAmmUtenteServlet" method="post" >
                <div class="modal-body">
                    <div class="modal-body mx-12">
                        <div class="md-form mb-5">
                            <input type="hidden"  name ="idUt" class="form-control" id ="idUt">
                            <label for ="nome"><fmt:message key="signModal.name" /></label>
                            <input type="text" name="nomeM" class="form-control" id="nomeM" placeholder="<fmt:message key="place.nameUs" />" disabled>
                        </div>
                        <div class="md-form mb-5">
                            <label><fmt:message key="signModal.surname" /></label>
                            <input type="text" name="cognome" class="form-control" id="cognome" placeholder="<fmt:message key="place.surnameUs" />" disabled>
                        </div>
                        <div class="md-form mb-5">
                            <label><fmt:message key="signModal.email" /></label>
                            <input type="hidden" name="emailM" class="form-control" id="emailM" placeholder="<fmt:message key="signModal.email.labelEmail" />" >
                            <input type="text" name="email" class="form-control" id="email" placeholder="<fmt:message key="signModal.email.labelEmail" />" disabled>
                        </div>
                        <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="adminM" name="adminM">
                                <label class="form-check-label" for="exampleCheck1"><fmt:message key="adminChk" /></label>
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
<!-- File per navbar -->  
        <script src="../js/jquery-3.2.1.slim.min.js"></script>
        <script src="../js/popper.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
         
         
         <script >
    
            $("#modUt").on("show.bs.modal", function (event) {
                var target = $(event.relatedTarget) // Button that triggered the modal
                // Extract info from data-* attributes
                // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
                // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
                var modal = $(this)

                var utId = target.data("ut-id");
            
                var utNome = target.data("ut-nome");
                var utCognome = target.data("ut-cognome");
                var utEmail = target.data("ut-email");
                var utAdmin = target.data("ut-admin");
                
                
                modal.find("#idUt").val(utId);
                modal.find("input[name='nomeM']").val(utNome);
                modal.find("input[name='cognome']").val(utCognome);
                modal.find("input[name='email']").val(utEmail);
                modal.find("input[name='emailM']").val(utEmail);

                if(utAdmin === 1){
                    document.getElementById("adminM").checked = true;
                }else{document.getElementById("adminM").checked = false;}

               
            });

        </script>
       

       
  
