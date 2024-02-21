<%-- 
    Document   : confirmRegistration
    Created on : Jan 11, 2024, 11:01:45 PM
    Author     : tieup
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/styleRegister.css">

    </head>
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        form {
            width: 300px; /* Điều chỉnh độ rộng của form theo mong muốn */
            margin: auto; /* Auto margin để căn giữa form */
        }

        .user-box {
            margin-bottom: 20px;
        }

        .button-submit {
            text-align: center;
        }

    </style>
    <body>





        <div class="login-box">
            <h2>Confirm Captcha</h2>
            <div class="social-container">
                <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>      
            </div>
            <span>Enter your captcha here</span>
            <form action="confimforget" method="post" >
                <input type="hidden" name="captcha" value="${sessionScope.captcha}">
                <input type="hidden" name="email" value="${requestScope.email}">
                <input type="hidden" name="func" value="forgot">

                <div class="user-box">
                    <input type="captcha" name="enter_captcha" required="">
                    <label>Captcha</label>
                </div>


                <div class="button-submit">
                    <button type="submit">Submit</button>

                </div>
                 <h4 style="text-align: center; color: red;">${requestScope.notification}</h4>
            </form>

        </div>



    </body>
</html>
