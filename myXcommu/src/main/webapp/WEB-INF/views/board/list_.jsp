<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<head>
<style>
i.customColor{
	color : #A4A4A4;
}


div.innerBoard:hover{
	cursor : pointer;
	opacity : 0.7;
}

</style>
<title>myXcommu</title>
<!-- plugins:css -->

<%@ include file="../include/header.jsp"%>
<!-- partial -->
<div class="content-wrapper">
<jsp:useBean id="currentDate" class="java.util.Date" />
<fmt:formatDate value="${currentDate}" pattern="MMdd" var="nowDate" />
	<%-- <div class="row grid-margin">
		<div class="col-lg-12">
			<div class="card px-3">
				<div class="card-body">
					<div class="row">
						<div clas="col-12">
							<div class="row portfolio-grid">
								<c:forEach items="${pictureList}" var="pictureList" varStatus="status" begin="0" end="3">
									<div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 col-12">
										<figure class="effect-text-in" style="max-width: 200px;">
											<img src="${pictureList.base64_code }" alt="image" style="width: 200px; height: 200px;">
											<figcaption>
												<h4>${pictureList.subject }</h4>
												<p>${pictureList.content }</p>
											</figcaption>
										</figure>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> --%>

	<%-- <div class="row grid-margin">
		<div class="col-lg-12">
			<div class="card px-3">
				<div class="card-body">
					<h4 class="card-title">Without Thumbnails</h4>
					<div id="lightgallery-without-thumb" class="row portfolio-grid">
						<c:forEach items="${pictureList}" var="pictureList" varStatus="status" begin="0" end="3">
							<figure class="effect-text-in" style="max-width: 250px; margin-right: 12px;">
								<img src="${pictureList.base64_code }" alt="image small" style="width : 250px; height : 250px;">
							<figcaption>
									<h4>${pictureList.subject }</h4>
									<p>${pictureList.content }</p>
								</figcaption>
							</figure>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div> --%>

	<div class="row">
		<c:forEach items="${pictureList}" var="pictureList" varStatus="status" begin="0" end="2">
			<fmt:formatDate value="${pictureList.regdate }" pattern="yyyy-MM-dd HH:mm" var="regiDate"/>
			<div class="col-md-4 grid-margin stretch-card innerBoard" onclick="location.href='/picture/view/${pictureList.picture_seq}'">
				<div class="card">
					<img class="card-img-top" src="${pictureList.base64_code }" alt="card images" style="width : 353px; height : 215px;">
					<div class="card-body pb-0">
						<p class="text-muted">${pictureList.subject }</p>
						<h5>${pictureList.convert_content }</h5>
						<div class="d-flex align-items-center justify-content-between text-muted border-top py-3 mt-3">
							<div style="margin-bottom: 0 !important; font-family: 'roboto', 'sans-serif'; font-size: 0.875rem; width: 45%; ">${pictureList.writer }</div>
							<div style="margin-bottom: 0 !important; font-family: 'roboto', 'sans-serif'; font-size: 0.875rem; width: 45%; text-align: right; margin-right: 5px;">${regiDate}</div>
							<div class="wrapper d-flex align-items-center">
								<i class="mdi mdi-heart-outline"></i><small class="mr-2" style="margin-left : 5px;">${pictureList.recommand_cnt }</small> 
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

	<div class="row">
		<div class="col-md-6">
			<div class="row">
				<div class="col-md-12 grid-margin">
					<div class="card">
						<div class="card-body">
							<div class="row" style="overflow-x: auto;">
								<div style="min-width: 85%;">
									<h4 class="card-title" style="display: inline-block; font-weight: bold; margin-left: 10px;">
										<i class="fa fa-exclamation-circle" style="color: #2196f3; margin-right: 5px; font-size: 12pt;"></i>공지사항
									</h4>
								</div>
								<div style="display: grid; width: 10%; margin-left: 7px;">
									<button type="button" class="btn btn-dark btn-sm" style="font-size: 5pt; height: 20px; padding-top: 5px;" onclick="location.href='/notice/main'">
										MORE
										<!--  <i class="fa fa-plus text-primary"></i> -->
									</button>
								</div>
								<table width="100%" class="table table-hover" style="table-layout: fixed;">
									<tbody>
										<c:forEach items="${noticeList }" var="noticeList" begin="0" end="4">
											<fmt:formatDate value="${noticeList.regdate }" pattern="HH:mm" var="todayRegiDate"/>
											<fmt:formatDate value="${noticeList.regdate }" pattern="MMdd" var="regiDate"/>
											<fmt:formatDate value="${noticeList.regdate }" pattern="MM.dd" var="markDate"/>
											<tr>
												<td>
													<a class="move" style="color : black;" href=/notice/view/<c:out value="${noticeList.notice_seq}"/>><i class="fa fa-angle-double-right customColor" style="margin-right : 5px;"></i><c:out value="${noticeList.subject}" /></a>
												</td>
												<td style="width : 70px;">
													<c:choose>
													<c:when test="${nowDate != regiDate }">
														${markDate }
													</c:when>
													<c:otherwise>
														${todayRegiDate }
													</c:otherwise>
												</c:choose>
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
									<h4 class="card-title" style="display: inline-block; font-weight: bold; margin-left: 10px;">
										<i class="fa fa-question-circle" style="color: #2196f3;"></i>
									질문게시판</h4>
								</div>
								<div style="display: grid; width: 10%; margin-left: 7px;">
									<button type="button" class="btn btn-dark btn-sm" style="font-size: 5pt; height: 20px; padding-top: 5px;" onclick="location.href='/qna/main'">
										MORE
										<!--  <i class="fa fa-plus text-primary"></i> -->
									</button>
								</div>
								<table class="table table-hover" style="table-layout: fixed;">
									<tbody>
										<c:forEach items="${questionList }" var="questionList" begin="0" end="4">
											<fmt:formatDate value="${questionList.regdate }" pattern="HH:mm" var="todayRegiDate"/>
											<fmt:formatDate value="${questionList.regdate }" pattern="MMdd" var="regiDate"/>
											<fmt:formatDate value="${questionList.regdate }" pattern="MM.dd" var="markDate"/>
											<tr>
												<td>
													<a style="color : black;"  href="/qna/view/${questionList.qna_board_seq }"><i class="fa fa-angle-double-right customColor" style="margin-right : 5px;"></i> ${questionList.subject } <c:if test="${questionList.reply_cnt != 0 }">
															<div style="display: inline-block; color: green; font-weight: bold;">[ ${questionList.reply_cnt } ]</div>
														</c:if>
													</a>
												</td>
												<td style="width : 70px;">
													<c:choose>
													<c:when test="${nowDate != regiDate }">
														${markDate }
													</c:when>
													<c:otherwise>
														${todayRegiDate }
													</c:otherwise>
												</c:choose>
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
	</div>

	<div class="row">
		<div class="col-md-6">
			<div class="row">
				<div class="col-md-12 grid-margin">
					<div class="card">
						<div class="card-body">
							<div class="row" style="overflow-x: auto;">
								<div style="min-width: 85%;">
									<h4 class="card-title" style="display: inline-block; font-weight: bold; margin-left: 10px;">
										<i class="fa fa-pencil-square-o" style="color: #2196f3; margin-right: 5px; font-size: 12pt;"></i>건의게시판
									</h4>
								</div>
								<div style="display: grid; width: 10%; margin-left: 7px;">
									<button type="button" class="btn btn-dark btn-sm" style="font-size: 5pt; height: 20px; padding-top: 5px;" onclick="location.href='/proposal/main'">
										MORE
										<!--  <i class="fa fa-plus text-primary"></i> -->
									</button>
								</div>
								<table width="100%" class="table table-hover" id="mainListTable" style="table-layout: fixed;">
									<thead>
									<tbody>
										<c:forEach items="${proposalList }" var="proposalList" begin="0" end="4">
											<fmt:formatDate value="${proposalList.regdate }" pattern="HH:mm" var="todayRegiDate"/>
											<fmt:formatDate value="${proposalList.regdate }" pattern="MMdd" var="regiDate"/>
											<fmt:formatDate value="${proposalList.regdate }" pattern="MM.dd" var="markDate"/>
											<tr>
												<td>
													<a class="move" style="color : black;"  href=notice/view /<c:out value="${proposalList.proposal_seq}"/>><i class="fa fa-angle-double-right customColor" style="margin-right : 5px;"></i><c:out value="${proposalList.subject}" /></a>
												</td>
												<td style="width : 70px;">
													<c:choose>
													<c:when test="${nowDate != regiDate }">
														${markDate }
													</c:when>
													<c:otherwise>
														${todayRegiDate }
													</c:otherwise>
												</c:choose>
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
									<h4 class="card-title" style="display: inline-block; font-weight: bold; margin-left: 10px;">
										<i class="fa fa-weixin" style="color: #2196f3; margin-right: 5px; font-size: 12pt;"></i>자유게시판
									</h4>
								</div>
								<div style="display: grid; width: 10%; margin-left: 7px;">
									<button type="button" class="btn btn-dark btn-sm" style="font-size: 5pt; height: 20px; padding-top: 5px;"  onclick="location.href='/free/main'">
										MORE
										<!--  <i class="fa fa-plus text-primary"></i> -->
									</button>
								</div>
								<table class="table table-hover" style="table-layout: fixed;">
									<tbody>
										
										<c:forEach items="${freeBoardList }" var="freeBoardList" begin="0" end="4">
											<fmt:formatDate value="${freeBoardList.regdate }" pattern="HH:mm" var="todayRegiDate"/>
											<fmt:formatDate value="${freeBoardList.regdate }" pattern="MMdd" var="regiDate"/>
											<fmt:formatDate value="${freeBoardList.regdate }" pattern="MM.dd" var="markDate"/>
											<tr>
												<td>
													<a style="color : black;" href="/free/view/${freeBoardList.free_board_seq }"><i class="fa fa-angle-double-right customColor" style="margin-right : 5px;"></i> ${freeBoardList.subject } <c:if test="${freeBoardList.reply_cnt != 0 }">
															<div style="display: inline-block; color: green; font-weight: bold;">[ ${freeBoardList.reply_cnt } ]</div>
														</c:if>
													</a>
												</td>
												<td style="width : 70px;">
													<c:choose>
													<c:when test="${nowDate != regiDate }">
														${markDate }
													</c:when>
													<c:otherwise>
														${todayRegiDate }
													</c:otherwise>
												</c:choose>
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
	</div>


</div>

<!-- main-panel ends -->
<%@ include file="../include/footer.jsp"%>

<script type="text/javascript" charset="utf8" src="/resources/assets/js/shared/jquery-1.12.4.min.js"></script>
<script type="text/javascript" charset="utf8" src="/resources/assets/vendors/datatables.net/jquery.dataTables.js"></script>

</body>
</html>