<!-- <!DOCTYPE html>
<html lang="ko"> -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- <link rel="stylesheet" href="/resources/assets/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="/resources/assets/vendors/iconfonts/ionicons/css/ionicons.css">
<link rel="stylesheet" href="/resources/assets/vendors/iconfonts/typicons/src/font/typicons.css">
<link rel="stylesheet" href="/resources/assets/vendors/iconfonts/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet" href="/resources/assets/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet" href="/resources/assets/vendors/css/vendor.bundle.addons.css">
endinject
plugin css for this page
<link rel="stylesheet" href="/resources/assets/vendors/iconfonts/font-awesome/css/font-awesome.min.css" />
End plugin css for this page
inject:css
<link rel="stylesheet" href="/resources/assets/css/shared/style.css">
endinject
Layout styles
<link rel="stylesheet" href="/resources/assets/css/demo_1/style.css"> -->

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
<link rel="stylesheet" href="/resources/assets/css/demo_3/style.css">
<!-- End Layout styles -->
<link rel="shortcut icon" href="/resources/assets/images/favicon.png" />
<link rel="stylesheet" href="/resources/assets/vendors/font-awesome/css/font-awesome.min.css">

<style>
/* @font-face {
	font-family: 'NanumGothic';
	src: url('/resources/assets/fonts/nanum/NanumGothic.eot');
	src: url('/resources/assets/fonts/nanum/NanumGothic.eot')
		format('embedded-opentype'),
		url('/resources/assets/fonts/nanum/NanumGothic.woff') format('woff');
} */

body{
	font-family: "NanumGothic"!important;
}


.content-wrapper {
	padding-bottom: 0px !important;
}

i.overActive:hover{
	cursor : pointer;
}

div.cke_contents{
	border: 1px solid #383e5d;
}

</style>

