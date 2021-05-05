<link rel="stylesheet" href="includes/css/style.css">
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="includes/css/style.css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
</head>

<body style="background-color: darkorchid;">

    <!-- < class="container register">
        <div class="row">
            <div class="col-md-3 register-left">
                <img src="https://cdni.iconscout.com/illustration/premium/thumb/graphic-designer-3141893-2629559.png" alt="" />
                <h3>Welcome, <b>DESIGNER.</b> </h3>
                <p>Already a Member?</p>
                <input type="submit" name="" value="Login" /><br />
            </div>
            <div class="col-md-9 register-right">
                <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Employee</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Hirer</a>
                    </li>
                </ul> -->
    <!-- <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                        <h3 class="register-heading">Register as a Designer</h3>
                        <div class="row register-form">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <input type="email" class="form-control" id="email" placeholder="Your Email *" />
                                </div>
                                <br>
                                <div class="form-group">
                                    <input type="password" class="form-control" id="pass1" placeholder="Password *" />
                                </div>
                                <br>
                                <div class="form-group">
                                    <input type="password" class="form-control" id="pass2" placeholder="Confirm Password *" />
                                </div>
                                <input type="submit" class="btnRegister" id="registerBtn" value="Register" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
     -->

    <div class="container-fluid px-1 px-md-5 px-lg-1 px-xl-5 py-5 mx-auto" style="margin-top:10%">
        <div class="card card0 border-0">
            <div class="row d-flex">
                <div class="col-lg-6" style="    background-color: #72308e;">
                    <div class="card1 pb-5">
                        <!-- <div class="row"> <img src="https://cdni.iconscout.com/illustration/premium/thumb/graphic-designer-3141893-2629559.png" class="logo"> </div> -->
                        <div class="row px-3 justify-content-center mt-4 mb-5 border-line"> <img src="includes/img/designer.png" style="width:40%" class="image"> </div>
                    </div>
                    <div class="container-fluid" style="text-align:center">
                        <h3 style="color:white">Hey, <b>Designer!</b></h3>
                    </div>
                </div>
                <div class="col-lg-6" style="    background-color: #72308e;">
                    <div class="card2 card border-0 px-4 py-5" style="    background-color: #72308e;">
                        <div class="row mb-4 px-3" style="    background-color: #72308e;">
                            <h6 class="mb-0 mr-4 mt-2" style="color:white">Sign in as Designer</h6>

                        </div>
                        <div class="row px-3 mb-4">
                            <div class="line"></div> <small class="or text-center">Or</small>
                            <div class="line"></div>
                        </div>
                        <div class="row px-3"> <label class="mb-1">
                                <h6 class="mb-0 text-sm">Email Address</h6>
                            </label> <input class="mb-4" type="text" id="email" name="email" placeholder="Enter a valid email address"> </div>
                        <div class="row px-3"> <label class="mb-1">
                                <h6 class="mb-0 text-sm">Password</h6>
                            </label> <input type="password" name="password" id="pass1" placeholder="Enter password">
                        </div>
                        <br>

                        <div class="row px-3 mb-4">
                            <div class="custom-control custom-checkbox custom-control-inline"> <input id="chk1" type="checkbox" name="chk" class="custom-control-input"> <label for="chk1" class="custom-control-label text-sm">Remember me</label> </div> <a href="#" class="ml-auto mb-0 text-sm">Forgot Password?</a>
                        </div>
                        <div class="row mb-3 px-3"> <button type="submit" class="btn btn-blue text-center" id="loginBtn" style="background: yellow;">Log In</button> </div>
                        <div class="row mb-4 px-3"> <small class="font-weight-bold">Don't have an account? <a class="text-danger " href="index.php">Register</a></small> </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <script src="https://www.gstatic.com/firebasejs/8.4.3/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/5.4.0/firebase.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js" integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous"></script>


    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->

    <script src="includes/js/config.js"></script>
    <script>
        document.getElementById('loginBtn').addEventListener('click', function(e) {
            var email = document.getElementById('email').value;
            var pass1 = document.getElementById('pass1').value;

            console.log("YOU CLICKED");
            // if (pass1 == pass2) 
            // {
            firebase.auth().signInWithEmailAndPassword(email, pass1).then((userCredential) => {
                    // Signed in 
                    var user = userCredential.user;
                    console.log(user);
                    console.log("You have logged in!");
                    location.replace('shopkeeperdashboard.php');
                    // ...
                })
                .catch((error) => {
                    var errorCode = error.code;
                    var errorMessage = error.message;
                    console.log(errorMessage);
                    window.alert(errorMessage);
                    // ..
                });

            // }
            //  else 
            //  {
            // console.log("Passwords do not match!");
            // }
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js'></script>
</body>