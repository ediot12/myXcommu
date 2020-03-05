<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<head>
<!-- Required meta tags -->

<style>
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800');
.content-wrapper {
	padding-bottom: 0px !important;
}

#mainListTable_wrapper {
	width: 100%;
}

table thead th {
	font-weight : bold!important;
}
</style>

<link rel="stylesheet" type="text/css" href="/resources/assets/js/dataTables/jquery.dataTables.css">
<title>myXcommu</title>
<!-- plugins:css -->

<%@ include file="../include/header.jsp"%>
<!-- partial -->
<div class="main-panel">
	<div class="content-wrapper">
		<!-- Page Title Header Starts-->
		<div class="row page-title-header">
			<div class="col-12">
				<div class="page-header">
					<h4 class="page-title">야</h4>
					<div class="quick-link-wrapper w-100 d-md-flex flex-md-wrap">
						<ul class="quick-links">
							<li><a href="#">Link 1</a></li>
							<li><a href="#">Link 2</a></li>
							<li><a href="#">Link 3</a></li>
						</ul>
						<ul class="quick-links ml-auto">
							<li><a href="#">Link 4</a></li>
							<li><a href="#">Link 5</a></li>
							<li><a href="#">Link 6</a></li>
						</ul>
					</div>
				</div>
			</div>

		</div>
		<!-- Page Title Header Ends-->
		<div class="row">
			<div class="col-md-12 grid-margin">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-lg-3 col-md-6">
								<div class="d-flex">
									<div class="wrapper">
										<h3 class="mb-0 font-weight-semibold">32,451</h3>
										<h5 class="mb-0 font-weight-medium text-primary">방문자수</h5>
										<p class="mb-0 text-muted">+14.00(+0.50%)</p>
									</div>
									<div class="wrapper my-auto ml-auto ml-lg-4">
										<canvas height="50" width="100" id="stats-line-graph-1"></canvas>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6 mt-md-0 mt-4">
								<div class="d-flex">
									<div class="wrapper">
										<h3 class="mb-0 font-weight-semibold">15,236</h3>
										<h5 class="mb-0 font-weight-medium text-primary">Impressions</h5>
										<p class="mb-0 text-muted">+138.97(+0.54%)</p>
									</div>
									<div class="wrapper my-auto ml-auto ml-lg-4">
										<canvas height="50" width="100" id="stats-line-graph-2"></canvas>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6 mt-md-0 mt-4">
								<div class="d-flex">
									<div class="wrapper">
										<h3 class="mb-0 font-weight-semibold">7,688</h3>
										<h5 class="mb-0 font-weight-medium text-primary">Conversation</h5>
										<p class="mb-0 text-muted">+57.62(+0.76%)</p>
									</div>
									<div class="wrapper my-auto ml-auto ml-lg-4">
										<canvas height="50" width="100" id="stats-line-graph-3"></canvas>
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6 mt-md-0 mt-4">
								<div class="d-flex">
									<div class="wrapper">
										<h3 class="mb-0 font-weight-semibold">1,553</h3>
										<h5 class="mb-0 font-weight-medium text-primary">Downloads</h5>
										<p class="mb-0 text-muted">+138.97(+0.54%)</p>
									</div>
									<div class="wrapper my-auto ml-auto ml-lg-4">
										<canvas height="50" width="100" id="stats-line-graph-4"></canvas>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="content-wrapper">
		<div class="row">
			<div class="col-md-6">
				<div class="row">
					<div class="col-md-12 grid-margin">
						<div class="card">
							<div class="card-body">
								<div class="row">
									<h4 class="card-title" style="font-family: 'NanumGothic sans-serif'; font-weight: bold;">(구)게시판</h4>
									<table width="100%" class="table table-hover" id="mainListTable">
										<thead>
											<tr>
												<th>#번호</th>
												<th>제목</th>
												<th>작성자</th>
												<th>작성일</th>
												<th>수정일</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${list }" var="board">
												<tr>
													<td>
														<c:out value="${board.bno }" />
													</td>
													<td>
														<a class="move" href=get?bno=<c:out value="${board.bno}"/>><c:out value="${board.title}" /> <b> [ <c:out value="${board.replyCnt }" /> ]
														</b> </a>
													</td>
													<td>
														<c:out value="${board.writer }" />
													</td>
													<td>
														<fmt:formatDate pattern="yyyy-MM-dd" value="${board.regDate }" />
													</td>
													<td>
														<fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate }" />
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="row">
					<div class="col-md-12 grid-margin">
						<div class="card">
							<div class="card-body">
								<div class="row">
									<h4 class="card-title" style="font-family: 'NanumGothic sans-serif'; font-weight: bold;">질문게시판 Top 5</h4>
									<table class="table"> 
										<thead>
											<th>구분</th>
											<th>상태</th>
											<th>제목</th>
											<th>글쓴이</th>
											<th>추천</th>										
										</thead>
										<tbody>
											<c:forEach items="${questionList }" var="questionList" begin="0" end="4">
												<tr>
													<td>
													<c:if test='${questionList.division == "질문유형1"}'>
														<label class="badge badge-danger">
															질문유형 1
														</label>
													</c:if>
													<c:if test='${questionList.division == "질문유형2"}'>
														<label class="badge badge-success">
															질문유형 2
														</label>
													</c:if>
													</td>
													<td>
														<c:if test="${questionList.status == 'N' }">
															<label class="badge badge-danger">
																해결중
															</label>
														</c:if>
														<c:if test="${questionList.status == 'Y' }">
															<label class="badge badge-success">
																해결완료
															</label>
														</c:if>
													</td>
													<td>
														<a href="/qna/view/${questionList.qna_board_seq }">
															${questionList.subject }
															<c:if test="${questionList.reply_cnt != 0 }">
																<div style="display:inline-block; color: green; font-weight: bold;">
																	[ ${questionList.reply_cnt } ]
																</div>
															</c:if>
														</a>
													</td>
													<td>${questionList.writer }</td>
													<td>${questionList.recommand_cnt }</td>
												</tr>
											</c:forEach>
										</tbody>
										
									</table>
								</div>
							</div>
						</div>
					</div>


					<div class="col-md-12 grid-margin">
						<div class="card">
							<div class="card-body">
								<div class="row">
									<h4 class="card-title" style="font-family: 'NanumGothic sans-serif'; font-weight: bold;">사진게시판 Top 5</h4>
									<table class="table">
										<tr>
											<td style="border : 1px solid black;"> </td>
											<td style="border : 1px solid black;"> </td>
											<td style="border : 1px solid black;"> </td>
											<td style="border : 1px solid black;"> </td>
											<td style="border : 1px solid black;"> </td>
											
										</tr>
									</table>
								</div>
							</div>
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



<script type="text/javascript" charset="utf8" src="/resources/assets/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" charset="utf8" src="/resources/assets/js/dataTables/jquery.dataTables.js"></script>
<script>
	$(document).ready(function() {
		$('#mainListTable').DataTable({
			responsive : true,
			searching: false,
			ordering : false,
			bInfo : false,
			bLengthChange : false,
			paging : false
		});
	});
</script>
</body>
</html>