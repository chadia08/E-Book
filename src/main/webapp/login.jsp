<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  	<style type="text/css">
		<%@ include file="/min2.css" %>
		<%@ include file="/all.min.css" %>
	</style>

</head>

<body class="bg-gradient-primary">


    <div class="container">

        <!-- Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                    </div>
              <!--------------------login Form------------------------>
                                    <form class="user" action="login" method="post">
                                     <!-- Email -->
                                        <div class="form-group">
                                            <input type="email" class="form-control form-control-user" name="email" id="exampleInputEmail" 
                                            aria-describedby="emailHelp"  placeholder="Enter Email Address...">
                                        </div>
                                        <!-- password -->
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user" name="password"
                                                id="exampleInputPassword" placeholder="Password">
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">Remember
                                                    Me</label>
                                            </div>
                                        </div> 
                                        <input value="Login" type="submit" class="btn btn-primary btn-user btn-block">
                                         
                                        <hr>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="forgot-password.html">Forgot Password?</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="register.jsp">Create an Account!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script>
   		const urlParams = new URLSearchParams(window.location.search);
    		if (urlParams.has('message')) {
       			 Swal.fire({
            		icon: 'warning',
            		title: 'Email or Password is incorrect',
            		text: urlParams.get('message')
        });
    }
    		if (urlParams.has('msg')) {
      			 Swal.fire({
           		icon: 'success',
           		title: 'Your account has been created successfully. You can now login.',
           		text: urlParams.get('message')
       });
   }
	</script>
    <script src="jquery.min.js"></script>
    <script src="bootstrap.bundle.min.js"></script>
    <script src="jquery.easing.min.js"></script>
    <script src="sb-admin-2.min.js"></script>

</body>

</html>