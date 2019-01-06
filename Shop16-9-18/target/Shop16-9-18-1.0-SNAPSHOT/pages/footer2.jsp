<%-- 
    Document   : footer2
    Created on : 17-ott-2018, 15.53.45
    Author     : octopussy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Data tables -->               
<script src="../js/jquery-1.11.3.min.js"></script>
<script src="../js/jquery.dataTables.min.js"></script>
<script src="../js/dataTables.responsive.min.js"></script>

<script>
    $(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
        });
    });
</script>

<script>
    $(document).ready(function () {
        $('#tabProd').DataTable({
            "language": {
                "url": "../js/lingua/Italian.json"
            }
        });

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
