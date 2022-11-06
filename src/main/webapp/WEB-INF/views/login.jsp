<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>

    <!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

    <style>
        body{
            background-color: #eee;
        }
        .main-container{
            background-color: #fff;
            width: 400px;
            border-radius: 10px;
            padding: 2rem 4rem;
            margin-top: 2rem;
            margin-bottom: 2rem;  
        }
        .heading{
            text-align: center;
            font-size: 30px;
            line-height: 1.2;
            margin: 2rem 0 2rem 0;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        }
        .logo{
            width: 100px;
            margin-bottom: 2rem;
        }
        .form-control{
            border-bottom: 2px solid #adadad;
            border-top: none;
            border-left: none;
            border-right: none;
            outline: none;
        }
        .form-group{
            /* border-bottom: 2px solid #adadad; */
        }
        .form-control:focus{
            outline: none;
            box-shadow: none;
            border-bottom: 2px solid #0d6efd;
        }
        .button-div{
            margin-top: 4rem;
        }
        .login-btn{
            padding: 0.5rem 5rem;
            border-radius: 10px;
        }
        .hide{
            display: none;
        }
        .error_div{
            text-align: center;
        }


    </style>

    <script>
        window.onload = (() => {
            var params = new URLSearchParams(window.location.search);
            if(params.has("error")){
                console.log("has error");
                document.getElementById("login_error").classList.remove("hide");
            }
        })
    </script>

</head>
<body>

    <div class="container main-container">
        <div class="heading">
            <img src="https://upload.wikimedia.org/wikipedia/en/2/2a/Nucleus_Logo.png" alt="" class="logo">
            <h2>NSEL Employees</h2>
        </div>

        <div class="error_div alert-danger">
            <p id="login_error" class="hide">Invalid username or password!</p>
        </div>

        <form action="login" method="post">
            <div class="form-group mb-4">
                <input type="text" class="form-control" name="username" id="username" placeholder="Username" required="true">
            </div>
            <div class="form-group mb-4">
                <input type="password" name="password" id="password" class="form-control" placeholder="Password" required="true">
            </div>
            <div class="d-flex justify-content-center button-div">
                <input type="submit" class="btn btn-primary login-btn" value="LOGIN">
            </div>
        </form>

    </div>


    
</body>
</html>