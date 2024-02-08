<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register Form</title>
        <link rel="stylesheet" href="css/styleRegister.css">
        <script defer src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
                integrity="sha384-rOA1PnstxnOBLzCLMcre8ybwbTmemjzdNlILg8O7z1lUkLXozs4DHonlDtnE7fpc"
        crossorigin="anonymous"></script>
    </head>

    <body>

        <div class="login-box">
            <h2>Enter Password</h2>
            <div class="social-container">
                <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>      
            </div>
            <span>Enter your password in here</span>
            <form action="changepassword" method="POST">
                <div class="user-box">
                    <input type="text" id="emailInput" name="email" value="${email}" readonly required="">
                    <label>Email</label>
                </div>


                <div class="user-box">
                    <input type="password" name="password" required="">
                    <label>Password</label>
                </div>

                <div class="user-box">
                    <input type="password" name="re_password" required="">
                    <label>Re-Enter Password</label>
                </div>

                <div class="button-submit">
                    <button type="submit">Submit</button>

                </div>
            </form>

        </div>
    </body>
</html>
