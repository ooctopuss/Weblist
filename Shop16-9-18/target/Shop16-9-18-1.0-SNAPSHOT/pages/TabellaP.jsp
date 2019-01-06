<%-- 
    Document   : Tabella
    Created on : 30-set-2018, 16.15.16
    Author     : octopussy
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
        <a href="" class="btn btn-success btn-rounded mb-4" data-toggle="modal" data-target="#aggProd"><fmt:message key="button.products" /></a>
    </div>
            <table id="tabProd" class="table table-striped table-hover display text-center responsive nowrap" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th><fmt:message key="catLogo" /></th>
                        <th><fmt:message key="signModal.name" /></th>
                        <th><fmt:message key="admin.prodCat" /></th>
                        <th><fmt:message key="admin.prodNotes" /></th>
                        <th><fmt:message key="admin.imgProd" /></th>
                        <th><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M4.48 7.27c.26.26 1.28 1.33 1.28 1.33l.56-.58-.88-.91 1.69-1.8s-.76-.74-.43-.45c.32-1.19.03-2.51-.87-3.44C4.93.5 3.66.2 2.52.51l1.93 2-.51 1.96-1.89.52-1.93-2C-.19 4.17.1 5.48 1 6.4c.94.98 2.29 1.26 3.48.87zm6.44 1.94l-2.33 2.3 3.84 3.98c.31.33.73.49 1.14.49.41 0 .82-.16 1.14-.49.63-.65.63-1.7 0-2.35l-3.79-3.93zM16 2.53L13.55 0 6.33 7.46l.88.91-4.31 4.46-.99.53-1.39 2.27.35.37 2.2-1.44.51-1.02L7.9 9.08l.88.91L16 2.53z"/></svg> <fmt:message key="tab.Operation" /></th>
                    </tr>
                </thead>
                <tbody>
                    
                    <c:forEach var="prod" items="${sessionScope.prodotti}">
                        <tr>
                            
                            <td><img src = "${sessionScope.uploadDir}${"\\"}${prod.indirizzoL}"height="42" width="42" alt ="logo prodotto"></td>
                            <td>${prod.nome} </td>
                            <td>${prod.nomeCat}</td>
                            <td>${prod.note}</td>
                            <td>
                                <c:forEach var ="imma" items="${sessionScope.immagini}">
                                    <c:if test="${imma.idProdotto == prod.id}">
                                        <img src = "${sessionScope.uploadDir}${imma.indirizzo}"height="42" width="42" alt="immagine prodotto">
                                    </c:if>
                                </c:forEach>
                            </td>
                            <td>
                                <a href="" class="btn btn-warning btn-rounded mb-4" data-toggle="modal" data-target="#modProd" data-prodotto-id="${prod.id}" data-prodotto-nome="${prod.nome}" data-categoria-prodotto = "${prod.idCategoriaProdotto}" data-prodotto-note = "${prod.note}" data-prodotto-logo="${uploadL}" data-prodotto-immagine ="${uploadI}"><svg xmlns="http://www.w3.org/2000/svg" width="18" height="20" viewBox="0 0 14 16"><path fill-rule="evenodd" d="M0 12v3h3l8-8-3-3-8 8zm3 2H1v-2h1v1h1v1zm10.3-9.3L12 6 9 3l1.3-1.3a.996.996 0 0 1 1.41 0l1.59 1.59c.39.39.39 1.02 0 1.41z"/></svg></a>
                                <a href="" class="btn btn-danger btn-rounded mb-4" data-toggle="modal" data-target="#cancProd" data-prodotto-id="${prod.id}"><svg xmlns="http://www.w3.org/2000/svg" width="18" height="20" viewBox="0 0 12 16"><path fill-rule="evenodd" d="M11 2H9c0-.55-.45-1-1-1H5c-.55 0-1 .45-1 1H2c-.55 0-1 .45-1 1v1c0 .55.45 1 1 1v9c0 .55.45 1 1 1h7c.55 0 1-.45 1-1V5c.55 0 1-.45 1-1V3c0-.55-.45-1-1-1zm-1 12H3V5h1v8h1V5h1v8h1V5h1v8h1V5h1v9zm1-10H2V3h9v1z"/></svg></a>
                            </td>   

                        </tr>
                    </c:forEach>
                 
                </tbody> 
            </table>
