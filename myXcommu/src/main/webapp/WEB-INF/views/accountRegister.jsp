<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>myXcommu - Register</title>
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
<!-- Layout styles -->
<link rel="stylesheet" href="/resources/assets/css/demo_1/style.css">
<!-- End Layout styles -->
<link rel="shortcut icon" href="/resources/assets/images/favicon.png" />
</head>
<body>
	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div class="content-wrapper d-flex align-items-center auth register-bg-1 theme-one">
				<div class="row w-100">
					<div class="col-lg-4 mx-auto">
						<h2 class="text-center mb-4">Register</h2>
						<div class="auto-form-wrapper">
							<form action="/insertAccount" name="registerForm" role='form' method="post">
								<div class="form-group">
									<div class="input-group">
										<input type="text" class="form-control" placeholder="Username" id="userId" name="userid">
										<div class="input-group-append">
											<span class="input-group-text"> <i class="mdi mdi-check-circle-outline"></i>
											</span>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
										<input type="password" class="form-control" placeholder="Password" id="userPw" name="userpw">
										<div class="input-group-append">
											<span class="input-group-text"> <i class="mdi mdi-check-circle-outline"></i>
											</span>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
										<input type="password" class="form-control" placeholder="Confirm Password" id="checkPw">
										<div class="input-group-append">
											<span class="input-group-text"> <i class="mdi mdi-check-circle-outline"></i>
											</span>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
										<input type="text" class="form-control" placeholder="E-mail" id="userEmail" name="email">
										<div class="input-group-append">
											<span class="input-group-text"> <i class="mdi mdi-check-circle-outline"></i>
											</span>
										</div>
									</div>
								</div>
								<div class="form-group d-flex justify-content-center">
									<div class="form-check form-check-flat mt-0">
										<label class="form-check-label"> <input type="checkbox" class="form-check-input"> I agree to the terms
										</label>
									</div>
								</div>
								<div class="form-group">
									<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
									<button class="btn btn-primary submit-btn btn-block btnRegister">Register</button>
								</div>
								<div class="text-block text-center my-3">
									<span class="text-small font-weight-semibold">Already have and account ?</span> <a href="/customLogin" class="text-black text-small">Login</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- content-wrapper ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<!-- plugins:js -->
	<script src="/resources/assets/vendors/js/vendor.bundle.base.js"></script>
	<script src="/resources/assets/vendors/js/vendor.bundle.addons.js"></script>
	<!-- endinject -->
	<!-- inject:js -->
	<script src="/resources/assets/js/shared/off-canvas.js"></script>
	<script src="/resources/assets/js/shared/misc.js"></script>
	<script>
	

	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
		$(document).ready(function() {
			
			$(".btnRegister").on("click", function (e){
				
				var obForm = document.getElementById("registerForm");
				alert('hihi');
			});

		});

		function accountRegister() {

			var userId = document.getElementById("userId").value;
			var userPw = document.getElementById("userPw").value;
			var userCheckPw = document.getElementById("checkPw").value;
			var userEmail = document.getElementById("userEmail").value;
			
			if( userPw != userCheckPw ){
				alert("비밀번호가 일치하지 않습니다.");
				return;
			}
			
			if( !isEmail( userEmail ) ){
				alert("이메일 형식이 올바르지 않습니다.");
				return;
			}
			
			


		}
		
		
		
		function isEmail( asValue ) {

			var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

			return regExp.test(asValue); // 형식에 맞는 경우 true 리턴	

		}
	</script>
</html>