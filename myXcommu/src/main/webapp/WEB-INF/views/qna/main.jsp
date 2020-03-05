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
					<h4 class="page-title" style="font-weight: 1000;">질문게시판</h4>
					<div class="quick-link-wrapper w-8 d-md-flex flex-md-wrap" style="margin-left: 10px; margin-top: 5px;">궁금한것을 자유롭게 올려주세요.</div>
				</div>
			</div>

		</div>
		<!-- Page Title Header Ends-->
		<div class="row">
			<div class="col-lg-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">Basic Table</h4>
						<table class="table table-hover" id="questionBoardTable">
							<thead>
								<tr>
									<th>번호</th>
									<th>구분</th>
									<th>상태</th>
									<th>제목</th>
									<th>글쓴이</th>
									<th>등록일</th>
									<th>추천</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var="list">
									<tr>
										<td>${list.qna_board_seq }</td>
										<td>
											<c:if test='${list.division == "질문유형1"}'>
												<label class="badge badge-danger">
													질문유형 1
												</label>
											</c:if>
											<c:if test='${list.division == "질문유형2"}'>
												<label class="badge badge-success">
													질문유형 2
												</label>
											</c:if>
										</td>
										<td>
											<c:if test="${list.status == 'N' }">
												<label class="badge badge-danger" style="font-size : 10pt;">
													해결중
												</label>
											</c:if>
											<c:if test="${list.status == 'Y' }">
												<label class="badge badge-success" style="font-size : 10pt;">
													해결완료
												</label>
											</c:if>
										</td>
										<td>
											<a href="/qna/view/${list.qna_board_seq }">
												${list.subject }
												<c:if test="${list.reply_cnt != 0 }">
													<div style="display:inline-block; color: green; font-weight: bold;">
														[ ${list.reply_cnt } ]
													</div>
												</c:if>
											</a>
										</td>
										<td>${list.writer }</td>
										<td>
											<fmt:formatDate value="${list.regdate }" pattern="HH:mm" var="todayRegiDate"/>
											<fmt:formatDate value="${list.regdate }" pattern="MMdd" var="regiDate"/>
											<fmt:formatDate value="${list.regdate }" pattern="yy.MM.dd" var="markDate"/>
											<c:choose>
												<c:when test="${nowDate != regiDate }">
													${markDate }
												</c:when>
												<c:otherwise>
													${todayRegiDate }
												</c:otherwise>
											</c:choose>
										</td>
										<td>${list.recommand_cnt }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<button type="button" onclick="location.href='/qna/register'"  class="btn btn-outline-primary btn-fw" style="float: right; margin-top : 10px;">
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