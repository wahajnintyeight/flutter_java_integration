<?php
include('shopheader.php');
?>

<!DOCTYPE html>
<html lang="en">

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <?php include('shopsidebar.php'); ?>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar Navbar -->
                <?php include('shoptopbar.php'); ?>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Upload a Design</h1>
                    </div>

                    <div class="row" style="background-color: #e5e5e5;
    padding: 100px;
    border-radius: 1.3cm;">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-10 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <!-- <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">View your designs</div> -->
                                            <div class="form-group">
                                                <div class="mainDiv" align="right">
                                                    <h1 align="center"><b>Earrings Model Upload</b><br>
                                                        <p style="color:indianred">(Only upload .fbx,.obj)</p>
                                                    </h1>
                                                    <input class="btn file" type="file" accept=".fbx,.obj" id="fileButton" value="upload" />
                                                </div>
                                            </div>
                                            <progress class="btn-success" style="height:30px;background: #92e192;border: 3px solid;width:100%" id="uploader" value="0" max="100">0%</progress>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>

                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="login.html">Logout</a>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://www.gstatic.com/firebasejs/8.4.3/firebase-app.js"></script>
        <script src="https://www.gstatic.com/firebasejs/5.4.0/firebase.js"></script>
        <!-- <script src="includes/js/config.js"></script> -->
        <script src="includes/js/config.js"></script>
        <script>
            // Your web app's Firebase configuration

            var uploader = document.getElementById("uploader");
            var fileButton = document.getElementById("fileButton");
            fileButton.addEventListener("change", function(e) {
                var extension = document.getElementById("fileButton").files[0].name[document.getElementById("fileButton").files[0].name.length - 3];
                extension += document.getElementById("fileButton").files[0].name[document.getElementById("fileButton").files[0].name.length - 2];
                extension += document.getElementById("fileButton").files[0].name[document.getElementById("fileButton").files[0].name.length - 1];
                console.log(extension);


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
                    function error(err) {
                        console.log(err);
                    },
                    function complete() {

                    },

                );
                window.alert("YOUR DESIGN HAS BEEN UPLOADED!");
            });
        </script>

        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>

</body>

</html>