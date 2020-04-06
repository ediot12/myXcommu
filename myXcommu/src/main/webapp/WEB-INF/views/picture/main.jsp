<!DOCTYPE html>
<html lang="ko">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<head>
<!-- Required meta tags -->

<style>
table.dataTable tbody td {
	padding-left: 20px !important;
}

table#pictureBoardTable tbody tr td {
	cursor: pointer;
}

table#pictureBoardTable tbody tr td:hover {
	background-color: lightgray;

}


div.innerBoard:hover{
	cursor : pointer;
	opacity : 0.7;
}
</style>

<link rel="stylesheet" type="text/css" href="/resources/assets/js/dataTables/jquery.dataTables.css">
<title>myXcommu</title>
<!-- plugins:css -->

<%@ include file="../include/header.jsp"%>
<jsp:useBean id="currentDate" class="java.util.Date" />
<fmt:formatDate value="${currentDate}" pattern="MMdd" var="nowDate" />


<!-- partial -->
<div class="content-wrapper">
	<!-- Page Title Header Starts-->
	<!-- Page Title Header Ends-->
	<div class="row">
		<div class="col-lg-12 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">

					<div class="row">
						<div class="col-12">
							<div class="page-header">
								<h4 class="page-title" style="font-weight: 1000;">사진게시판</h4>
							</div>
						</div>

						<div class="col-12">
							<div class="alert alert-success" role="alert">
								<strong>알림!</strong> 의도와 맞지 않은 이미지는 올리지 마세요.
							</div>
						</div>
						<!-- <h4 class="card-title">Basic Table</h4> -->
						<table class="table" id="pictureBoardTable">
							<thead>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
							</thead>
							<tbody>
								<c:forEach items="${pictureList}" var="pictureList" varStatus="status">
									<%-- <fmt:formatDate value="${pictureList.regdate}" pattern="yy-MM-dd" var="regDate" />
									
									<c:if test="${status.count % 5 == 1 }">
										<tr>
									</c:if>

									<td style="border: 1px solid #A9D0F5; width: 175px;" onclick="location.href='view/${pictureList.picture_seq}';">
										<div style="vertical-align: top; height: 130px; text-align: center;">
											<img src="${pictureList.base64_code }" style="width: 120px; height: 130px;">
										</div>
										<div style="vertical-align: bottom; height: 15px; font-weight: bold;">${pictureList.subject }
											<c:if test="${pictureList.reply_cnt != 0 }">
												<div style="color: green; font-weight: bold; display: inline-block;">[ ${pictureList.reply_cnt } ]</div>
											</c:if>
										</div>
										<div style="vertical-align: bottom; height: 15px; color: #A4A4A4;">
											<div style="display: inline-block;">조회 수 ${pictureList.view_cnt }</div>
											<div style="display: inline-block; margin-left: 5px;">|| ${regDate}</div>
										</div>
										<div style="vertical-align: bottom; height: 15px;">${pictureList.writer }</div>
									</td>

									<c:if test="${status.count % 5 == 0 }">

										</tr>
									</c:if> --%>
									
									<c:if test="${status.count % 3 == 1 }">
										<tr>
									</c:if>
									<fmt:formatDate value="${pictureList.regdate }" pattern="yyyy-MM-dd HH:mm" var="regiDate"/>
									<div class="col-md-4 grid-margin stretch-card innerBoard" onclick="location.href='/picture/view/${pictureList.picture_seq}'">
										<div class="card">
											<img class="card-img-top" src="${pictureList.base64_code }" alt="card images" style="width : 350px; height : 215px;">
											<div class="card-body pb-0">
												<p class="text-muted">${pictureList.subject }</p>
												<h5>${pictureList.convert_content }</h5>
												<div class="d-flex align-items-center justify-content-between text-muted border-top py-3 mt-3">
													<p class="mb-0">Published on ${regiDate}</p>
													<div class="wrapper d-flex align-items-center">
														<small class="mr-2">${pictureList.recommand_cnt }</small> <i class="mdi mdi-heart-outline"></i>
													</div>
												</div>
											</div>
										</div>
									</div>

									<c:if test="${status.count % 3 == 0 }">

										</tr>
									</c:if>

								</c:forEach>
							</tbody>
						</table>

						<button type="button" onclick="location.href='/picture/register'" class="btn btn-outline-primary btn-fw" style="float: right; margin-top: 10px;">글쓰기</button>
					</div>
				</div>
			</div>





		</div>
	</div>
</div>
<!-- main-panel ends -->
<%@ include file="../include/footer.jsp"%>



<script type="text/javascript" charset="utf8" src="/resources/assets/js/jquery-1.12.4.min.js"></script>
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