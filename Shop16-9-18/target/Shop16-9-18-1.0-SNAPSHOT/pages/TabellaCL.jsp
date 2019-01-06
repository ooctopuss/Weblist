<%-- 
    Document   : TabellaCL
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
    <div class="text-center">
        <a href="" class="btn btn-success btn-rounded mb-4" data-toggle="modal" data-target="#aggCatL"><fmt:message key="button.categoryLists" /></a>
    </div>
    <table id="tabProd" class="table table-striped table-hover display text-center responsive nowrap" width="100%" cellspacing="0">
        <thead>
            <tr>
                <th><fmt:message key="signModal.name" /></th>
                <th><fmt:message key="modal.addList.description" /></th>
                <th><fmt:message key="modal.addList.Catimg" /></th>
                <th><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M4.48 7.27c.26.26 1.28 1.33 1.28 1.33l.56-.58-.88-.91 1.69-1.8s-.76-.74-.43-.45c.32-1.19.03-2.51-.87-3.44C4.93.5 3.66.2 2.52.51l1.93 2-.51 1.96-1.89.52-1.93-2C-.19 4.17.1 5.48 1 6.4c.94.98 2.29 1.26 3.48.87zm6.44 1.94l-2.33 2.3 3.84 3.98c.31.33.73.49 1.14.49.41 0 .82-.16 1.14-.49.63-.65.63-1.7 0-2.35l-3.79-3.93zM16 2.53L13.55 0 6.33 7.46l.88.91-4.31 4.46-.99.53-1.39 2.27.35.37 2.2-1.44.51-1.02L7.9 9.08l.88.91L16 2.53z"/></svg> <fmt:message key="tab.Operation" /></th>
            </tr>
        </thead>
        <tbody>
                    
            <c:forEach var="catL" items="${sessionScope.categorieL}">
                <tr>
                    <td>${catL.nome} </td>
                    <td>${catL.descrizione}</td>
                    <td>
                        <c:forEach var ="imma" items="${sessionScope.immaginiCL}">
                            
                            <c:if test="${imma.idCategoriaLista == catL.id}">
                                <img src = "${sessionScope.uploadDir}${"\\"}${imma.indirizzo}"height="42" width="42" alt="immagine categoria lista">
                            </c:if>
                        </c:forEach>
                    </td>
                    <td>
                        <a href="" class="btn btn-warning btn-rounded mb-4" data-toggle="modal" data-target="#modCatL" data-catL-id="${catL.id}" data-catL-nome="${catL.nome}" data-catL-descrizione = "${catL.descrizione}" ><svg xmlns="http://www.w3.org/2000/svg" width="18" height="20" viewBox="0 0 14 16"><path fill-rule="evenodd" d="M0 12v3h3l8-8-3-3-8 8zm3 2H1v-2h1v1h1v1zm10.3-9.3L12 6 9 3l1.3-1.3a.996.996 0 0 1 1.41 0l1.59 1.59c.39.39.39 1.02 0 1.41z"/></svg></a>
                        <a href="" class="btn btn-danger btn-rounded mb-4" data-toggle="modal" data-target="#cancCatL" data-catL-id="${catL.id}"><svg xmlns="http://www.w3.org/2000/svg" width="18" height="20" viewBox="0 0 12 16"><path fill-rule="evenodd" d="M11 2H9c0-.55-.45-1-1-1H5c-.55 0-1 .45-1 1H2c-.55 0-1 .45-1 1v1c0 .55.45 1 1 1v9c0 .55.45 1 1 1h7c.55 0 1-.45 1-1V5c.55 0 1-.45 1-1V3c0-.55-.45-1-1-1zm-1 12H3V5h1v8h1V5h1v8h1V5h1v8h1V5h1v9zm1-10H2V3h9v1z"/></svg></a>
                    </td>   
                </tr>
            </c:forEach>
                 
        </tbody> 
    </table>
