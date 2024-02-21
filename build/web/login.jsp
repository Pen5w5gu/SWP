<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    <link rel="stylesheet" href="css/styleLogin.css">
    <script src="javascript.js"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
        integrity="sha384-rOA1PnstxnOBLzCLMcre8ybwbTmemjzdNlILg8O7z1lUkLXozs4DHonlDtnE7fpc"
        crossorigin="anonymous"></script>

</head>

<body>

    <div class="login-box">
        
      
        
        
        <h2>Login</h2>
        <form action="login" >
            <div class="social-container">
                <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                
            </div>

            <span>or use your account</span>

            <div class="user-box">
                <input type="text" name="email" required="">
                <label>Mail</label>
            </div>
            <div class="user-box">
                <input type="password" name="password" required="">
                <label>Password</label>
            </div>

            <div class="button-cookie">
                <input type="checkbox" value="lsRememberMe" id="rememberMe"> <label for="rememberMe">Remember me</label>
            </div>

            <div class="button-forgot">
                <a href="forget.jsp">Forget your password ?</a>
            </div>

           
            <div class="button-submit">
                <button type="submit">Submit</button>
         
            </div>
           
               <h4 style="text-align: center; color: red;">${requestScope.error}</h4>
        </form>
        <div class="form-switch" id="formSwitch">
            Don't have an account ?<a href="register.jsp"> Register here</a>
        </div>
    </div>

</body>