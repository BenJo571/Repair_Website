<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="loadLoginPage" %>


<!------ Include the above in your HEAD tag ---------->
<!DOCTYPE html>
<html lang="en">
<style>
    /* Made with love by Mutiullah Samim*/
    @import url('https://fonts.googleapis.com/css?family=Numans');

    html,
    body {
        background-image: url('https://upload.wikimedia.org/wikipedia/commons/9/90/Seacon_Square%2C_BKK.jpg');
        background-size: cover;
        background-repeat: no-repeat;
        height: 100%;
        font-family: 'Numans', sans-serif;
    }

    .container {
        height: 100%;
        align-content: center;
    }

    .card {
        height: 370px;
        margin-top: auto;
        margin-bottom: auto;
        width: 400px;
        background-color: rgba(0, 0, 0, 0.5) !important;
    }

    .social_icon span {
        font-size: 60px;
        margin-left: 10px;
        color: #FFC312;
    }

    .social_icon span:hover {
        color: white;
        cursor: pointer;
    }

    .card-header h3 {
        color: white;
    }

    .social_icon {
        position: absolute;
        right: 20px;
        top: -45px;
    }

    .input-group-prepend span {
        width: 50px;
        background-color: #FFC312;
        color: black;
        border: 0 !important;
    }

    input:focus {
        outline: 0 0 0 0 !important;
        box-shadow: 0 0 0 0 !important;
    }

    .remember {
        color: white;
    }

    .remember input {
        width: 20px;
        height: 20px;
        margin-left: 15px;
        margin-right: 5px;
    }

    .login_btn {
        color: black;
        background-color: #FFC312;
        width: 100px;
    }

    .login_btn:hover {
        color: black;
        background-color: white;
    }

    .links {
        color: white;
    }

    .links a {
        margin-left: 4px;
    }

    /* The Modal (background) */
    .modal {
        display: none;
        /* Hidden by default */
        position: fixed;
        /* Stay in place */
        z-index: 1;
        /* Sit on top */
        left: 0;
        top: 0;
        width: 100%;
        /* Full width */
        height: 100%;
        /* Full height */
        overflow: auto;
        /* Enable scroll if needed */
        background-color: rgba(0, 0, 0, 0.4);
        /* Black w/ opacity */
    }

    /* Modal Content/Box */
    .modal-content {
        background-color: deepskyblue;
        margin: 10% auto;
        /* 10% from the top and centered */
        padding: 20px;
        border: 1px left #888;
        width: 80%;
        /* Could be more or less, depending on screen size */
    }

    /* Style the input fields */
    input[type=text],
    input[type=password] {
        width: 100%;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }

    /* Style the submit button */
    .login-btn {
        background-color: #4CAF50;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 100%;
    }

    /* Close Button */
    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
</style>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bootstrap_5</title>


    <title>Bootstrap_5</title>


    <script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="plugins/moment/moment.js"></script>

<script src="dist/js/adminlte.min.js"></script>

<!-- Theme style -->
<link rel="stylesheet" href="dist/css/adminlte.min.css">

    
    <script>


       // if ($('#User_ID_sess').val() != "") {
         //   window.location.replace("main/index.aspx");
        //}ไปหน้่าLogin นะจ๊ะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะะ
        //


      /*  $(document).delegate('.btnSignUp', 'click', function (event) {


            $("#exampleModalCenter").modal('toggle');

        });*/

    </script>

    <script src="js/control.js"></script>
    <!------ Include the above in your HEAD tag ---------->
</head>

<body>
    <input type="hidden" id="User_ID_sess" value="<%=Session["User_ID"] %>" />

            <div style="text-align: left; opacity: 0.9; margin-top: 0%"><img src="https://www.seacon.co.th/wp-content/themes/sage/dist/images/06.2_seacon-fam_13.png?fbclid=IwAR1jkX5iM5--W0BlAHgB4PHD0jCB5HAV2dKlBrOQHdQgS9oYIewdtMShvPE"></div>
            <div class="container">
                <div class="d-flex justify-content-center h-100">
                    <div class="card">
                        <div class="card-header">
                            <h3>Sign In</h3>
                            <div class="d-flex justify-content-end social_icon"><span><i class="fab fa-facebook-square"></i></span><span><i class="fab fa-google-plus-square"></i></span><span><i class="fab fa-twitter-square"></i></span></div>
                        </div>
                        <div class="card-body">
                            <div>
                                <div class="input-group form-group">
                                    <div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-user"></i></span></div><input type="text" class="form-control txt_username" placeholder="username">
                                </div>
                                <div class="input-group form-group">
                                    <div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-key"></i></span></div><input type="password" class="form-control txt_password" placeholder="password">
                                </div>
                                <div class="row align-items-center remember"><input type="checkbox">Remember Me </div>
                                <div class="form-group"><input type="button" value="Login" id="btn_login" class="btn float-right btn-info login_btn"></div>
                            </div>
                        </div>
                        <div class="card-footer">

                       
                            <div class="d-flex justify-content-center links">Do you don't have an accout? <span type="" class="" data-toggle="modal" data-target="#openEditor" style="color: #007bff; cursor: pointer;"> Sign Up </span></div>
                            <div class="d-flex justify-content-center"><a href="#">Forgot your password?</a></div>
                        </div>
                    </div>
                </div>
            </div>
        
</body>
    </html>

 <div class="modal fade" id="openEditor" role="dialog">
        <div class="modal-dialog modal-lg">
          <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" ><span>Register</span></h4>
              <button type="button" class="close" data-dismiss="modal">×</button>
              
            </div>
            <div class="modal-body">
            <div>
              <label for="username">User_ID : </label><input type="text" id="User_ID" name="user_id" required=""> 
              <label for="username">FirstName : </label><input type="text" id="firstname" name="firstname" required="">
              <label for="username">LastName : </label><input type="text" id="lastmame" name="lastname" required="">
              <label for="username">E-Mail : </label><input type="text" id="email" name="email" required="">
              <label for="password">Password : </label><input type="password" id="password" name="password" required="">
            </div>
            </div>
            <div class="modal-footer">
              <button type="button" id="btn btn-default" data-dismiss="modal" style="background-color:red;color:azure"">Close</button>
              <button type="button" id="btn_Resgister_Save" style="background-color:seagreen;color:azure">Save</button>
            </div>
          </div>
          
        </div>
  </div> 
