<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>myXcommu - Login</title>
<!-- plugins:css -->
<link rel="stylesheet" href="/resources/assets/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="/resources/assets/vendors/iconfonts/ionicons/css/ionicons.css">
<link rel="stylesheet" href="/resources/assets/vendors/iconfonts/typicons/src/font/typicons.css">
<link rel="stylesheet" href="/resources/assets/vendors/iconfonts/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet" href="/resources/assets/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet" href="/resources/assets/vendors/css/vendor.bundle.addons.css">
<!-- endinject -->
<!-- plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="/resources/assets/css/shared/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="/resources/assets/images/favicon.png" />

<meta charset="UTF-8">
<title>Login</title>
</head>
<body>


	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div class="content-wrapper d-flex align-items-center auth auth-bg-1 theme-one">
				<div class="row w-100">
					<div class="col-lg-4 mx-auto">
						<div class="auto-form-wrapper">
							<form method="post" action="/login" role="role">
								<div class="form-group">
									<label class="label">Username</label>
									<div class="input-group">
										<input class="form-control" placeholder="userid" type="text" name="username" autofocus>
										<!-- <input type="text" class="form-control" placeholder="Username"> -->
										<div class="input-group-append">
											<span class="input-group-text"> <i class="mdi mdi-check-circle-outline"></i>
											</span>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="label">Password</label>
									<div class="input-group">
										<input class="form-control" placeholder="*********" type="password" name="password" value="">
										<!-- <input type="password" class="form-control"
											placeholder="*********"> -->
										<div class="input-group-append">
											<span class="input-group-text"> <i class="mdi mdi-check-circle-outline"></i>
											</span>
										</div>
										<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
									</div>
								</div>
								<div class="form-group">
									<button class="btn btn-primary submit-btn btn-block loginButton">Login</button>
								</div>
								<div class="form-group d-flex justify-content-between">
									<div class="form-check form-check-flat mt-0">
										<label class="form-check-label"> <input type="checkbox" class="form-check-input" name="remember-me"> Keep me signed in
										</label>
									</div>
									<a href="/findAccount" class="text-small forgot-password text-black">Forgot Password</a>
								</div>
								<div class="text-block text-center my-3">
									<span class="text-small font-weight-semibold">Not a member ?</span> <a href="/accountRegister" class="text-black text-small">Create new account</a>
								</div>
							</form>
						</div>
						<p style="margin-top : 10px;" class="footer-text text-center">copyright © 2020 myXcommu. All rights reserved.</p>
					</div>
				</div>
			</div>
			<!-- content-wrapper ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>


	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="/resources/assets/vendors/js/vendor.bundle.base.js"></script>
	<script src="/resources/assets/vendors/js/vendor.bundle.addons.js"></script>
	<!-- endinject -->
	<!-- inject:js -->
	<script src="/resources/assets/js/shared/off-canvas.js"></script>
	<script src="/resources/assets/js/shared/misc.js"></script>
	<script>
		$(".loginButton").on("click", function(e) {

			e.preventDefault();
			$("form").submit();

		});
	</script>

</body>
</html>