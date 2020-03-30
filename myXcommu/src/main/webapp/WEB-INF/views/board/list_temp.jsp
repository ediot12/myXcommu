
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Star Admin Premium Bootstrap Admin Dashboard Template</title>
<!-- plugins:css -->
<link rel="stylesheet" href="../assets/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="../assets/vendors/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet" href="../assets/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" href="../assets/vendors/typicons/typicons.css">
<link rel="stylesheet" href="../assets/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet" href="../assets/vendors/jquery-bar-rating/css-stars.css">
<link rel="stylesheet" href="../assets/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
<!-- End Plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="../assets/css/shared/style.css">
<!-- endinject -->
<!-- Layout styles -->
<link rel="stylesheet" href="../assets/css/demo_11/style.css">
<!-- End Layout styles -->
<link rel="shortcut icon" href="../assets/images/favicon.png" />
</head>
<body>
	<div class="container-scroller">
		<!-- partial:partials/_horizontal-navbar.html -->
		<nav class="navbar horizontal-layout col-lg-12 col-12 p-0">
			<div class="container d-flex flex-row nav-top">
				<div class="text-center navbar-brand-wrapper d-flex align-items-top">
					<a class="navbar-brand brand-logo" href="index.html"> <img src="../assets/images/logo_2.svg" alt="logo" />
					</a> <a class="navbar-brand brand-logo-mini" href="index.html"> <img src="../assets/images/logo-mini.svg" alt="logo" />
					</a>
				</div>
				<div class="navbar-menu-wrapper d-flex align-items-center">
					<form action="form-action" class="d-none d-sm-block">
						<div class="input-group search-box">
							<div class="input-group-prepend">
								<span class="input-group-text"> <i class="mdi mdi mdi-magnify"></i>
								</span>
							</div>
							<input type="text" class="form-control" placeholder="Type to search…"> <i class="mdi mdi mdi-close search-close"></i>
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
										<img src="../assets/images/faces/face10.jpg" alt="image" class="img-sm profile-pic">
									</div>
									<div class="preview-item-content flex-grow py-2">
										<p class="preview-subject ellipsis font-weight-medium text-dark">Marian Garner</p>
										<p class="font-weight-light small-text">The meeting is cancelled</p>
									</div>
								</a> <a class="dropdown-item preview-item">
									<div class="preview-thumbnail">
										<img src="../assets/images/faces/face12.jpg" alt="image" class="img-sm profile-pic">
									</div>
									<div class="preview-item-content flex-grow py-2">
										<p class="preview-subject ellipsis font-weight-medium text-dark">David Grey</p>
										<p class="font-weight-light small-text">The meeting is cancelled</p>
									</div>
								</a> <a class="dropdown-item preview-item">
									<div class="preview-thumbnail">
										<img src="../assets/images/faces/face1.jpg" alt="image" class="img-sm profile-pic">
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
									<span class="profile-text">Adam Smith</span> <span class="user-designation">Administrator</span>
								</div>
								<div class="display-avatar bg-inverse-primary text-primary">AS</div>
						</a>
							<div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="UserDropdown">
								<div class="dropdown-header text-center">
									<img class="img-md rounded-circle" src="../assets/images/faces/face1.jpg" alt="Profile image">
									<p class="mb-1 mt-3 font-weight-semibold">Adam Smith</p>
									<p class="font-weight-light text-muted mb-0">adamsmith@gmail.com</p>
								</div>
								<a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-account-outline text-primary"></i> My Profile <span class="badge badge-pill badge-danger">1</span></a> <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-message-text-outline text-primary"></i> Messages</a> <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-calendar-check-outline text-primary"></i> Activity</a> <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-help-circle-outline text-primary"></i> FAQ</a> <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-power text-primary"></i>Sign Out</a>
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
						<li class="nav-item"><a href="index.html" class="nav-link"> <i class="link-icon mdi mdi-airplay"></i> <span class="menu-title">Dashboard</span>
						</a></li>
						<li class="nav-item"><a href="pages/samples/widgets.html" class="nav-link"> <i class="link-icon mdi mdi-apple-safari"></i> <span class="menu-title">Widgets</span>
						</a></li>
						<li class="nav-item mega-menu"><a href="#" class="nav-link"> <i class="link-icon mdi mdi-flag-outline"></i> <span class="menu-title">UI Elements</span> <i class="menu-arrow"></i>
						</a>
							<div class="submenu">
								<div class="col-group-wrapper row">
									<div class="col-group col-md-4">
										<div class="row">
											<div class="col-12">
												<p class="category-heading">Basic Elements</p>
											</div>
											<div class="col-md-6">
												<ul class="submenu-item">
													<li class="nav-item"><a class="nav-link" href="pages/ui-features/accordions.html">Accordion</a></li>
													<li class="nav-item"><a class="nav-link" href="pages/ui-features/buttons.html">Buttons</a></li>
													<li class="nav-item"><a class="nav-link" href="pages/ui-features/badges.html">Badges</a></li>
													<li class="nav-item"><a class="nav-link" href="pages/ui-features/breadcrumbs.html">Breadcrumbs</a></li>
													<li class="nav-item"><a class="nav-link" href="pages/ui-features/dropdowns.html">Dropdown</a></li>
													<li class="nav-item"><a class="nav-link" href="pages/ui-features/modals.html">Modals</a></li>
												</ul>
											</div>
											<div class="col-md-6">
												<ul class="submenu-item">
													<li class="nav-item"><a class="nav-link" href="pages/ui-features/progress.html">Progress bar</a></li>
													<li class="nav-item"><a class="nav-link" href="pages/ui-features/pagination.html">Pagination</a></li>
													<li class="nav-item"><a class="nav-link" href="pages/ui-features/tabs.html">Tabs</a></li>
													<li class="nav-item"><a class="nav-link" href="pages/ui-features/typography.html">Typography</a></li>
													<li class="nav-item"><a class="nav-link" href="pages/ui-features/tooltips.html">Tooltip</a></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="col-group col-md-4">
										<div class="row">
											<div class="col-12">
												<p class="category-heading">Advanced Elements</p>
											</div>
											<div class="col-md-6">
												<ul class="submenu-item">
													<li class="nav-item"><a class="nav-link" href="pages/ui-features/dragula.html">Dragula</a></li>
													<li class="nav-item"><a class="nav-link" href="pages/ui-features/carousel.html">Carousel</a></li>
													<li class="nav-item"><a class="nav-link" href="pages/ui-features/clipboard.html">Clipboard</a></li>
													<li class="nav-item"><a class="nav-link" href="pages/ui-features/context-menu.html">Context Menu</a></li>
													<li class="nav-item"><a class="nav-link" href="pages/ui-features/loaders.html">Loader</a></li>
													<li class="nav-item"><a class="nav-link" href="pages/ui-features/slider.html">Slider</a></li>
												</ul>
											</div>
											<div class="col-md-6">
												<ul class="submenu-item">
													<li class="nav-item"><a class="nav-link" href="pages/ui-features/popups.html">Popup</a></li>
													<li class="nav-item"><a class="nav-link" href="pages/ui-features/notifications.html">Notification</a></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="col-group col-md-2">
										<p class="category-heading">Table</p>
										<ul class="submenu-item">
											<li class="nav-item"><a class="nav-link" href="pages/tables/basic-table.html">Basic Table</a></li>
											<li class="nav-item"><a class="nav-link" href="pages/tables/data-table.html">Data Table</a></li>
											<li class="nav-item"><a class="nav-link" href="pages/tables/js-grid.html">Js-grid</a></li>
											<li class="nav-item"><a class="nav-link" href="pages/tables/sortable-table.html">Sortable Table</a></li>
										</ul>
									</div>
									<div class="col-group col-md-2">
										<p class="category-heading">Icons</p>
										<ul class="submenu-item">
											<li class="nav-item"><a class="nav-link" href="pages/icons/flag-icons.html">Flag Icons</a></li>
											<li class="nav-item"><a class="nav-link" href="pages/icons/font-awesome.html">Font Awesome</a></li>
											<li class="nav-item"><a class="nav-link" href="pages/icons/simple-line-icon.html">Simple Line Icons</a></li>
											<li class="nav-item"><a class="nav-link" href="pages/icons/themify.html">Themify Icons</a></li>
										</ul>
									</div>
								</div>
							</div></li>
						<li class="nav-item mega-menu"><a href="#" class="nav-link"> <i class="link-icon mdi mdi-content-copy"></i> <span class="menu-title">Pages</span> <i class="menu-arrow"></i>
						</a>
							<div class="submenu">
								<div class="col-group-wrapper row">
									<div class="col-group col-md-3">
										<p class="category-heading">User Pages</p>
										<ul class="submenu-item">
											<li class="nav-item"><a class="nav-link" href="pages/samples/login.html">Login</a></li>
											<li class="nav-item"><a class="nav-link" href="pages/samples/login-2.html">Login 2</a></li>
											<li class="nav-item"><a class="nav-link" href="pages/samples/register.html">Register</a></li>
											<li class="nav-item"><a class="nav-link" href="pages/samples/register-2.html">Register 2</a></li>
											<li class="nav-item"><a class="nav-link" href="pages/samples/lock-screen.html">Lockscreen</a></li>
										</ul>
									</div>
									<div class="col-group col-md-3">
										<p class="category-heading">Error Pages</p>
										<ul class="submenu-item">
											<li class="nav-item"><a class="nav-link" href="pages/samples/error-400.html">400</a></li>
											<li class="nav-item"><a class="nav-link" href="pages/samples/error-404.html">404</a></li>
											<li class="nav-item"><a class="nav-link" href="pages/samples/error-500.html">500</a></li>
											<li class="nav-item"><a class="nav-link" href="pages/samples/error-505.html">505</a></li>
										</ul>
									</div>
									<div class="col-group col-md-3">
										<p class="category-heading">E-commerce</p>
										<ul class="submenu-item">
											<li class="nav-item"><a class="nav-link" href="pages/samples/invoice.html">Invoice</a></li>
											<li class="nav-item"><a class="nav-link" href="pages/samples/pricing-table.html">Pricing Table</a></li>
											<li class="nav-item"><a class="nav-link" href="pages/samples/orders.html">Orders</a></li>
										</ul>
									</div>
								</div>
							</div></li>
						<li class="nav-item mega-menu"><a href="#" class="nav-link"> <i class="link-icon mdi mdi-chart-line"></i> <span class="menu-title">Forms</span> <i class="menu-arrow"></i>
						</a>
							<div class="submenu">
								<div class="col-group-wrapper row">
									<div class="col-group col-md-3">
										<p class="category-heading">Basic Elements</p>
										<ul class="submenu-item">
											<li class="nav-item"><a class="nav-link" href="pages/forms/basic_elements.html">Basic Elements</a></li>
											<li class="nav-item"><a class="nav-link" href="pages/forms/advanced_elements.html">Advanced Elements</a></li>
											<li class="nav-item"><a class="nav-link" href="pages/forms/validation.html">Validation</a></li>
											<li class="nav-item"><a class="nav-link" href="pages/forms/wizard.html">Wizard</a></li>
											<li class="nav-item"><a class="nav-link" href="pages/forms/text_editor.html">Text Editor</a></li>
											<li class="nav-item"><a class="nav-link" href="pages/forms/code_editor.html">Code Editor</a></li>
										</ul>
									</div>
									<div class="col-group col-md-3">
										<p class="category-heading">Charts</p>
										<ul class="submenu-item">
											<li class="nav-item"><a class="nav-link" href="pages/charts/chartjs.html">Chart Js</a></li>
											<li class="nav-item"><a class="nav-link" href="pages/charts/morris.html">Morris</a></li>
											<li class="nav-item"><a class="nav-link" href="pages/charts/flot-chart.html">Flaot</a></li>
											<li class="nav-item"><a class="nav-link" href="pages/charts/google-charts.html">Google Chart</a></li>
											<li class="nav-item"><a class="nav-link" href="pages/charts/sparkline.html">Sparkline</a></li>
											<li class="nav-item"><a class="nav-link" href="pages/charts/c3.html">C3 Chart</a></li>
											<li class="nav-item"><a class="nav-link" href="pages/charts/chartist.html">Chartist</a></li>
											<li class="nav-item"><a class="nav-link" href="pages/charts/justGage.html">JustGage</a></li>
										</ul>
									</div>
									<div class="col-group col-md-3">
										<p class="category-heading">Maps</p>
										<ul class="submenu-item">
											<li class="nav-item"><a class="nav-link" href="pages/maps/mapeal.html">Mapeal</a></li>
											<li class="nav-item"><a class="nav-link" href="pages/maps/vector-map.html">Vector Map</a></li>
											<li class="nav-item"><a class="nav-link" href="pages/maps/google-maps.html">Google Map</a></li>
										</ul>
									</div>
								</div>
							</div></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i class="link-icon mdi mdi-cube-outline"></i> <span class="menu-title ">Apps</span> <i class="menu-arrow "></i>
						</a>
							<div class="submenu ">
								<ul class="submenu-item ">
									<li class="nav-item "><a class="nav-link " href="pages/apps/email.html ">Email</a></li>
									<li class="nav-item "><a class="nav-link " href="pages/apps/calendar.html ">Calendar</a></li>
									<li class="nav-item "><a class="nav-link " href="pages/apps/todo.html ">Todo List</a></li>
									<li class="nav-item "><a class="nav-link " href="pages/apps/gallery.html ">Gallery</a></li>
								</ul>
							</div></li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- partial -->
		<!-- partial:partials/_settings-panel.html -->
		<div class="right-sidebar-toggler-wrapper">
			<div class="sidebar-toggler" id="layout-toggler">
				<i class="mdi mdi-settings"></i>
			</div>
			<div class="sidebar-toggler" id="chat-toggler">
				<i class="mdi mdi-chat-processing"></i>
			</div>
			<div class="sidebar-toggler">
				<a href="https://www.bootstrapdash.com/demo/star-admin-pro/src/docs/documentation.html" target="_blank"><i class="mdi mdi-file-document-outline"></i></a>
			</div>
			<div class="sidebar-toggler">
				<a href="https://www.bootstrapdash.com/product/star-admin-pro" target="_blank"><i class="mdi mdi-cart"></i></a>
			</div>
		</div>
		<div class="theme-setting-wrapper">
			<div id="theme-settings" class="settings-panel">
				<i class="settings-close mdi mdi-close"></i>
				<div class="d-flex align-items-center justify-content-between border-bottom">
					<p class="settings-heading font-weight-bold border-top-0 mb-3 pl-3 pt-0 border-bottom-0 pb-0">Template Demos</p>
				</div>
				<div class="demo-screen-wrapper">
					<a href="../demo_1/index.html" class="demo-thumb-image"> <img src="../assets/images/screenshots/default.jpg" alt="demo image">
					</a> <a href="../demo_2/index.html" class="demo-thumb-image"> <img src="../assets/images/screenshots/default-two.jpg" alt="demo image">
					</a> <a href="../demo_3/index.html" class="demo-thumb-image"> <img src="../assets/images/screenshots/default-dark.jpg" alt="demo image">
					</a> <a href="../demo_4/index.html" class="demo-thumb-image"> <img src="../assets/images/screenshots/analytics-dasboard.jpg" alt="demo image">
					</a> <a href="../demo_5/index.html" class="demo-thumb-image"> <img src="../assets/images/screenshots/Marketing-dashboard.jpg" alt="demo image">
					</a> <a href="../demo_6/index.html" class="demo-thumb-image"> <img src="../assets/images/screenshots/crm-dashboard.jpg" alt="demo image">
					</a> <a href="../demo_7/index.html" class="demo-thumb-image"> <img src="../assets/images/screenshots/modern-dashboard.jpg" alt="demo image">
					</a> <a href="../demo_8/index.html" class="demo-thumb-image"> <img src="../assets/images/screenshots/e-commerce_dashboard.jpg" alt="demo image">
					</a> <a href="../demo_9/index.html" class="demo-thumb-image"> <img src="../assets/images/screenshots/finance-dashboard.jpg" alt="demo image">
					</a> <a href="../demo_10/index.html" class="demo-thumb-image"> <img src="../assets/images/screenshots/classic-dashboard.jpg" alt="demo image">
					</a> <a href="../demo_11/index.html" class="demo-thumb-image"> <img src="../assets/images/screenshots/horizontal-screens.jpg" alt="demo image">
					</a>
				</div>
			</div>
		</div>
		<div id="right-sidebar" class="settings-panel">
			<i class="settings-close mdi mdi-close"></i>
			<div class="d-flex align-items-center justify-content-between border-bottom">
				<p class="settings-heading font-weight-bold border-top-0 mb-3 pl-3 pt-0 border-bottom-0 pb-0">Friends</p>
			</div>
			<ul class="chat-list">
				<li class="list active">
					<div class="profile">
						<img src="../assets/images/faces/face1.jpg" alt="image"> <span class="online"></span>
					</div>
					<div class="info">
						<p>Thomas Douglas</p>
						<p>Available</p>
					</div> <small class="text-muted my-auto">19 min</small>
				</li>
				<li class="list">
					<div class="profile">
						<img src="../assets/images/faces/face2.jpg" alt="image"> <span class="offline"></span>
					</div>
					<div class="info">
						<div class="wrapper d-flex">
							<p>Catherine</p>
						</div>
						<p>Away</p>
					</div>
					<div class="badge badge-success badge-pill my-auto mx-2">4</div> <small class="text-muted my-auto">23 min</small>
				</li>
				<li class="list">
					<div class="profile">
						<img src="../assets/images/faces/face3.jpg" alt="image"> <span class="online"></span>
					</div>
					<div class="info">
						<p>Daniel Russell</p>
						<p>Available</p>
					</div> <small class="text-muted my-auto">14 min</small>
				</li>
				<li class="list">
					<div class="profile">
						<img src="../assets/images/faces/face4.jpg" alt="image"> <span class="offline"></span>
					</div>
					<div class="info">
						<p>James Richardson</p>
						<p>Away</p>
					</div> <small class="text-muted my-auto">2 min</small>
				</li>
				<li class="list">
					<div class="profile">
						<img src="../assets/images/faces/face5.jpg" alt="image"> <span class="online"></span>
					</div>
					<div class="info">
						<p>Madeline Kennedy</p>
						<p>Available</p>
					</div> <small class="text-muted my-auto">5 min</small>
				</li>
				<li class="list">
					<div class="profile">
						<img src="../assets/images/faces/face6.jpg" alt="image"> <span class="online"></span>
					</div>
					<div class="info">
						<p>Sarah Graves</p>
						<p>Available</p>
					</div> <small class="text-muted my-auto">47 min</small>
				</li>
			</ul>
		</div>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<div class="main-panel container">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-12 grid-margin d-none d-lg-block">
							<div class="intro-banner">
								<div class="banner-image">
									<img src="../assets/images/dashboard/banner_img.png" alt="banner image">
								</div>
								<div class="content-area">
									<h3 class="mb-0">Welcome back, Adam!</h3>
									<p class="mb-0">Need anything more to know more? Feel free to contact us at any point.</p>
								</div>
								<a href="#" class="btn btn-light">Subscribe Now</a>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 grid-margin stretch-card">
							<div class="card card-statistics">
								<div class="card-body pb-0">
									<p class="text-muted">Total Invoice</p>
									<div class="d-flex align-items-center">
										<h4 class="font-weight-semibold">$65,650</h4>
										<h6 class="text-success font-weight-semibold ml-2">+876</h6>
									</div>
									<small class="text-muted">This has been a great update.</small>
								</div>
								<canvas class="mt-2" height="40" id="statistics-graph-1"></canvas>
							</div>
						</div>
						<div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 grid-margin stretch-card">
							<div class="card card-statistics">
								<div class="card-body pb-0">
									<p class="text-muted">Total expenses</p>
									<div class="d-flex align-items-center">
										<h4 class="font-weight-semibold">$65,650</h4>
										<h6 class="text-danger font-weight-semibold ml-2">-43</h6>
									</div>
									<small class="text-muted">view statement</small>
								</div>
								<canvas class="mt-2" height="40" id="statistics-graph-3"></canvas>
							</div>
						</div>
						<div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 grid-margin stretch-card">
							<div class="card card-statistics">
								<div class="card-body pb-0">
									<p class="text-muted">Unpaid Invoices</p>
									<div class="d-flex align-items-center">
										<h4 class="font-weight-semibold">$2,542</h4>
										<h6 class="text-success font-weight-semibold ml-2">+876</h6>
									</div>
									<small class="text-muted">view history</small>
								</div>
								<canvas class="mt-2" height="40" id="statistics-graph-2"></canvas>
							</div>
						</div>
						<div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 grid-margin stretch-card">
							<div class="card card-statistics">
								<div class="card-body pb-0">
									<p class="text-muted">Amount Due</p>
									<div class="d-flex align-items-center">
										<h4 class="font-weight-semibold">$3450</h4>
										<h6 class="text-success font-weight-semibold ml-2">+23</h6>
									</div>
									<small class="text-muted">65% lower growth</small>
								</div>
								<canvas class="mt-2" height="40" id="statistics-graph-4"></canvas>
							</div>
						</div>
						<div class="col-md-8 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-md-8 d-flex flex-column">
											<div class="d-flex align-items-center">
												<h4 class="card-title mb-0">Realtime Statistics</h4>
												<div class="badge badge-pill badge-sm badge-danger my-auto ml-3 d-none d-lg-block">New</div>
											</div>
											<h2>24.456%</h2>
											<canvas class="my-4 my-md-0 mt-md-auto " id="realtime-statistics" height="200"></canvas>
										</div>
										<div class="col-md-4">
											<small class="text-muted ml-auto d-none d-lg-block mb-3">Updated at 08.32pm, Aug 2018</small>
											<div class="d-flex justify-content-between py-2 border-bottom">
												<div class="wrapper">
													<p class="mb-0">Marketing</p>
													<h5 class="font-weight-medium">34%</h5>
												</div>
												<div class="wrapper d-flex flex-column align-items-center">
													<small class="text-muted mb-2">2018</small>
													<div class="badge badge-pill badge-danger">Mar</div>
												</div>
											</div>
											<div class="d-flex justify-content-between py-2 border-bottom">
												<div class="wrapper">
													<p class="mb-0">Develpment</p>
													<h5 class="font-weight-medium">49%</h5>
												</div>
												<div class="wrapper d-flex flex-column align-items-center">
													<small class="text-muted mb-2">2018</small>
													<div class="badge badge-pill badge-warning">DVR</div>
												</div>
											</div>
											<div class="d-flex justify-content-between pt-2">
												<div class="wrapper">
													<p class="mb-0">Human Resources</p>
													<h5 class="font-weight-medium">75%</h5>
												</div>
												<div class="wrapper d-flex flex-column align-items-center">
													<small class="text-muted mb-2">2017</small>
													<div class="badge badge-pill badge-success">H&R</div>
												</div>
											</div>
											<div class="wrapper mt-4 d-none d-lg-block">
												<p class="text-muted">Note: These statistics are aggregates over all of your application's users.</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Human Resources</h4>
									<div class="aligner-wrapper">
										<canvas id="humanResouceDoughnutChart" height="140"></canvas>
										<div class="wrapper d-flex flex-column justify-content-center absolute absolute-center">
											<h4 class="text-center mb-0">8.234</h4>
											<small class="d-block text-center text-muted mb-0">Units</small>
										</div>
									</div>
									<div class="wrapper mt-4">
										<div class="d-flex align-items-center py-3 border-bottom">
											<span class="dot-indicator bg-danger"></span>
											<p class="mb-0 ml-3">Human Resources</p>
											<p class="ml-auto mb-0 text-muted">86%</p>
										</div>
										<div class="d-flex align-items-center py-3 border-bottom">
											<span class="dot-indicator bg-success"></span>
											<p class="mb-0 ml-3">Manager</p>
											<p class="ml-auto mb-0 text-muted">28%</p>
										</div>
										<div class="d-flex align-items-center pt-3">
											<span class="dot-indicator bg-primary"></span>
											<p class="mb-0 ml-3">Other</p>
											<p class="ml-auto mb-0 text-muted">20%</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6 col-lg-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-md-5 d-flex align-items-center">
											<canvas id="UsersDoughnutChart" class="400x160 mb-4 mb-md-0" height="200"></canvas>
										</div>
										<div class="col-md-7">
											<h4 class="card-title font-weight-medium mb-0 d-none d-md-block">Active Users</h4>
											<div class="wrapper mt-4">
												<div class="d-flex justify-content-between mb-2">
													<div class="d-flex align-items-center">
														<p class="mb-0 font-weight-medium">67,550</p>
														<small class="text-muted ml-2">Email account</small>
													</div>
													<p class="mb-0 font-weight-medium">80%</p>
												</div>
												<div class="progress">
													<div class="progress-bar bg-success" role="progressbar" style="width: 88%" aria-valuenow="88" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
											</div>
											<div class="wrapper mt-4">
												<div class="d-flex justify-content-between mb-2">
													<div class="d-flex align-items-center">
														<p class="mb-0 font-weight-medium">21,435</p>
														<small class="text-muted ml-2">Requests</small>
													</div>
													<p class="mb-0 font-weight-medium">34%</p>
												</div>
												<div class="progress">
													<div class="progress-bar bg-info" role="progressbar" style="width: 34%" aria-valuenow="34" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-6 col-lg-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-md-7">
											<h4 class="card-title font-weight-medium mb-3">Amount Due</h4>
											<h1 class="font-weight-medium mb-0">$5998</h1>
											<p class="text-muted">Milestone Completed</p>
											<p class="mb-0">Payment for next week</p>
										</div>
										<div class="col-md-5 d-flex align-items-end mt-4 mt-md-0">
											<canvas id="conversionBarChart" height="150"></canvas>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-5 grid-margin stretch-card top-selling-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Total selling product</h4>
									<canvas id="topSellingProducts" height="150"></canvas>
									<div class="column-wrapper">
										<div class="column">
											<div class="d-flex flex-column flex-md-row">
												<i class="mdi mdi-shield-half-full text-primary"></i>
												<div class="d-flex flex-column ml-md-2">
													<p class="text-muted mb-0 font-weight-medium">Total Profit</p>
													<h4 class="font-weight-bold">$748</h4>
												</div>
											</div>
										</div>
										<div class="column">
											<div class="d-flex flex-column flex-md-row">
												<i class="mdi mdi-cart-outline text-success"></i>
												<div class="d-flex flex-column ml-md-2">
													<p class="text-muted mb-0 font-weight-medium">Total sales</p>
													<h4 class="font-weight-bold">$1,253</h4>
												</div>
											</div>
										</div>
									</div>
									<div class="table-responsive item-wrapper">
										<table class="table table-striped">
											<thead>
												<tr>
													<th>Product Name</th>
													<th>Quantity</th>
													<th>Status</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>Samsung Tab</td>
													<td>4323</td>
													<td>
														<div class="badge badge-success">+12.14%</div>
													</td>
												</tr>
												<tr>
													<td>Galaxy S9</td>
													<td>11,456</td>
													<td>
														<div class="badge badge-danger">-04.03%</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-7 col-lg-7 col-md-6 col-sm-12 grid-margin stretch-card">
							<div class="card review-card">
								<div class="card-header header-sm d-flex justify-content-between align-items-center">
									<h4 class="card-title">Reviews</h4>
									<div class="wrapper d-flex align-items-center">
										<p>23 New Reviews</p>
										<div class="dropdown">
											<button class="btn btn-transparent icon-btn dropdown-toggle arrow-disabled pr-0" type="button" id="dropdownMenuIconButton1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
												<i class="mdi mdi-dots-vertical"></i>
											</button>
											<div class="dropdown-menu" aria-labelledby="dropdownMenuIconButton1">
												<a class="dropdown-item" href="#">Today</a> <a class="dropdown-item" href="#">Yesterday</a>
											</div>
										</div>
									</div>
								</div>
								<div class="card-body no-gutter">
									<div class="list-item">
										<div class="preview-image">
											<img class="img-sm rounded-circle" src="../assets/images/faces/face10.jpg" alt="profile image">
										</div>
										<div class="content">
											<div class="d-flex align-items-center">
												<h6 class="product-name">Air Pod</h6>
												<small class="time ml-3 d-none d-sm-block">08.34 AM</small>
												<div class="ml-auto">
													<select id="review-rating-1" name="rating" autocomplete="off">
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
														<option value="5">5</option>
													</select>
												</div>
											</div>
											<div class="d-flex align-items-center">
												<p class="user-name">Christine :</p>
												<p class="review-text d-block">The brand apple is original !</p>
											</div>
										</div>
									</div>
									<div class="list-item">
										<div class="preview-image">
											<img class="img-sm rounded-circle" src="../assets/images/faces/face13.jpg" alt="profile image">
										</div>
										<div class="content">
											<div class="d-flex align-items-center">
												<h6 class="product-name">Macbook</h6>
												<small class="time ml-3 d-none d-sm-block">12.56 PM</small>
												<div class="ml-auto">
													<select id="review-rating-2" name="rating" autocomplete="off">
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
														<option value="5">5</option>
													</select>
												</div>
											</div>
											<div class="d-flex align-items-center">
												<p class="user-name">Arthur Cole :</p>
												<p class="review-text d-block">The brand apple is original also the iphone x.</p>
											</div>
										</div>
									</div>
									<div class="list-item">
										<div class="preview-image">
											<img class="img-sm rounded-circle" src="../assets/images/faces/face1.jpg" alt="profile image">
										</div>
										<div class="content">
											<div class="d-flex align-items-center">
												<h6 class="product-name">Apple watch</h6>
												<small class="time ml-3 d-none d-sm-block">09.24 AM</small>
												<div class="ml-auto">
													<select id="review-rating-3" name="rating" autocomplete="off">
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
														<option value="5">5</option>
													</select>
												</div>
											</div>
											<div class="d-flex align-items-center">
												<p class="user-name">James Tate :</p>
												<p class="review-text d-block">The brand apple is original.</p>
											</div>
										</div>
									</div>
									<div class="list-item">
										<div class="preview-image">
											<img class="img-sm rounded-circle" src="../assets/images/faces/face11.jpg" alt="profile image">
										</div>
										<div class="content">
											<div class="d-flex align-items-center">
												<h6 class="product-name">Homepod</h6>
												<small class="time ml-3 d-none d-sm-block">5.12 AM</small>
												<div class="ml-auto">
													<select id="review-rating-4" name="rating" autocomplete="off">
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
														<option value="5">5</option>
													</select>
												</div>
											</div>
											<div class="d-flex align-items-center">
												<p class="user-name">Clyde Parker :</p>
												<p class="review-text d-block">The brand apple is original also the iphone !!</p>
											</div>
										</div>
									</div>
									<div class="list-item">
										<div class="preview-image">
											<img class="img-sm rounded-circle" src="../assets/images/faces/face12.jpg" alt="profile image">
										</div>
										<div class="content">
											<div class="d-flex align-items-center">
												<h6 class="product-name">Imac</h6>
												<small class="time ml-3 d-none d-sm-block">10.00 AM</small>
												<div class="ml-auto">
													<select id="review-rating-5" name="rating" autocomplete="off">
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
														<option value="5">5</option>
													</select>
												</div>
											</div>
											<div class="d-flex align-items-center">
												<p class="user-name">James Tate :</p>
												<p class="review-text d-block">The brand apple is original.</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12 grid-margin">
							<div class="card">
								<div class="card-header header-sm">
									<div class="d-flex align-items-center">
										<h5 class="card-title">Recent Orders</h5>
										<div class="wrapper ml-auto action-bar">
											<div class="dropdown">
												<button class="btn btn-outline-secondary dropdown-toggle btn-sm" type="button" id="dropdownMenuOutlineButton1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Today</button>
												<div class="dropdown-menu" aria-labelledby="dropdownMenuOutlineButton1">
													<a class="dropdown-item" href="#">Today</a>
													<div class="dropdown-divider"></div>
													<a class="dropdown-item" href="#">Last 7 Days</a>
													<div class="dropdown-divider"></div>
													<a class="dropdown-item" href="#">This week</a>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="card-body">
									<table id="order-listing" class="table table-striped w-100">
										<thead>
											<tr>
												<th>#</th>
												<th>Product Name</th>
												<th>Customer</th>
												<th>Amount</th>
												<th>QTY</th>
												<th>Purchased On</th>
												<th>Status</th>
												<th>Track No</th>
											</tr>
										</thead>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- content-wrapper ends -->
				<!-- partial:partials/_footer.html -->
				<footer class="footer">
					<div class="container clearfix">
						<span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © 2019 <a href="http://www.bootstrapdash.com/" target="_blank">Bootstrapdash</a>. All rights reserved.
						</span> <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted & made with <i class="mdi mdi-heart text-danger"></i>
						</span>
					</div>
				</footer>
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<!-- plugins:js -->
	<script src="../assets/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<script src="../assets/vendors/chart.js/Chart.min.js"></script>
	<script src="../assets/vendors/jquery-bar-rating/jquery.barrating.min.js"></script>
	<script src="../assets/vendors/datatables.net/jquery.dataTables.js"></script>
	<script src="../assets/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="../assets/js/shared/off-canvas.js"></script>
	<script src="../assets/js/shared/hoverable-collapse.js"></script>
	<script src="../assets/js/shared/misc.js"></script>
	<script src="../assets/js/shared/settings.js"></script>
	<script src="../assets/js/shared/todolist.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page -->
	<script src="../assets/js/shared/widgets.js"></script>
	<script src="../assets/js/demo_11/dashboard.js"></script>
	<script src="../assets/js/demo_11/script.js"></script>
	<!-- End custom js for this page -->
</body>
</html>