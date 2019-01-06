<%-- 
    Document   : ControlloProd
    Created on : 19-nov-2018, 12.23.27
    Author     : octopussy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<div name="avN" id="avN">
    
</div>

<script>
    <c:if test="${sessionScope.utente != null}">
        var seconds = 5;
        var c = 1;
        $.ajax({
                url: '../ScadenzaProdServlet',
                success:function(data){
                    if(data!="")
                        $("#liN").html(data);

                    if(c == 1){
                        <c:if test="${sessionScope.notif != 0}">
                            MessageManager.show('<h1>Testing</h1>');
                            c--;
                        </c:if> 
                    }

                }
            });
        setInterval(function(){
            $.ajax({
                url: '../ScadenzaProdServlet',
                success:function(data){
                    if(data!="")
                        $("#liN").html(data);

                    if(c == 1){
                        <c:if test="${sessionScope.notif != 0}">
                            MessageManager.show('<h1>Testing</h1>');
                            c--;
                        </c:if> 
                    }

                }
            });
        }, seconds * 1000);
    </c:if>
</script>

<script>
    function tempAlert(msg,duration)
    {
        
        var timer = document.createElement('div');
        timer.innerHTML = "Hai una nuova notifica";
        timer.id ="ntD";
        timer.className="alert alert-info";
        timer.role ="alert";
        document.getElementById('avN').appendChild(timer);
        setTimeout(function() {$('#ntD').remove;}, 1000);
        
      
    }
    var MessageManager = {
    show: function(content) {
        $('#avN').addClass("alert alert-info");
        $('#avN').html("Hai una nuova notifica");
        setTimeout(function(){cont();
            
        }, 2000);
    }
};

    function cont(){
        $('#avN').removeClass();
        $('#avN').html("");
    }

</script>