</div>
<!-- Modal per aggiungere il prodotto -->  
<div class="modal fade" id="aggProd" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"><fmt:message key="button.products" /></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="../AggProd" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="modal-body mx-12">
                        <div class="md-form mb-5">
                            <label><fmt:message key="signModal.name" /></label>
                            <input type="text" name="nome" class="form-control" id="nome" placeholder="<fmt:message key="label.nameProd" />" required>
                        </div>
                        <div class="md-form mb-5">
                            <label><fmt:message key="admin.prodNotes" /></label>
                            <input type="text" name="note" class="form-control" id="note" placeholder="<fmt:message key="label.descProd" />" required>
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
<!-- Modal per eliminare il prodotto -->
<div class="modal fade" id="cancProd" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"><fmt:message key="admin.deleteProd" /></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="../CancProdServlet" method="post" >
                <div class="modal-body">
                    <input type ="hidden" name="idProdotto" id="idProdotto">
                    <p><fmt:message key="admin.prodSecure" /></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal"><fmt:message key="button.no" /></button>
                    <button type="submit" class="btn btn-success"><fmt:message key="button.yes" /></button>
                </div>
            </form>
        </div>
    </div>
</div>



<!-- Modal per modificare il prodotto -->
<div class="modal fade" id="modProd"  tabindex="-1" role="dialog" aria-labelledby="titleLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="titleLabel"><fmt:message key="admin.modProduct" /></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="../ModProdServlet" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="modal-body mx-12">
                        <div class="md-form mb-5">
                            <input type="hidden"  name ="idProdotto" class="form-control" id ="idProdotto">
                            <label for ="nome"><fmt:message key="signModal.name" /></label>
                            <input type="text" name="nomeM" class="form-control" id="nomeM" placeholder="<fmt:message key="label.nameProd" />" required>
                        </div>
                        <div class="md-form mb-5">
                            <label><fmt:message key="admin.prodNotes" /></label>
                            <input type="text" name="note" class="form-control" id="note" placeholder="<fmt:message key="label.descProd" />" required>
                        </div>
                        <div class="md-form mb-5">
                            <label><fmt:message key="admin.prodCat" /></label>
                            
                            <select class="custom-select" id="catProd" name = "catProd">
                                <option id="catProd" value = "" selected><fmt:message key="admin.select" /></option>
                                <c:forEach items ="${sessionScope.categorieP}" var="cate">
                                    <option  value="${cate.id}">${cate.nome}</option>   
                                </c:forEach>
                            </select>
                        </div>
                        <div class="md-form mb-5">
                            <label><fmt:message key="admin.imgProd" /></label>
                            <input type="file" name="multiplefile" class="form-control" id="multiplefile" placeholder="" multiple> 
                        </div>
                        <div class="md-form mb-5">
                            <label><fmt:message key="logoProd" /></label>
                            <input type="file" name="logo" class="form-control" id="logo" placeholder="" > 
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
    
            $("#modProd").on("show.bs.modal", function (event) {
                var target = $(event.relatedTarget) // Button that triggered the modal
                // Extract info from data-* attributes
                // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
                // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
                var modal = $(this)

                var prodottoId = target.data("prodotto-id");
            
                var prodNome = target.data("prodotto-nome");
                var prodNote = target.data("prodotto-note");
                var prodCat = target.data("categoria-prodotto");
                var prodLogo = target.data("prodotto-logo");
                var prodImm = target.data ("prodotto-immagine");
                
                modal.find("#idProdotto").val(prodottoId);
                modal.find("input[name='nomeM']").val(prodNome);
                modal.find("input[name='note']").val(prodNote);
                modal.find("#catProd").val(prodCat);
            });

        </script>
        <script >
    
            $("#cancProd").on("show.bs.modal", function (event) {
                var target = $(event.relatedTarget) // Button that triggered the modal
                // Extract info from data-* attributes
                // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
                // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
                var modal = $(this)

                var prodottoId = target.data("prodotto-id");
                
                
                modal.find("#idProdotto").val(prodottoId);
               
            });

        </script>

       
  
