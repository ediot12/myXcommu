<!DOCTYPE html>
<html lang="ko">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<head>
<!-- Required meta tags -->

<style>

table.dataTable tbody td {
	padding-left: 20px !important;
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
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-12">
								<form action="#">
									<div class="form-group d-flex">
										<input type="text" class="form-control" placeholder="Search Here" value="bootstrapdash">
										<button type="button" class="btn btn-primary ml-3">Search</button>
									</div>
								</form>
							</div>
							<div class="col-12 mb-5">
								<h2>
									Search Result For <u class="ml-2">"${searchWord }"</u>
								</h2>
								<p class="text-muted">About ${fn:length(searchList)} results (0.52 seconds)</p>
							</div>
							<table id="searchBoardTable" class="table" style="table-layout : fixed;">
							
								<c:if test="${fn:length(searchList) > 0 }">
									<c:forEach items="${searchList }" var="list">
										<fmt:formatDate value="${list.regdate }" pattern="yyyy-MM-dd HH:mm" var="boardRegiDate"/>
										<c:if test="${list.board_type == 5}" >
											<c:set var="link_name" value="notice/view"/>
											<c:set var="typeName" value="공지사항"/>
											<c:set var="badgeClass" value="badge badge-inverse-danger ml-auto"/>
										</c:if>
										<c:if test="${list.board_type == 4}" >
											<c:set var="link_name" value="proposal/view"/>
											<c:set var="typeName" value="건의게시판"/>
											<c:set var="badgeClass" value="badge badge-inverse-primary ml-auto"/>
										</c:if>
										<c:if test="${list.board_type == 3}" >
											<c:set var="link_name" value="picture/view"/>
											<c:set var="typeName" value="사진게시판"/>
											<c:set var="badgeClass" value="badge badge-inverse-success ml-auto"/>
										</c:if>
										<c:if test="${list.board_type == 2}" >
											<c:set var="link_name" value="qna/view"/>
											<c:set var="typeName" value="질문게시판"/>
											<c:set var="badgeClass" value="badge badge-inverse-warning ml-auto"/>
										</c:if>
										<tr>
											<td>
												<div class="col-12 results">
													<div class="pt-4">
														<a class="d-block h4 mb-0" href="/${link_name }/${list.board_seq}">${list.subject }</a> 
														<p class="page-url text-primary">
															<div class="${badgeClass }" style="display : inline-block;">${typeName}</div>
															|| ${list.writer} || 조회수 ${list.view_cnt} || ${boardRegiDate }</p>
														<p class="page-description mt-1 text-muted" style="overflow: hidden; text-overflow: ellipsis;  white-space: nowrap;">
															${list.content }
														</p>
													</div>
												</div>
											</td>									
										</tr>
									</c:forEach>
								</c:if>
								
								<c:if test="${fn:length(searchList) == 0  }">
									검색결과가없다.
								</c:if>
							
							</table>
							
							<!-- <div class="col-12 results">
								<div class="pt-4 border-bottom">
									<a class="d-block h4 mb-0" href="#">bootstrapdash</a> <a class="page-url text-primary" href="#">https://www.bootstrapdash.com/</a>
									<p class="page-description mt-1 w-75 text-muted">bootstrapdash gives you the most beautiful, free and premium bootstrap admin dashboard templates and control panel themes based on Bootstrap 3 and 4.</p>
								</div>
							</div> -->
							
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
<!-- main-panel ends -->
<%@ include file="../include/footer.jsp"%>



<script type="text/javascript" charset="utf8" src="/resources/assets/js/shared/jquery-1.12.4.min.js"></script>
<script type="text/javascript" charset="utf8" src="/resources/assets/js/dataTables/jquery.dataTables.js"></script>
<script>
	$(document).ready(function() {
		$('#searchBoardTable').DataTable({
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