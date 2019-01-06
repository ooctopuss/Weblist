<%-- 
    Document   : footer
    Created on : 29-set-2018, 12.00.24
    Author     : octopussy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>   

<!-- File per navbar -->  
<script src="../js/jquery-3.2.1.slim.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>

<!-- Data tables -->               
<script src="../js/jquery-1.11.3.min.js"></script>
<script src="../js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/responsive/1.0.7/js/dataTables.responsive.min.js"></script>

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
