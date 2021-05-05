<?php

// include("header.php");
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <link rel="stylesheet" href="includes/css/style.css">
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@900&display=swap" rel="stylesheet">
  <title>Document</title>
</head>

<body style="background-color: darkorchid;">

  <?php
  // 
  include("register.php");
  ?>
  <!-- 
  <div class="container-fluid px-1 px-md-5 px-lg-1 px-xl-5 py-5 mx-auto">
    <div class="card card0 border-0">
      <div class="row d-flex">
        <div class="col-lg-6">
          <div class="card1 pb-5">
            <div class="row"> <img src="https://i.imgur.com/CXQmsmF.png" class="logo"> </div>
            <div class="row px-3 justify-content-center mt-4 mb-5 border-line"> <img src="https://i.imgur.com/uNGdWHi.png" class="image"> </div>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="card2 card border-0 px-4 py-5">
            <div class="row mb-4 px-3">
              <h6 class="mb-0 mr-4 mt-2">Sign in with</h6>
              <div class="facebook text-center mr-3">
                <div class="fa fa-facebook"></div>
              </div>
              <div class="twitter text-center mr-3">
                <div class="fa fa-twitter"></div>
              </div>
              <div class="linkedin text-center mr-3">
                <div class="fa fa-linkedin"></div>
              </div>
            </div>
            <div class="row px-3 mb-4">
              <div class="line"></div> <small class="or text-center">Or</small>
              <div class="line"></div>
            </div>
            <div class="row px-3"> <label class="mb-1">
                <h6 class="mb-0 text-sm">Email Address</h6>
              </label> <input class="mb-4" type="text" name="email" placeholder="Enter a valid email address"> </div>
            <div class="row px-3"> <label class="mb-1">
                <h6 class="mb-0 text-sm">Password</h6>
              </label> <input type="password" name="password" placeholder="Enter password"> </div>
            <div class="row px-3 mb-4">
              <div class="custom-control custom-checkbox custom-control-inline"> <input id="chk1" type="checkbox" name="chk" class="custom-control-input"> <label for="chk1" class="custom-control-label text-sm">Remember me</label> </div> <a href="#" class="ml-auto mb-0 text-sm">Forgot Password?</a>
            </div>
            <div class="row mb-3 px-3"> <button type="submit" class="btn btn-blue text-center">Login</button> </div>
            <div class="row mb-4 px-3"> <small class="font-weight-bold">Don't have an account? <a class="text-danger ">Register</a></small> </div>
          </div>
        </div>
      </div>
      <div class="bg-blue py-4">
        <div class="row px-3"> <small class="ml-4 ml-sm-5 mb-2">Copyright &copy; 2019. All rights reserved.</small>
          <div class="social-contact ml-4 ml-sm-auto"> <span class="fa fa-facebook mr-4 text-sm"></span> <span class="fa fa-google-plus mr-4 text-sm"></span> <span class="fa fa-linkedin mr-4 text-sm"></span> <span class="fa fa-twitter mr-4 mr-sm-5 text-sm"></span> </div>
        </div>
      </div>
    </div>
  </div> -->





  <!-- <div class="form-group">
      <div class="mainDiv" align="right">
        <h1 align="left">Firebase File Upload</h1>
        <progress id="uploader" value="0" max="100">0%</progress>
        <input type="file" id="fileButton" value="upload" />
      </div>
    </div> -->
</body>
<script src="https://www.gstatic.com/firebasejs/8.4.3/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.4.0/firebase.js"></script>
<script src="includes/js/config.js"></script>
<script>
  // Your web app's Firebase configuration


  var uploader = document.getElementById("uploader");
  var fileButton = document.getElementById("fileButton");
  fileButton.addEventListener("change", function(e) {
    var file = e.target.files[0];
    var storageRef = firebase.storage().ref(file.name);
    var task = storageRef.put(file);
    task.on(
      "state_changed",
      function progress(snapshot) {
        var percentage =
          (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
        uploader.value = percentage;
      },
      function error(err) {},
      function complete() {}
    );
  });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js'></script>
</body>

<!-- The core Firebase JS SDK is always required and must be listed first -->

</html>