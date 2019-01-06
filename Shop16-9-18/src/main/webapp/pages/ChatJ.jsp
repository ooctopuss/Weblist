<%-- 
    Document   : ChatJ
    Created on : 27-dic-2018, 19.45.38
    Author     : Safouane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<script>
    <c:if test="${sessionScope.utente != null}">
    function invio(){
        $.ajax({
            url: '../inviaMessaggioServlet',
            data: {
                idLista : ${param.list},
                messaggio : $("#msg").val()
            }
        }).done(function(){
            $("#msg").val('');
            $.ajax({
                    type: "POST",
                    url: "../messaggiServlet",
                    data:  {
                        idLista : ${param.list}
                        
                    },
                    success: function(html){
                        $("#messages").html(html);
                         var myDiv = document.getElementById('mex');
                        myDiv.scrollTop = 9999999;
                        //$("#mex").animate({scrollTop: $('#mex')}, 7000);
                    }
                });
        });
    };
    
    $(document).ready(function () {
        
        <c:if test="${sessionScope.utente != null}">
                $.ajax({
                    type: "POST",
                    url: "../messaggiServlet",
                    data:  {
                        idLista : ${param.list}
                        
                    },
                    success: function(html){
                        $("#messages").html(html);
                        var myDiv = document.getElementById('mex');
                        myDiv.scrollTop = 9999999;
        //$("#mex").animate({scrollTop: $('#mex').prop("scrollHeight")}, 1000);
                    }
                });
               
            setInterval(function(){
                $.ajax({
                    type: "POST",
                    url: "../messaggiServlet",
                    data:  {
                        idLista : ${param.list}
                    },
                    success: function(html){
                        $("#messages").html(html);
                        var myDiv = document.getElementById('mex');
                        myDiv.scrollTop = 9999999;
                        //$("#mex").animate({scrollTop: $('#mex').prop("scrollHeight")}, 1000);
                    }
                });
            }, 10 * 1000);
            
            
        </c:if>
    });
        </c:if>
</script>
