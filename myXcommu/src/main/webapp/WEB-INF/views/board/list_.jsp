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

<link rel="stylesheet" type="text/css" href="/resources/assets/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
<title>myXcommu</title>
<!-- plugins:css -->

<%@ include file="../include/header.jsp"%>
<!-- partial -->
<div class="main-panel">	
	<div class="content-wrapper">
		<div class="row grid-margin">
			<div class="col-lg-12">
				<div class="card px-3">
					<div class="card-body">
						<i class="fa fa-camera-retro" style="color : #2196f3;"></i>
						<h4 class="card-title" style="display : inline-block; font-weight : bold;">사진게시판</h4>
						<div id="lightgallery-without-thumb" class="row lightGallery">
							<c:forEach items="${pictureList}" var="pictureList" varStatus="status" begin="0" end="4">
								<a href="/picture/view/${pictureList.picture_seq }" class="image-tile" style="max-width : 20%;"> 
									<img src="${pictureList.base64_code }" alt="image small" style="width : 200px; height : 200px;">
									<div style="display : inline-block; max-width : 20%; background-color: black; max-width: 100%; width: 200px; text-overflow:ellipsis; white-space: nowrap; overflow: hidden;">${pictureList.subject }</div>
								</a> 
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-6">
				<div class="row">
					<div class="col-md-12 grid-margin">
						<div class="card">
							<div class="card-body">
								<div class="row" style="overflow-x: auto;">
									<div style="min-width: 85%;">
										<h4 class="card-title" style="display : inline-block; font-weight: bold;">(구)게시판</h4>
									</div>
									<div style="display: grid; width: 10%; margin-left : 7px;">
										<button type="button" class="btn btn-light btn-sm" style="font-size: 5pt; height: 20px; padding-top: 5px;">
		                            		MORE<!--  <i class="fa fa-plus text-primary"></i> -->
	                            		</button>
                            		</div>	
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
								<div class="row" style="overflow-x: auto;">
									<div style="min-width: 85%;">
										<i class="fa fa-question-circle" style="color : #2196f3;"></i>
										<h4 class="card-title" style="display : inline-block; font-weight: bold;">질문게시판</h4>
									</div>
									<div style="display: grid; width: 10%; margin-left : 7px;">
										<button type="button" class="btn btn-light btn-sm" style="font-size: 5pt; height: 20px; padding-top: 5px;">
		                            		MORE<!--  <i class="fa fa-plus text-primary"></i> -->
	                            		</button>
                            		</div>	
									<table class="table table-hover"> 
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



<!-- <script type="text/javascript" charset="utf8" src="/resources/assets/js/jquery-1.12.4.min.js"></script> -->

<!-- <script type="text/javascript" charset="utf8" src="/resources/assets/js/dataTables/jquery.dataTables.js"></script> -->
<script type="text/javascript" charset="utf8" src="/resources/assets/js/shared/jquery-1.12.4.min.js"></script>
<script type="text/javascript" charset="utf8" src="/resources/assets/vendors/datatables.net/jquery.dataTables.js"></script>
<!-- <script src="../../../assets/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
    <script src="../../../assets/vendors/datatables.net-fixedcolumns/dataTables.fixedColumns.min.js"></script> -->
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