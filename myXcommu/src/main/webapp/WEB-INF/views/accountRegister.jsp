<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html style="overflow: scroll;">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<!-- default header name is X-CSRF-TOKEN -->
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<title>myXcommu - Register</title>

<link rel="stylesheet" href="/resources/assets/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="/resources/assets/vendors/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet" href="/resources/assets/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" href="/resources/assets/vendors/typicons/typicons.css">
<link rel="stylesheet" href="/resources/assets/vendors/css/vendor.bundle.base.css">
    
    
<link rel="stylesheet" href="/resources/assets/vendors/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/assets/dropzone/dropzone.css">
<link rel="stylesheet" href="/resources/assets/css/shared/style.css">
<link rel="stylesheet" href="/resources/assets/css/demo_11/style.css">

<link rel="shortcut icon" href="/resources/assets/images/favicon.png" />
</head>
<body>
	<div class="container-scroller" style="overflow : hidden;">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div class="content-wrapper auth p-0 theme-two">
				<div class="row d-flex align-items-stretch">
					<div class="col-md-4 banner-section d-none d-md-flex align-items-stretch justify-content-center">
						<div class="slide-content bg-2"></div>
					</div>
					<div class="col-12 col-md-8 h-100 card">
						<div class="auto-form-wrapper d-flex align-items-center justify-content-center flex-column">
							<div class="nav-get-started">
								<p>이미 계정이 있으신가요?</p>
								<a class="btn get-started-btn" href="/">로그인</a>
							</div>
								
							<form action="/insertAccount" name="registerForm" role='form' method="post">
								<h3 class="mr-auto">회원가입</h3>
								<p class="mb-5 mr-auto">하단의 필수사항을 입력해 주세요.</p>
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> <i class="mdi mdi-account-outline"></i>
											</span>
										</div>
										<input type="text" class="form-control" placeholder="Username" id="userId" name="userid">
									</div>
									<div style="font-size: 10pt; margin-bottom: -20px; margin-top: 5px;" id="idDuplicateInfo">
										&nbsp;<!-- <i class="fa fa-check"></i>여기는 이메일 체크 자리 -->
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> <i class="mdi mdi-lock-outline"></i>
											</span>
										</div>
										<input type="password" class="form-control" placeholder="Password" id="userPw" name="userpw">
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> <i class="mdi mdi-lock-outline"></i>
											</span>
										</div>
										<input type="password" class="form-control" placeholder="Confirm Password" id="checkPw">
									</div>
									<div style="font-size: 10pt; margin-bottom: -20px; margin-top: 5px;" id="passwordSameCheck">
										&nbsp;
									</div>
								</div>
								
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> <i class="ti-email"></i>
											</span>
										</div>
										<input type="text" class="form-control" placeholder="E-mail" id="userEmail" name="email">
										
									</div>									
									<div style="font-size: 10pt; margin-bottom: -20px; margin-top: 5px;" id="emailDuplicateInfo">
										&nbsp;<!-- <i class="fa fa-check"></i>여기는 이메일 체크 자리 -->
									</div>
								</div>
								<div class="form-group">
									<div class="input-group" style="height : 150px;">
										<div class="input-group-prepend">
											<span class="input-group-text"> <i class="ti-comment"></i>
											</span>
										</div>
										<textarea type="text" class="form-control" placeholder="자기소개" id="profile_info" name="profile_info" cols="5" style="height : 150px;" draggable="false"></textarea>
									</div>
								</div>
								<div class="form-group" style="display : inline-table; margin-bottom : 175px;">
									<div class="input-group">
										<div class="input-group-prepend" style="width : 10%;">
											<span class="input-group-text"> <i class="ti-image"></i>
											</span>
										</div>
										<div id="dzUpload" class="dropzone" style="width : 90%;"></div>
										<input type="hidden" name="profile_image">
										<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
									</div>
								</div>
								
								<div class="form-group" style="display : inline-block; margin-bottom : 0px; ">
									<button class="btn btn-primary submit-btn">SIGN IN</button>
								</div>
								<div class="wrapper mt-5 text-gray" style="display : inline-block;">
									<p class="footer-text">Copyright © 2018 Bootstrapdash. All rights reserved.</p>
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

</body>
<!-- container-scroller -->
<!-- plugins:js -->
<script src="/resources/assets/js/shared/jquery-1.12.4.min.js"></script>
<script src="/resources/assets/vendors/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- inject:js -->
<!-- <script src="/resources/assets/js/shared/off-canvas.js"></script>
	<script src="/resources/assets/js/shared/misc.js"></script> -->