</div>
<!-- Modal per aggiungere la categoria lista -->  
<div class="modal fade" id="aggCatL" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"><fmt:message key="button.categoryLists" /></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="../AggCatLServlet" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="modal-body mx-12">
                        <div class="md-form mb-5">

                            <label><fmt:message key="signModal.name" /></label>
                            <input type="text" name="nome" class="form-control" id="nome" placeholder="<fmt:message key="label.nameCatList" />" required>

                            <label>Nome:</label>
                            <select class="custom-select" id="nome" name = "nome">
                                <option selected>seleziona la categoria del prodotto</option>
                                <c:forEach items ="${sessionScope.tipo}" var="tip">
                                    <option value="${tip.idTypes}">${tip.nomeIt}</option>   
                                </c:forEach>
                            </select>

                        </div>
                        <div class="md-form mb-5">
                            <label><fmt:message key="modal.addList.description" /></label>
                            <input type="text" name="descrizione" class="form-control" id="note" placeholder="<fmt:message key="label.descCatList" />" required>
                        </div>
                        
                        <div class="md-form mb-5">
                            <label><fmt:message key="modal.addList.Catimg" /></label>
                            <input type="file" name="immagine" class="form-control" id="immagine" placeholder="" multiple required>
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
<!-- Modal per eliminare la categoria lista -->
<div class="modal fade" id="cancCatL" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"><fmt:message key="admin.deleteCatList" /></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="../CancCatLServlet" method="post" >
                <div class="modal-body">
                    <input type ="hidden" name="idCatL" id="idCatL">
                    <p><fmt:message key="admin.deleteCatListMessage" /></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal"><fmt:message key="button.no" /></button>
                    <button type="submit" class="btn btn-success"><fmt:message key="button.yes" /></button>
                </div>
            </form>
        </div>
    </div>
</div>



<!-- Modal per modificare la categoria lista -->
<div class="modal fade" id="modCatL"  tabindex="-1" role="dialog" aria-labelledby="titleLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="titleLabel"><fmt:message key="admin.modCatList" /></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="../ModCatLServlet" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="modal-body mx-12">
                        <div class="md-form mb-5">
                            <input type="hidden"  name ="idCatL" class="form-control" id ="idCatL">
<<<<<<< Updated upstream
                            <label for ="nome"><fmt:message key="signModal.name" /></label>
                            <input type="text" name="nomeM" class="form-control" id="nomeM" placeholder="<fmt:message key="label.nameCatList" />" required>
=======
                            <label for ="nome">Nome:</label>
                            <select class="custom-select" id="nomeM" name = "nomeM">
                                <option selected>seleziona la categoria del prodotto</option>
                                <c:forEach items ="${sessionScope.tipo}" var="tip">
                                    <option value="${tip.idTypes}">${tip.nomeIt}</option>   
                                </c:forEach>
                            </select>
>>>>>>> Stashed changes
                        </div>
                        <div class="md-form mb-5">
                            <label><fmt:message key="modal.addList.description" /></label>
                            <input type="text" name="descrizione" class="form-control" id="descrizione" placeholder="<fmt:message key="label.descCatList" />" required>
                        </div>
                        
                        <div class="md-form mb-5">
                            <label><fmt:message key="modal.addList.Catimg" /></label>
                            <input type="file" name="immagine" class="form-control" id="immagine" placeholder=""  multiple>
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
        <script src="../js/jquery-3.2.1.slim.min.js"></script>
        <script src="../js/popper.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
    
         
         
         
         
         <script >
    
            $("#modCatL").on("show.bs.modal", function (event) {
                var target = $(event.relatedTarget) // Button that triggered the modal
                // Extract info from data-* attributes
                // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
                // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
                var modal = $(this)

                var catLId = target.data("catl-id");
            
                var catLNome = target.data("catl-nome");
                var catLDescrizione = target.data("catl-descrizione");
                
                modal.find("#idCatL").val(catLId);
                modal.find("input[name='nomeM']").val(catLNome);
                modal.find("input[name='descrizione']").val(catLDescrizione);
               
            });

        </script>
        <script >
    
            $("#cancCatL").on("show.bs.modal", function (event) {
                var target = $(event.relatedTarget) // Button that triggered the modal
                // Extract info from data-* attributes
                // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
                // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
                var modal = $(this)

                var catLId = target.data("catl-id");
                
                
                modal.find("#idCatL").val(catLId);
               
            });

        </script>

       
  