<title>myXcommu</title>
</head>
<body>
	<div class="container-scroller">
		<!-- partial:partials/_navbar.html -->
		<nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
			<div class="text-center navbar-brand-wrapper d-flex align-items-top justify-content-center">
				<a class="navbar-brand brand-logo" href="/"> <img src="/resources/assets/images/myXcommu-logo.png" alt="logo" />
				</a> <a class="navbar-brand brand-logo-mini" href="/"> <img src="/resources/assets/images/myXcommu-logo.png" alt="logo">
				</a>
			</div>
			<div class="navbar-menu-wrapper d-flex align-items-center">
				<button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
		            <span class="mdi mdi-menu"></span>
		        </button>
				<ul class="navbar-nav">
					<li class="nav-item font-weight-semibold d-none d-lg-block">Help : 010 6747 9197</li>
					<li class="nav-item dropdown language-dropdown"><a class="nav-link dropdown-toggle px-2 d-flex align-items-center" id="LanguageDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
							<div class="d-inline-flex mr-0 mr-md-3">
								<div class="flag-icon-holder">
									<i class="flag-icon flag-icon-us"></i>
								</div>
							</div> <span class="profile-text font-weight-medium d-none d-md-block">한글English</span>
					</a>
						<div class="dropdown-menu dropdown-menu-left navbar-dropdown py-2" aria-labelledby="LanguageDropdown">
							<a class="dropdown-item">
								<div class="flag-icon-holder">
									<i class="flag-icon flag-icon-us"></i>
								</div>English
							</a> <a class="dropdown-item">
								<div class="flag-icon-holder">
									<i class="flag-icon flag-icon-fr"></i>
								</div>French
							</a> <a class="dropdown-item">
								<div class="flag-icon-holder">
									<i class="flag-icon flag-icon-ae"></i>
								</div>Arabic
							</a> <a class="dropdown-item">
								<div class="flag-icon-holder">
									<i class="flag-icon flag-icon-ru"></i>
								</div>Russian
							</a>
						</div></li>
				</ul>
				
				<form class="ml-auto search-form d-none d-md-block" action="#">
		            <div class="form-group">
		              <input type="search" class="form-control" placeholder="All Search Here">
		            </div>
		          </form>

				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown"><a class="nav-link count-indicator" id="messageDropdown" href="#" data-toggle="dropdown" aria-expanded="false"> <i class="mdi mdi-bell-outline"></i> <span class="count">7</span>
					</a>
						<div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0" aria-labelledby="messageDropdown">
							<a class="dropdown-item py-3">
								<p class="mb-0 font-weight-medium float-left">You have 7 unread mails</p> <span class="badge badge-pill badge-primary float-right">View all</span>
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item preview-item">
								<div class="preview-thumbnail">
									<img src="/resources/assets/images/empty_face.png" alt="image" class="img-sm profile-pic">
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
					<li class="nav-item dropdown"><a class="nav-link count-indicator" id="notificationDropdown" href="#" data-toggle="dropdown"> <i class="mdi mdi-email-outline"></i> <span class="count bg-success">3</span>
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
					<li class="nav-item dropdown d-none d-xl-inline-block user-dropdown"><a class="nav-link dropdown-toggle" id="UserDropdown" href="#" data-toggle="dropdown" aria-expanded="false"> <img class="img-xs rounded-circle"
							src="/resources/assets/images/empty_face.png"
							alt="Profile image"
						>
					</a>
						<div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="UserDropdown">
							<div class="dropdown-header text-center">
								<img class="img-md rounded-circle"
									src="/resources/assets/images/empty_face.png"
									alt="Profile image"
								>
								<p class="mb-1 mt-3 font-weight-semibold">${sessionScope.currentUserId}</p>
								<p class="font-weight-light text-muted mb-0">User_Email_Area</p>
							</div>
							<a class="dropdown-item">
								My Profile 
								<span class="badge badge-pill badge-danger">1</span> 
								<i class="dropdown-item-icon ti-dashboard"></i>
							</a> 
							<!-- <a class="dropdown-item">
								Messages
								<i class="dropdown-item-icon ti-comment-alt"></i>
							</a> 
							<a class="dropdown-item">
								Activity
								<i class="dropdown-item-icon ti-location-arrow"></i>
							</a> 
							<a class="dropdown-item">
								FAQ
								<i class="dropdown-item-icon ti-help-alt"></i>
							</a>  -->
							<a href="/customLogout" class="dropdown-item">
								Logout
								<i class="dropdown-item-icon ti-power-off"></i>
							</a>
						</div></li>
				</ul>
				<button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
					<span class="mdi mdi-menu"></span>
				</button>
			</div>
		</nav>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_sidebar.html -->
			<nav class="sidebar sidebar-offcanvas" id="sidebar">
				<ul class="nav">
					<li class="nav-item nav-profile"><a href="#" class="nav-link">
							<div class="profile-image">
								<img class="img-xs rounded-circle"
									src="/resources/assets/images/empty_face.png"
									alt="profile image"
								>
								<div class="dot-indicator bg-success"></div>
							</div>
							<div class="text-wrapper">
								<p class="profile-name">${sessionScope.currentUserId}님 반갑습니다.</p>
								<p class="designation" style="font-size : 9pt;">최근 로그인 : ${sessionScope.recentlyLoginDate }</p>
							</div>
					</a></li>
					<li class="nav-item nav-category">Main Menu</li>
					<li class="nav-item"><a class="nav-link" href="/notice/main"> 
						<i class="menu-icon typcn typcn-document-text"></i> 
						<span class="menu-title">공지사항</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="/board/list_"> 
						<i class="menu-icon typcn typcn-document-text"></i> 
						<span class="menu-title">Home</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic"> <i class="menu-icon typcn typcn-coffee"></i> <span class="menu-title">Board 2</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="ui-basic">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link" href="pages/ui-features/buttons.html">Sub 1</a></li>
								<li class="nav-item"><a class="nav-link" href="pages/ui-features/dropdowns.html">Sub 2</a></li>
								<li class="nav-item"><a class="nav-link" href="pages/ui-features/typography.html">Sub 3</a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link" href="/qna/main"> <i class="menu-icon typcn typcn-shopping-bag"></i> <span class="menu-title">질문게시판</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="/picture/main"> <i class="menu-icon typcn typcn-shopping-bag"></i> <span class="menu-title">사진게시판</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="/picture/main"> <i class="menu-icon typcn typcn-shopping-bag"></i> <span class="menu-title">자유게시판</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="/proposal/main"> <i class="menu-icon typcn typcn-shopping-bag"></i> <span class="menu-title">건의게시판</span>
					</a></li>
					<!-- <li class="nav-item"><a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth"> <i class="menu-icon typcn typcn-document-add"></i> <span class="menu-title">사진게시판</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="auth">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link" href="pages/samples/blank-page.html"> Sub 1 </a></li>
								<li class="nav-item"><a class="nav-link" href="pages/samples/login.html"> Sub 2 </a></li>
								<li class="nav-item"><a class="nav-link" href="pages/samples/register.html"> Sub 3 </a></li>
								<li class="nav-item"><a class="nav-link" href="pages/samples/error-404.html"> Sub 4 </a></li>
								<li class="nav-item"><a class="nav-link" href="pages/samples/error-500.html"> Sub 5 </a></li>
							</ul>
						</div></li> -->
						
				</ul>
				<embed height="400" width="90%" src="http://www.gagalive.kr/livechat1.swf?chatroom=myXcommu" style="margin-left : 15px;"></embed>
			</nav>
			