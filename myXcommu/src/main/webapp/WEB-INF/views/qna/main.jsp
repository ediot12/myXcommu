<!DOCTYPE html>
<html lang="ko">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<head>
<!-- Required meta tags -->

<style>
body {
	font-family: 'NanumGothic';
}

table.dataTable tbody td {
	padding-left: 15px !important;
}


table.dataTable tbody td:nth-child(7),table.dataTable tbody td:nth-child(8)  {
	padding-right : 15px!important;
    text-align: right;
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
<div class="content-wrapper">
	<!-- Page Title Header Ends-->
	<div class="row">

		<div class="col-lg-12 grid-margin stretch-card">

			<div class="card">
				<div class="card-body">



					<div class="col-12">
						<div class="page-header">
							<h4 class="page-title" style="font-weight: 1000;">질문게시판</h4>
						</div>
					</div>

					<div class="col-12">
						<div class="alert alert-success" role="alert">
							<strong>알림!</strong> 질문과 답변을 위한 게시판입니다.
						</div>
					</div>

					<table class="table table-hover" id="questionBoardTable" style="width : 100%;">
						<thead>
							<tr>
								<th>번호</th>
								<th>구분</th>
								<th>상태</th>
								<th>제목</th>
								<th>글쓴이</th>
								<th>등록일</th>
								<th>조회</th>
								<th>추천</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list }" var="list">
								<tr>
									<td>${list.qna_board_seq }</td>
									<td>
										<c:if test='${list.division == "질문유형1"}'>
											<label class="badge badge-primary"> 질문유형 1 </label>
										</c:if>
										<c:if test='${list.division == "질문유형2"}'>
											<label class="badge badge-info"> 질문유형 2 </label>
										</c:if>
									</td>
									<td>
										<c:if test="${list.status == 'N' }">
											<label class="badge badge-danger" style="font-size: 10pt;"> 해결중 </label>
										</c:if>
										<c:if test="${list.status == 'Y' }">
											<label class="badge badge-success" style="font-size: 10pt;"> 해결완료 </label>
										</c:if>
									</td>
									<td>
										<c:if test="${list.status == 'N' }">
											<c:choose>
												<c:when test="${list.report_cnt > 2 }">
													<a href="/qna/view/${list.qna_board_seq }">
													<i class="fa fa-exclamation-circle" style=" color: red;"></i>
												</c:when>
												<c:otherwise>
													<a href="/qna/view/${list.qna_board_seq }">
												</c:otherwise>
											</c:choose>	
												${list.subject } 
												<c:if test="${list.reply_cnt != 0 }">
													<div style="display: inline-block; color: green; font-weight: bold;">[ ${list.reply_cnt } ]</div>
												</c:if>
											</a>
										</c:if>
										<c:if test="${list.status == 'Y' }">
											<c:choose>
												<c:when test="${list.report_cnt > 2 }">
													<a href="/qna/view/${list.qna_board_seq }" style="color : gray; text-decoration: line-through;">
													<i class="fa fa-exclamation-circle" style=" color: red;"></i>
												</c:when>
												<c:otherwise>
													<a href="/qna/view/${list.qna_board_seq }"  style="color : gray; text-decoration: line-through;">
												</c:otherwise>
											</c:choose>	
											
												${list.subject } 
												<c:if test="${list.reply_cnt != 0 }">
													<div style="display: inline-block; color: green; font-weight: bold;">[ ${list.reply_cnt } ]</div>
												</c:if>
											</a>
										</c:if>
										
									</td>
									<td>${list.writer }</td>
									<td>
										<fmt:formatDate value="${list.regdate }" pattern="HH:mm" var="todayRegiDate" />
										<fmt:formatDate value="${list.regdate }" pattern="MMdd" var="regiDate" />
										<fmt:formatDate value="${list.regdate }" pattern="yy.MM.dd" var="markDate" />
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
									<td>${list.recommand_cnt }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<button type="button" onclick="location.href='/qna/register'" class="btn btn-outline-primary btn-fw" style="float: right; margin-top: 10px;"><i class="fa fa-pencil"></i>글쓰기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- main-panel ends -->
<%@ include file="../include/footer.jsp"%>



<script type="text/javascript" charset="utf8" src="/resources/assets/js/shared/jquery-1.12.4.min.js"></script>
<script type="text/javascript" charset="utf8" src="/resources/assets/vendors/datatables.net/jquery.dataTables.js"></script>

<script src="/resources/assets/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
<script src="/resources/assets/vendors/datatables.net-fixedcolumns/dataTables.fixedColumns.min.js"></script>
<script>
	$(document).ready(function() {
		$('#questionBoardTable').DataTable({
			responsive : true,
			searching : true,
			ordering : false,
			bInfo : false,
			bLengthChange : false,
			"columns": [
			    { "width": "5%" },
			    { "width": "5%" },
			    { "width": "5%" },
			    { "width": "65%" },
			    { "width": "5%" },
			    { "width": "5%" },
			    { "width": "5%" },
			    { "width": "5%" }			    
			  ]
		});
	});
</script>
</body>
</html>