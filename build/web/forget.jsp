
<%-- 
    Document   : forget
    Created on : Jan 9, 2024, 1:33:34 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Forget Password</title>
        <link rel="stylesheet" href="styleForget.jsp">
        <script src="javascript.js"></script>
        <script defer src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
                integrity="sha384-rOA1PnstxnOBLzCLMcre8ybwbTmemjzdNlILg8O7z1lUkLXozs4DHonlDtnE7fpc"
        crossorigin="anonymous"></script>
        <style>
            html {
    height: 100%;
  }
  
  body {
    margin: 0;

  padding: 0;
  font-family: sans-serif;
  background-image: url('https://images.pling.com/img/00/00/59/89/86/1477718/0f3bdcbbd556d985926002168fbaadddcf4deaf75e2742e88b93ab3389d92c53e246.jpg');
   background-repeat: no-repeat;
            background-size: cover;

  }
.container {
    position: absolute;
    top: 50%;
    left: 50%;
    width: 700px;
    padding: 40px;
    transform: translate(-50%, -50%);
    background: rgba(0, 0, 0, .5);
    box-sizing: border-box;
    box-shadow: 0 15px 25px rgba(0, 0, 0, .6);
    border-radius: 10px;
  }
  input {
    width: 50%; 
    padding: 5px;
    margin: 10px 0;
    box-sizing: border-box;
}
button{
    width: 30%;
}
.login-box .user-box input {
    width: 100%;
    padding: 10px 0;
    font-size: 16px;
    color: #fff;
    margin-bottom: 30px;
    border: none;
    border-bottom: 1px solid #fff;
    outline: none;
    background: transparent;
  }
  
  .input{
    position: absolute;
    top: 0;
    left: 0;
    padding: 10px 0;
    font-size: 16px;
    color: #fff;
    pointer-events: none;
    transition: .5s;
  }
  
  .login-box .user-box input:focus ~ label,
  .login-box .user-box input:valid ~ label {
    top: -20px;
    left: 0;
    color: #03e9f4;
    font-size: 12px;
  }
        </style>
    </head>

    <body>
        <div class="container">
            <h2 style="color: white;">Forgot Password</h2>
            <p style="color: white;">Enter your email address to reset your password.</p>

            <form action="forgotpassword" method="post">

                <input type="email" name="email" placeholder="Your Email" required><br>
                <button type="submit">Send email</button>
            </form>
        </div>
    </body>

</html>