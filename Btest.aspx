<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Btest.aspx.cs" Inherits="EADPProject.Btest" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up Form by Colorlib</title>



    <!-- Main css -->
    <link rel="stylesheet" href="Login_css/style.css">
</head>
<body>

    <div class="main">
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign in</h2>

                        <div class="form-group">
                            <input type="email" name="email" id="email" placeholder="Your Email" />
                        </div>
                        <div class="form-group">
                            <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                            <input type="password" name="pass" id="pass" placeholder="Password" />
                        </div>
                        <div class="form-group form-button">
                            <input type="submit" name="login" id="login" class="form-submit" value="Login" />
                        </div>
                    </div>
                    <div class="signup-image">
                        <figure>
                            <img src="Images/signin-image.jpg" alt="sign in image"></figure>
                    </div>
                </div>
            </div>
        </section>