<script src="/resources/assets/dropzone/dropzone.js"></script>


<script>
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	$(document).ajaxSend( function ( e, xhr, options ) {
		
		xhr.setRequestHeader( csrfHeaderName, csrfTokenValue);
	
		console.log( "csrfHeaderName : " + csrfHeaderName );
		console.log( "csrfTokenValue : " + csrfTokenValue );
	});

	$(document).ready(function() {

		$(".btnRegister").on("click", function(e) {

			var obForm = document.getElementById("registerForm");
			alert('hihi');
		});
		
		
		$('#userId').focusout(function() {
			checkDuplicateId();
		});
		
		$('#checkPw').focusout( function (){
			passwordSameCheck();
		});
		
		$('#userEmail').focusout( function (){
			checkDuplicateEmail();
		});

	});
	
	function passwordSameCheck(){

		var pw_1 = document.getElementById("userPw").value;
		var pw_2 = document.getElementById("checkPw").value;
		
		if( pw_1 != pw_2 ){
			$("#passwordSameCheck").css('color','red');
			$("#passwordSameCheck").html( '<i class="fa fa-check" style="color : red";></i> 비밀번호가 일치하지 않습니다.' );
		} else {
			$("#passwordSameCheck").css('color','green');
			$("#passwordSameCheck").html( '<i class="fa fa-check" style="color : green";></i> 비밀번호가 일치합니다.' );
		}
		
	}

	function checkDuplicateId() {
		
		inputId = document.getElementById("userId").value;

		$.ajax({
			
			method : 'get',
			url : 'accountRegister/checkDuplicate',
			data : {
				'userId': inputId,
				'checkType' : 'id'
			},
			success : function( result ) {
				$("#idDuplicateInfo").css('color','green');
				$("#idDuplicateInfo").html( '<i class="fa fa-check" style="color : green";></i> 사용 가능한 아이디 입니다.' );
				
			}, error : function( result ){
				$("#idDuplicateInfo").css('color','red');
				$("#idDuplicateInfo").html( '<i class="fa fa-check" style="color : red";></i> 사용할 수 없는 아이디 입니다.' );
			}
			
		});
		
	}
	
	function checkDuplicateEmail(){
		
		userEmail = document.getElementById("userEmail").value;

		$.ajax({
			
			method : 'get',
			url : 'accountRegister/checkDuplicate',
			data : {
				'userEmail': userEmail,
				'checkType' : 'email'
			},
			success : function( result ) {
				$("#emailDuplicateInfo").css('color','green');
				$("#emailDuplicateInfo").html( '<i class="fa fa-check" style="color : green";></i> 사용 가능한 이메일 입니다.' );
				
			}, error : function( result ){
				$("#emailDuplicateInfo").css('color','red');
				$("#emailDuplicateInfo").html( '<i class="fa fa-check" style="color : red";></i> 중복되는 이메일 입니다.' );
			}
			
		});
		
	}

	function accountRegister() {

		var userId = document.getElementById("userId").value;
		var userPw = document.getElementById("userPw").value;
		var userCheckPw = document.getElementById("checkPw").value;
		var userEmail = document.getElementById("userEmail").value;

		if (userPw != userCheckPw) {
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}

		if (!isEmail(userEmail)) {
			alert("이메일 형식이 올바르지 않습니다.");
			return;
		}

	}

	function isEmail(asValue) {

		var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

		return regExp.test(asValue); // 형식에 맞는 경우 true 리턴	

	}

	Dropzone.autoDiscover = false;

	Dropzone.options.dzUpload = {
		url : "/profileUploadCheck",
		thumbnailWidth : null,
		thumbnailHeight : null,
		init : function() {
			this.on("thumbnail", function(file, dataUrl) {
				$('.dz-image').last().find('img').attr({
					width : '100%',
					height : '100%'
				});
			}), this.on("success", function(file) {
				$('.dz-image').css({
					"width" : "100%",
					"height" : "auto"
				});
			})
		},
		addRemoveLinks : true,
		maxFiles : 1,
		acceptedFiles : ".jpeg,.jpg,.png,.JPEG,.JPG,.PNG",
		headers : {
			'X-CSRF-TOKEN' : $('meta[name="_csrf"]').attr('content')
		},
		success : function(file, response) {

			console.log();
			console.log(response);
			$('input[name=profile_image]').val(file.dataURL);

		},
		error : function(file, response) {
			console.log(file);
			console.log(response);

		}
	};
	var myDropzone = new Dropzone("div#dzUpload");
</script>
</html>