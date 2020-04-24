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


<link rel="stylesheet" type="text/css" href="/resources/assets/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
<link rel="stylesheet" href="/resources/assets/vendors/datatables.net-fixedcolumns-bs4/fixedColumns.bootstrap4.min.css">
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
						
								<c:forEach items="${pictureList}" var="pictureList" varStatus="status">																		
									<c:if test="${status.count % 3 == 1 }">
									
									</c:if>
									<fmt:formatDate value="${pictureList.regdate }" pattern="yyyy-MM-dd HH:mm" var="regiDate"/>
									<div class="col-md-4 grid-margin stretch-card innerBoard" onclick="location.href='/picture/view/${pictureList.picture_seq}'">
										<div class="card">
											<img class="card-img-top" src="${pictureList.base64_code }" alt="card images" style="width : 350px; height : 215px;">
											<div class="card-body pb-0">
												<p class="text-muted" style="display : inline-block; margin-right: 5px;">
													${pictureList.subject }
													<c:if test="${pictureList.reply_cnt != 0 }">
														<div style="display: inline-block; color: green; font-weight: bold; font-size : 10pt;">[ ${pictureList.reply_cnt } ]</div>
													</c:if>
												</p>
												<h5>${pictureList.convert_content }</h5>
												<div class="d-flex align-items-center justify-content-between text-muted border-top py-3 mt-3">
													<div style="margin-bottom: 0 !important; font-family: 'roboto', 'sans-serif'; font-size: 0.875rem; width: 45%; ">${pictureList.writer }</div>
													<div style="margin-bottom: 0 !important; font-family: 'roboto', 'sans-serif'; font-size: 0.875rem; width: 45%; text-align: right; margin-right: 5px;">${regiDate}</div>
													<div class="wrapper d-flex align-items-center">
														<i class="mdi mdi-heart-outline" style="color : red;"></i><small class="mr-2" style="margin-left : 5px;">${pictureList.recommand_cnt }</small> 
													</div>
												</div>
											</div>
										</div>
									</div>

									<c:if test="${status.count % 3 == 0 }">

									</c:if>

								</c:forEach>
					</div>
					
					<div class="row">
						<button type="button" onclick="location.href='/picture/register'" class="btn btn-outline-primary btn-fw" style="float: right; margin-top: 10px;"><i class="fa fa-pencil"></i>글쓰기</button>
					</div>
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
		
		
		setTimeout(function() {
			  
			
			
			
			}, 3000);
		
		/* $('#pictureBoardTable').DataTable({
			responsive : true,
			searching : false,
			ordering : false,
			bInfo : false,
			bLengthChange : false
		}); */
		
		
	});
</script>
</body>
</html>