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

table.dataTable tbody td{
	padding-left : 20px!important;
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
		<div class="row page-title-header">
			<div class="col-12">
				<div class="page-header">
					<h4 class="page-title" style="font-weight: 1000;">사진게시판</h4>
					<div class="quick-link-wrapper w-8 d-md-flex flex-md-wrap" style="margin-left: 10px; margin-top: 5px;">올리고 싶은 사진을 올려주세요.</div>
				</div>
			</div>

		</div>
		<!-- Page Title Header Ends-->
		<div class="row">
			<div class="col-lg-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<!-- <h4 class="card-title">Basic Table</h4> -->
						<table class="table" id="pictureBoardTable">
							<tr style="height : 150px;">
								<td style="border : 1px solid black; width : 150px;">
									<div style="vertical-align : top; background-color : pink; height : 75px;">썸네일 영역</div>
									<div style="vertical-align : bottom; background-color : skyblue; height : 75px;">텍스트 영역</div>
								</td>
								<td style="border : 1px solid black; width : 150px;"></td>
								<td style="border : 1px solid black; width : 150px;"></td>
								<td style="border : 1px solid black; width : 150px;"></td>
								<td style="border : 1px solid black; width : 150px;"></td>
							</tr>
							<tr style="height : 150px;">
								<td style="border : 1px solid black; width : 150px;"></td>
								<td style="border : 1px solid black; width : 150px;"></td>
								<td style="border : 1px solid black; width : 150px;"></td>
								<td style="border : 1px solid black; width : 150px;"></td>
								<td style="border : 1px solid black; width : 150px;"></td>
							</tr>
							<tr style="height : 150px;">
								<td style="border : 1px solid black; width : 150px;"></td>
								<td style="border : 1px solid black; width : 150px;"></td>
								<td style="border : 1px solid black; width : 150px;"></td>
								<td style="border : 1px solid black; width : 150px;"></td>
								<td style="border : 1px solid black; width : 150px;"></td>
							</tr>
						</table>

						<button type="button" onclick="location.href='/picture/register'"  class="btn btn-outline-primary btn-fw" style="float: right; margin-top : 10px;">
							글쓰기
						</button>
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



<script type="text/javascript" charset="utf8" src="/resources/assets/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" charset="utf8" src="/resources/assets/js/dataTables/jquery.dataTables.js"></script>
<script>
$(document).ready(function() {
	$('#questionBoardTable').DataTable({
		responsive : true,
		searching: false,
		ordering : false,
		bInfo : false,
		bLengthChange : false
	});
});
</script>
</body>
</html>