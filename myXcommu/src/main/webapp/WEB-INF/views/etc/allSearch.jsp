<!DOCTYPE html>
<html lang="ko">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<head>
<!-- Required meta tags -->

<style>
@import
	url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800')
	;

.content-wrapper {
	padding-bottom: 0px !important;
}

body {
	font-family: 'NanumGothic';
}

table.dataTable tbody td {
	padding-left: 20px !important;
}

table#pictureBoardTable tbody tr td {
	cursor: pointer;
}

table#pictureBoardTable tbody tr td:hover {
	background-color: lightgray;
}
</style>

<link rel="stylesheet" type="text/css" href="/resources/assets/js/dataTables/jquery.dataTables.css">
<title>myXcommu</title>
<!-- plugins:css -->

<%@ include file="../include/header.jsp"%>
<jsp:useBean id="currentDate" class="java.util.Date" />
<fmt:formatDate value="${currentDate}" pattern="MMdd" var="nowDate" />


<!-- partial -->
<div class="main-panel">

	<div class="content-wrapper">
		<!-- Page Title Header Starts-->
		<!-- Page Title Header Ends-->

		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-12">
								<form action="#">
									<div class="form-group d-flex">
										<input type="text" class="form-control" placeholder="Search Here" value="bootstrapdash">
										<button type="submit" class="btn btn-primary ml-3">Search</button>
									</div>
								</form>
							</div>
							<div class="col-12 mb-5">
								<h2>
									Search Result For <u class="ml-2">"bootstrapdash"</u>
								</h2>
								<p class="text-muted">About 12,100 results (0.52 seconds)</p>
							</div>
							<div class="col-12 results">
								<div class="pt-4 border-bottom">
									<a class="d-block h4 mb-0" href="#">bootstrapdash</a> <a class="page-url text-primary" href="#">https://www.bootstrapdash.com/</a>
									<p class="page-description mt-1 w-75 text-muted">bootstrapdash gives you the most beautiful, free and premium bootstrap admin dashboard templates and control panel themes based on Bootstrap 3 and 4.</p>
								</div>
							</div>
							<div class="col-12 results">
								<div class="pt-4 border-bottom">
									<a class="d-block h4 mb-0" href="#">bootstrapdash Team – Medium</a> <a class="page-url text-primary" href="#">https://medium.com/@bootstrapdash</a>
									<p class="page-description mt-1 w-75 text-muted">Read writing from bootstrapdash Team on Medium. We design and develop awesome admin dashboard templates with Bootstrap, so you can kick-start and speed up your development. www.bootstrapdash.com.</p>
								</div>
							</div>
							<div class="col-12 results">
								<div class="pt-4 border-bottom">
									<a class="d-block h4 mb-0" href="#">bootstrapdash · GitHub</a> <a class="page-url text-primary" href="#">https://github.com/bootstrapdash</a>
									<p class="page-description mt-1 w-75 text-muted">bootstrapdash has 1 repository available. Follow their code on GitHub.</p>
								</div>
							</div>
							<div class="col-12 results">
								<div class="pt-4 border-bottom">
									<a class="d-block h4 mb-0" href="#">bootstrapdash.com - Home | Facebook</a> <a class="page-url text-primary" href="#">https://www.facebook.com/bootstrapdash</a>
									<p class="page-description mt-1 w-75 text-muted">bootstrapdash.com. 9 likes · 4 talking about this. Clean, customisable admin dashboard template themes / UI WebApp Kits with a huge collection of...</p>
								</div>
							</div>
							<div class="col-12 results">
								<div class="pt-4 border-bottom">
									<a class="d-block h4 mb-0" href="#">bootstrapdash Team – Hacker Noon</a> <a class="page-url text-primary" href="#">https://hackernoon.com/@bootstrapdash</a>
									<p class="page-description mt-1 w-75 text-muted">Oct 9, 2017 - Read writing from bootstrapdash Team in Hacker Noon. We design and develop awesome admin dashboard templates with Bootstrap, so you can kick-start and speed up your development. www.bootstrapdash.com.</p>
								</div>
							</div>
							<div class="col-12 results">
								<div class="pt-4 border-bottom">
									<a class="d-block h4 mb-0" href="#">bootstrapdash | Crunchbase</a> <a class="page-url text-primary" href="#">https://www.crunchbase.com/organization/bootstrapdash</a>
									<p class="page-description mt-1 w-75 text-muted">bootstrapdash creates quality admin templates that are based on Bootstrap, the most popular front end development framework.</p>
								</div>
							</div>
							<div class="col-12 results">
								<div class="pt-4 border-bottom">
									<a class="d-block h4 mb-0" href="#">bootstrapdash.com (@bootstrapdash) | Twitter</a> <a class="page-url text-primary" href="#">https://twitter.com/@bootstrapdash</a>
									<p class="page-description mt-1 w-75 text-muted">The latest Tweets from bootstrapdash.com (@bootstrapdash). Clean, customisable admin dashboard template themes / UI WebApp Kits with a huge collection of pre-built widgets and plugins.</p>
								</div>
							</div>
							<div class="col-12 results">
								<div class="pt-4 border-bottom">
									<a class="d-block h4 mb-0" href="#">Bootstrap Dash on Behance</a> <a class="page-url text-primary" href="#">https://www.behance.net/bootstrapdash</a>
									<p class="page-description mt-1 w-75 text-muted">Awesome Bootstrap Admin Dashboard Templates. For Faster, Easier Web Applications Development. Clean, customizable admin dashboard template theme / UI WebApp Kit with a huge collection of pre-built widgets and plugins. Design and build modern, robust, user-friendly web applications real fast!</p>
								</div>
							</div>
							<nav class="col-12" aria-label="Page navigation">
								<ul class="pagination mt-5">
									<li class="page-item"><a class="page-link" href="#">Previous</a></li>
									<li class="page-item  active"><a class="page-link" href="#">1</a></li>
									<li class="page-item"><a class="page-link" href="#">2</a></li>
									<li class="page-item"><a class="page-link" href="#">3</a></li>
									<li class="page-item"><a class="page-link" href="#">Next</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>




	<!-- content-wrapper ends -->
	<!-- partial:partials/_footer.html -->
	<footer class="footer">
		<div class="container-fluid clearfix">
			<span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © 2019 <a href="http://www.bootstrapdash.com/" target="_blank">Bootstrapdash</a>. All rights reserved.
			</span> <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted & made with <i class="mdi mdi-heart text-danger"></i>
			</span>
		</div>
	</footer>
	<!-- partial -->
</div>
<!-- main-panel ends -->
<%@ include file="../include/footer.jsp"%>



<script type="text/javascript" charset="utf8" src="/resources/assets/js/shared/jquery-1.12.4.min.js"></script>
<script type="text/javascript" charset="utf8" src="/resources/assets/js/dataTables/jquery.dataTables.js"></script>
<script>
	$(document).ready(function() {
		$('#questionBoardTable').DataTable({
			responsive : true,
			searching : false,
			ordering : false,
			bInfo : false,
			bLengthChange : false
		});
	});
</script>
</body>
</html>