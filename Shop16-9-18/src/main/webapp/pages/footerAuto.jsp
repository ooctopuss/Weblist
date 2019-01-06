<%-- 
    Document   : footer
    Created on : 29-set-2018, 12.00.24
    Author     : octopussy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>   
           
        <!-- Latest compiled and minified JavaScript -->
        <script src="../js/select2.min.js" crossorigin="anonymous"></script>
        <script src="../js/index.js"></script>
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
