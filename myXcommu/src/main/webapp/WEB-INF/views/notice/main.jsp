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

<link rel="stylesheet" type="text/css" href="/resources/assets/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
<link rel="stylesheet" href="/resources/assets/vendors/datatables.net-fixedcolumns-bs4/fixedColumns.bootstrap4.min.css">
<title>myXcommu</title>
<!-- plugins:css -->

<%@ include file="../include/header.jsp"%>
<jsp:useBean id="currentDate" class="java.util.Date" />
<fmt:formatDate value="${currentDate}" pattern="MMdd" var="nowDate" />


<!-- partial -->
<div class="main-panel">
	<div class="content-wrapper">
		<!-- Page Title Header Ends-->
		<div class="row">
		
			<div class="col-lg-12 grid-margin stretch-card">
				
				<div class="card">
					<div class="card-body">
					
						
			
						<div class="col-12">
							<div class="page-header">
								<h4 class="page-title" style="font-weight: 1000;">공지사항</h4>
							</div>
						</div>
						
						<div class="col-12">
							<div class="alert alert-success" role="alert">
								<strong>알림!</strong> 공지사항 알림글 입니다.
							</div>
						</div>
						
						<table class="table table-hover" id="noticeBoardTable">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>글쓴이</th>
									<th>등록일</th>
									<th>조회</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${noticeList }" var="list">
									<tr>
										<td>${list.notice_seq }</td>										
										<td>
											<a href="/notice/view/${list.notice_seq }">
												<!-- <i class="fa fa-lock" style="margin-right : 5px;"></i> -->${list.subject }
												<%-- <c:if test="${list.reply_cnt != 0 }">
													<div style="display:inline-block; color: green; font-weight: bold;">
														[ ${list.reply_cnt } ]
													</div>
												</c:if> --%>
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
										<td>${list.view_cnt }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<sec:authentication property="principal" var="pinfo" />
							
						<!-- 작성자와 본인이 일치하지  않으면 수정과 삭제 버튼은 뜨지 않는다. -->
						<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
							
								<button type="button" onclick="location.href='/notice/register'"  class="btn btn-outline-primary btn-fw" style="float: right; margin-top : 10px;">
									글쓰기
								</button>	
						</sec:authorize>						
						
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
<script type="text/javascript" charset="utf8" src="/resources/assets/vendors/datatables.net/jquery.dataTables.js"></script>

<script src="/resources/assets/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
<script src="/resources/assets/vendors/datatables.net-fixedcolumns/dataTables.fixedColumns.min.js"></script>
<script>
$(document).ready(function() {
	$('#noticeBoardTable').DataTable({
		responsive : true,
		searching: true,
		ordering : false,
		bInfo : false,
		bLengthChange : false
	});
});
</script>
</body>
</html>