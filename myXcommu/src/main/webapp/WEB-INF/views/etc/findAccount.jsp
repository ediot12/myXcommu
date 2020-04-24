<!DOCTYPE html>
<html lang="ko">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>myXcommu - Find Account</title>
<!-- plugins:css -->
<link rel="stylesheet" href="/resources/assets/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="/resources/assets/vendors/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet" href="/resources/assets/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" href="/resources/assets/vendors/typicons/typicons.css">
<link rel="stylesheet" href="/resources/assets/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<!-- End Plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="/resources/assets/css/shared/style.css">
</head>
<body>
	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper">
			<div class="main-panel container">
				<div class="content-wrapper">
				
					<a class="navbar-brand brand-logo" href="/"> 
						<img src="/resources/assets/images/myXcommu-logo.png" alt="logo" style="height: 65px; margin-top: -5px;">
					</a>
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">계정 찾기</h4>
							<ul class="nav nav-tabs tab-solid tab-solid-danger" role="tablist">
								<li class="nav-item"><a class="nav-link active" id="tab-5-1" data-toggle="tab" href="#home-5-1" role="tab" aria-controls="home-5-1" aria-selected="true">아이디 찾기</a></li>
								<li class="nav-item"><a class="nav-link" id="tab-5-2" data-toggle="tab" href="#profile-5-2" role="tab" aria-controls="profile-5-2" aria-selected="false">비밀번호 찾기</a></li>
							</ul>
							<div class="tab-content tab-content-solid">
								<div class="tab-pane fade active show" id="home-5-1" role="tabpanel" aria-labelledby="tab-5-1">
									<div class="row">
										<div class="col-md-12">
											<p>이메일 찾기는 등록된 이메일로 회원님의 ID를 발송합니다.</p>
											<form class="forms-sample">
												<div class="form-group">
													<label for="exampleInputEmail1">Email address</label> 
													<input type="text" class="form-control" id="findIdEmail" placeholder="Enter email">
												</div>
												<button type="button" class="btn btn-success mr-2" onclick="submitFindID()">제출</button>
											</form>
										</div>
									</div>
								</div>
								<div class="tab-pane fade" id="profile-5-2" role="tabpanel" aria-labelledby="tab-5-2">
									<div class="tab-pane fade active show" id="home-5-1" role="tabpanel" aria-labelledby="tab-5-1">
									<div class="row">
										<div class="col-md-12">
											<p>비밀번호 찾기는 등록된 이메일과 아이디가 일치하면 이메일로 임시 비밀번호를 발급해드립니다.</p>											
											<form class="forms-sample">
												<div class="form-group">
													<label for="exampleInputEmail1">Email address</label> 
													<input type="text" class="form-control" id="findPWEmail" placeholder="Enter email">
												</div>
												<div class="form-group">
													<label for="exampleInputId">회원 ID</label>
													<input type="text" class="form-control" id="findPWid" placeholder="Enter ID">
												</div>
												<button type="button" class="btn btn-success mr-2" onclick="submitFindPw()">제출</button>
											</form>
										</div>
									</div>
								</div>
								</div>								
							</div>
						</div>
					</div>
				</div>
			<!-- content-wrapper ends -->
			</div>
		</div>
		<!-- page-body-wrapper ends -->
	</div>

	<div class="modal fade" id="loadingModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel-3" aria-modal="true" data-backdrop="static">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<div class="circle-loader"></div>
				</div>
				<div class="modal-body" style="margin-top : -50px;">
					발송중입니다. <br/>잠시만 기다려 주십시오.
				</div>
			</div>
		</div>
	</div>


	<!-- <div class="modal fade" id="loadingModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="loader-demo-box" style="background: steelblue; width: 300px; height: 300px; position:absolute; top:25%; left:45%;">
	    	<div class="circle-loader"></div>
	  	</div>
	  	<div>
	  		확인중입니다. 잠시만 기다려주십시오. 씨발련아
	  	</div>
	</div> -->
	
	<!-- container-scroller -->
	<!-- plugins:js -->
	<script type="text/javascript" charset="utf8" src="/resources/assets/js/shared/jquery-1.12.4.min.js"></script>
	<script src="/resources/assets/vendors/js/vendor.bundle.base.js"></script>
	<script src="/resources/assets/js/shared/sweetalert.min.js"></script>
	<script src="/resources/assets/vendors/jquery-toast-plugin/jquery.toast.min.js"></script>
	<!-- endinject -->
	
	<script>
	
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
	
		$(document).ajaxSend( function ( e, xhr, options ) {
				
			xhr.setRequestHeader( csrfHeaderName, csrfTokenValue);
		
			console.log( "csrfHeaderName : " + csrfHeaderName );
			console.log( "csrfTokenValue : " + csrfTokenValue );
		});
	
		function submitFindID(){
			
			userEmail = document.getElementById("findIdEmail").value;
			
			$("#loadingModal").modal("show");
			
			setTimeout(function() {
			
				$.ajax({
					
					method : 'post',
					url : 'findId',
					data : {
						'findUserId' : userEmail
					},
					success : function ( result ){					
						$("#loadingModal").modal("hide");
						swal("이메일이 발송되었습니다.", {
						      icon: "success",
					    });
						setTimeout(function() {
							location.href="/";							
						}, 1000);
					},
					error : function ( result ){
						$("#loadingModal").modal("hide");
						swal("존재하지 않는 계정입니다.", {
						      icon: "error",
					    });
					}
					
				});
			
			}, 1000);
			
		}
		
		
		function submitFindPw(){
			

			userEmail = document.getElementById("findPWEmail").value;
			findPWid = document.getElementById("findPWid").value;
			
			
			$("#loadingModal").modal("show");
			
			setTimeout(function() {
				$.ajax({
					
					method : 'post',
					url : 'findPW',
					data : {
						'findUserEmail' : userEmail,
						'findUserId' : findPWid
					},
					success : function ( result ){					
						$("#loadingModal").modal("hide");
						swal("이메일이 발송되었습니다.", {
						      icon: "success",
					    });
						setTimeout(function() {
							location.href="/";							
						}, 1000);
					},
					error : function ( result ){
						$("#loadingModal").modal("hide");
						swal("존재하지 않는 계정입니다.", {
						      icon: "error",
					    });
					}
					
				});
			}, 1000);
			
			
			
		}
	</script>
</body>
</html>