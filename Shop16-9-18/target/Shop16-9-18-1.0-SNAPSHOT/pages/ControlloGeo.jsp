<%-- 
    Document   : ControlloGeo
    Created on : 30-nov-2018, 0.45.39
    Author     : octopussy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
    
    $.getJSON("http://ip-api.io/json/",
    function(result) {
        
    });
    
    $.getJSON('http://ip-api.io/json/', function(response) {
        
        var seconds = 8;
        $.ajax({
                url: '../GeoLocalizzazioneServlet',
                data: {latitude: response.latitude, longitude: response.longitude},
                success:function(data){
                    $("#locN").html(data);

                }
        });
        setInterval(function(){
            $.ajax({
                url: '../GeoLocalizzazioneServlet',
                data: {latitude: response.latitude, longitude: response.longitude},
                success:function(data){
                    $("#locN").html(data);

                }
            });
        }, seconds * 1000);
    });
    
    
    
</script>

</body>
</html>
