<%-- 
    Document   : ControlloChat
    Created on : 27-dic-2018, 23.41.02
    Author     : Safouane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<script>
    <c:if test="${sessionScope.utente != null}">
    $.ajax({
            type: "POST",
            url: "../ControlloChatServlet",
            success: function(html){
                $("#chatN").html(html);
            }
        });
    setInterval(function(){
        $.ajax({
            type: "POST",
            url: "../ControlloChatServlet",
            success: function(html){
                $("#chatN").html(html);
            }
        });
    }, 10 * 1000);
    </c:if>
</script>