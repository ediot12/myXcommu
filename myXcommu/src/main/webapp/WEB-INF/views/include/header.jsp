<!-- <!DOCTYPE html>
<html lang="ko"> -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="/resources/assets/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="/resources/assets/vendors/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet" href="/resources/assets/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" href="/resources/assets/vendors/typicons/typicons.css">
<link rel="stylesheet" href="/resources/assets/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet" href="/resources/assets/vendors/jquery-bar-rating/css-stars.css">
<!-- End Plugin css for this page -->
<!-- Layout styles -->
<link rel="stylesheet" href="/resources/assets/css/shared/style.css">
<link rel="stylesheet" href="/resources/assets/css/demo_11/style.css">
<!-- End Layout styles -->
<link rel="shortcut icon" href="/resources/assets/images/favicon.png" />
<link rel="stylesheet"  href="/resources/assets/vendors/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"  href="/resources/assets/vendors/simple-line-icons/css/simple-line-icons.css">
<script type="text/javascript" charset="utf8" src="/resources/assets/js/shared/jquery-1.12.4.min.js"></script>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> -->

<style>
i.overActive:hover {
	cursor: pointer;
}

div.cke_contents {
	border: 1px solid #383e5d;
}

div#cke_contentArea {
	border: 1px solid #383e5d !important;
}

.page-body-wrapper {
	min-height: calc(100vh - 63px);
	background: #F3F3F3;
	padding-left: 0;
	padding-right: 0;
}

.content-wrapper {
	padding: 1.5rem 0;
	width: 100%;
	flex-grow: 1;
	margin: 0 auto;
	/* max-width: 960px; */
	max-width : 1115px;
}

table > thead > tr > th {
	font-weight : bold!important;
}

.swal-title, .swal-text{ /* sweetalert의 내용 글자 크기 */
	font-size : 15pt;
	font-weight : bold;
}

.navbar.horizontal-layout .nav-bottom .page-navigation > .nav-item{
	width : 14.28%;
}

/* .container {
    max-width: 960px;
} */
</style>
<script>
	function commonReport( text ){
	
	var infoTitle = '';
	var reportType = '';
	
	if( text == 'porno' ){			
		infoTitle = "음란물이 아닐 경우 처리되지 않으며, 허위신고시 차단 조치 됩니다."
	}
	
	if( text == 'board' ){
		infoTitle = "허위 신고나 신고 사유와 맞지 않는 신고는 차단 될 수 있습니다. 신고를 진행 하시겠습니까?"
	}
	
	swal({
		  title: infoTitle,
		  icon: "error",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
			  
			  $.ajax({
					
					url : '/common/view/commonReport',
					method : 'GET',
					data : {
						'writer': document.getElementById("writer").value,
						'boardSeq' : document.getElementById("boardSeq").value,
						'boardType' : document.getElementById("boardType").value,
						'boardReporter' : document.getElementById("reporter").value,
						'reportType' : text
					},
					success : function ( result ){
						swal("신고접수 되었습니다.", {
						      icon: "success",
						    });
						$('#reportModal').modal('hide');
					},
					error : function ( result ){
						swal("에러가 발생했습니다.", {
						      icon: "success",
						    });
						$('#reportModal').modal('hide');
					}
					
				});
			
		  }
		});
	
	
}

</script>
<title>myXcommu</title>
</head>
<body>

	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_horizontal-navbar.html -->
			<nav class="navbar horizontal-layout col-lg-12 col-12 p-0">
				<div class="container d-flex flex-row nav-top">
					<div class="text-center navbar-brand-wrapper d-flex align-items-top">
						<a class="navbar-brand brand-logo" href="/"> <img src="/resources/assets/images/myXcommu-logo.png" alt="logo" / style="width: 100%; height: 65px; margin-top: -5px;">
						</a> <a class="navbar-brand brand-logo-mini" href="/"> <img src="/resources/assets/images/myXcommu-logo.png" alt="logo" />
						</a>
					</div>
					<div class="navbar-menu-wrapper d-flex align-items-center">
						<form action="/allSearch" class="d-none d-sm-block">
							<div class="input-group search-box">
								<div class="input-group-prepend">
									<span class="input-group-text"> <i class="mdi mdi mdi-magnify"></i>
									</span>
								</div>
								<input type="text" class="form-control" name="searchWord" placeholder="Type to search…"> <i class="mdi mdi mdi-close search-close"></i>
							</div>
						</form>
						<ul class="navbar-nav ml-auto">
							<li class="nav-item dropdown"><a class="nav-link count-indicator dropdown-toggle" id="messageDropdown" href="#" data-toggle="dropdown" aria-expanded="false"> <i class="mdi mdi-file-outline"></i> <span class="count">7</span>
							</a>
								<div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0" aria-labelledby="messageDropdown">
									<a class="dropdown-item py-3">
										<p class="mb-0 font-weight-medium float-left">You have 7 unread mails</p> <span class="badge badge-pill badge-primary float-right">View all</span>
									</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item preview-item">
										<div class="preview-thumbnail">
											<img src="/resources/assets/images/faces/face10.jpg" alt="image" class="img-sm profile-pic">
										</div>
										<div class="preview-item-content flex-grow py-2">
											<p class="preview-subject ellipsis font-weight-medium text-dark">Marian Garner</p>
											<p class="font-weight-light small-text">The meeting is cancelled</p>
										</div>
									</a> <a class="dropdown-item preview-item">
										<div class="preview-thumbnail">
											<img src="/resources/assets/images/faces/face12.jpg" alt="image" class="img-sm profile-pic">
										</div>
										<div class="preview-item-content flex-grow py-2">
											<p class="preview-subject ellipsis font-weight-medium text-dark">David Grey</p>
											<p class="font-weight-light small-text">The meeting is cancelled</p>
										</div>
									</a> <a class="dropdown-item preview-item">
										<div class="preview-thumbnail">
											<img src="/resources/assets/images/faces/face1.jpg" alt="image" class="img-sm profile-pic">
										</div>
										<div class="preview-item-content flex-grow py-2">
											<p class="preview-subject ellipsis font-weight-medium text-dark">Travis Jenkins</p>
											<p class="font-weight-light small-text">The meeting is cancelled</p>
										</div>
									</a>
								</div></li>
							<li class="nav-item dropdown ml-4"><a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown" href="#" data-toggle="dropdown"> <i class="mdi mdi-bell-outline"></i> <span class="count bg-success">4</span>
							</a>
								<div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0" aria-labelledby="notificationDropdown">
									<a class="dropdown-item py-3 border-bottom">
										<p class="mb-0 font-weight-medium float-left">You have 4 new notifications</p> <span class="badge badge-pill badge-primary float-right">View all</span>
									</a> <a class="dropdown-item preview-item py-3">
										<div class="preview-thumbnail">
											<i class="mdi mdi-alert m-auto text-primary"></i>
										</div>
										<div class="preview-item-content">
											<h6 class="preview-subject font-weight-normal text-dark mb-1">Application Error</h6>
											<p class="font-weight-light small-text mb-0">Just now</p>
										</div>
									</a> <a class="dropdown-item preview-item py-3">
										<div class="preview-thumbnail">
											<i class="mdi mdi-settings m-auto text-primary"></i>
										</div>
										<div class="preview-item-content">
											<h6 class="preview-subject font-weight-normal text-dark mb-1">Settings</h6>
											<p class="font-weight-light small-text mb-0">Private message</p>
										</div>
									</a> <a class="dropdown-item preview-item py-3">
										<div class="preview-thumbnail">
											<i class="mdi mdi-airballoon m-auto text-primary"></i>
										</div>
										<div class="preview-item-content">
											<h6 class="preview-subject font-weight-normal text-dark mb-1">New user registration</h6>
											<p class="font-weight-light small-text mb-0">2 days ago</p>
										</div>
									</a>
								</div></li>
							<li class="nav-item dropdown d-none d-xl-inline-block user-dropdown"><a class="nav-link dropdown-toggle" id="UserDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
									<div class="wrapper d-flex flex-column">
										<span class="profile-text">${sessionScope.currentUserId}</span> <span class="user-designation">Administrator</span>
									</div> <!-- <div class="display-avatar bg-inverse-primary text-primary">AS</div> --> <c:if test="${sessionScope.image64 == null }">
										<img src="/resources/assets/images/empty_face.png" alt="image" class="display-avatar bg-inverse-primary text-primary">
									</c:if> <c:if test="${sessionScope.image64 != null }">
										<img class="display-avatar bg-inverse-primary text-primary" src="${sessionScope.image64 }" alt="profile image">
									</c:if>
							</a>
								<div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="UserDropdown">
									<div class="dropdown-header text-center">
										<c:if test="${sessionScope.image64 == null }">
											<img src="/resources/assets/images/empty_face.png" alt="image" class="img-md rounded-circle">
										</c:if>
										<c:if test="${sessionScope.image64 != null }">
											<img class="img-md rounded-circle" src="${sessionScope.image64 }" alt="profile image">
										</c:if>
										<p class="mb-1 mt-3 font-weight-semibold">${sessionScope.currentUserId}</p>
										<p class="font-weight-light text-muted mb-0">adamsmith@gmail.com</p>
									</div>
									<a class="dropdown-item" href="/myProfile">
										<i class="dropdown-item-icon mdi mdi-account-outline text-primary"></i>
										 My Profile 
										 <span class="badge badge-pill badge-danger">1</span>
									</a> 
									<!-- <a class="dropdown-item">
										<i class="dropdown-item-icon mdi mdi-message-text-outline text-primary"></i> 
										Messages
									</a> 
									<a class="dropdown-item">
										<i class="dropdown-item-icon mdi mdi-calendar-check-outline text-primary"></i> 
										Activity
									</a> 
									<a class="dropdown-item">
										<i class="dropdown-item-icon mdi mdi-help-circle-outline text-primary"></i> 
										FAQ
									</a>  -->
									<a class="dropdown-item" href="/customLogout">
										<i class="dropdown-item-icon mdi mdi-power text-primary"></i>
										Sign Out
									</a>
								</div></li>
						</ul>
						<button class="navbar-toggler align-self-center" type="button" data-toggle="minimize">
							<span class="mdi mdi-menu"></span>
						</button>
					</div>
				</div>
				<div class="nav-bottom">
					<div class="container">
						<ul class="nav page-navigation">
							<li class="nav-item"><a href="/" class="nav-link"> <i class="link-icon fa fa-home"></i> <span class="menu-title">Home</span>
							</a></li>
							<li class="nav-item"><a href="/notice/main" class="nav-link"> <i class="link-icon fa fa-info-circle"></i> <span class="menu-title">공지사항</span>
							</a></li>
							<li class="nav-item"><a href="/qna/main" class="nav-link"> <i class="link-icon fa fa-question-circle"></i> <span class="menu-title">질문게시판</span>
							</a>
								</li>
							<li class="nav-item"><a href="/free/main" class="nav-link"> <i class="link-icon ti-pencil-alt" style="font-size : 11pt;"></i> <span class="menu-title">자유게시판</span>
							</a></li>
							<li class="nav-item"><a href="/proposal/main" class="nav-link"> <i class="link-icon fa fa-paper-plane"></i> <span class="menu-title">건의게시판</span>
							</a></li>
							<li class="nav-item"><a href="/picture/main" class="nav-link"> <i class="link-icon fa fa-picture-o"></i> <span class="menu-title ">사진게시판</span>
							</a></li>
							<li class="nav-item"><a href="#" class="nav-link"> <i class="link-icon mdi mdi-cube-outline"></i> <span class="menu-title ">기타</span> <i class="menu-arrow "></i>
							</a>
								<div class="submenu ">
									<ul class="submenu-item ">
										<li class="nav-item"><a class="nav-link " href="/report"><i class="fa fa-exclamation-triangle"></i>신고</a></li>
										<li class="nav-item"><a class="nav-link " href="/viewStatistics"><i class="icon-chart"></i>통계 및 순위</a></li>
									</ul>
							</div></li>
						</ul>
					</div>
				</div>
			</nav>
			<!-- partial -->

			<div class="main-panel container">