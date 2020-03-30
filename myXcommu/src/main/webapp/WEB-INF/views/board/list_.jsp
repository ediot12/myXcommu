<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<head>
<title>myXcommu</title>
<!-- plugins:css -->

<%@ include file="../include/header.jsp"%>
<!-- partial -->
<div class="content-wrapper">
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
			<div class="col-md-4 grid-margin stretch-card">
				<div class="card">
					<img class="card-img-top" src="${pictureList.base64_code }" alt="card images" style="width : 350px; height : 215px;">
					<div class="card-body pb-0">
						<p class="text-muted">${pictureList.subject }</p>
						<h5>It’s good to start or finish the day with delicious pancakes :)</h5>
						<div class="d-flex align-items-center justify-content-between text-muted border-top py-3 mt-3">
							<p class="mb-0">Published on May 23, 2018</p>
							<div class="wrapper d-flex align-items-center">
								<small class="mr-2">93</small> <i class="mdi mdi-heart-outline"></i>
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
									<h4 class="card-title" style="display: inline-block; font-weight: bold;">
										<i class="fa fa-exclamation-circle" style="color: #2196f3; margin-right: 5px; font-size: 12pt;"></i>공지사항
									</h4>
								</div>
								<div style="display: grid; width: 10%; margin-left: 7px;">
									<button type="button" class="btn btn-light btn-sm" style="font-size: 5pt; height: 20px; padding-top: 5px;">
										MORE
										<!--  <i class="fa fa-plus text-primary"></i> -->
									</button>
								</div>
								<table width="100%" class="table table-hover">
									<tbody>
										<c:forEach items="${noticeList }" var="noticeList" begin="0" end="4">
											<tr>
												<td>
													<a class="move" href=/notice/view/<c:out value="${noticeList.notice_seq}"/>><c:out value="${noticeList.subject}" /></a>
												</td>
												<td>
													<c:out value="${noticeList.writer }" />
												</td>
												<td>
													<fmt:formatDate pattern="yyyy-MM-dd" value="${noticeList.regdate }" />
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
									<i class="fa fa-question-circle" style="color: #2196f3;"></i>
									<h4 class="card-title" style="display: inline-block; font-weight: bold;">질문게시판</h4>
								</div>
								<div style="display: grid; width: 10%; margin-left: 7px;">
									<button type="button" class="btn btn-light btn-sm" style="font-size: 5pt; height: 20px; padding-top: 5px;">
										MORE
										<!--  <i class="fa fa-plus text-primary"></i> -->
									</button>
								</div>
								<table class="table table-hover">
									<tbody>
										<c:forEach items="${questionList }" var="questionList" begin="0" end="4">
											<tr>
												<td>
													<c:if test='${questionList.division == "질문유형1"}'>
														<label class="badge badge-danger"> 질문유형 1 </label>
													</c:if>
													<c:if test='${questionList.division == "질문유형2"}'>
														<label class="badge badge-success"> 질문유형 2 </label>
													</c:if>
												</td>
												<td>
													<c:if test="${questionList.status == 'N' }">
														<label class="badge badge-danger"> 해결중 </label>
													</c:if>
													<c:if test="${questionList.status == 'Y' }">
														<label class="badge badge-success"> 해결완료 </label>
													</c:if>
												</td>
												<td>
													<a href="/qna/view/${questionList.qna_board_seq }"> ${questionList.subject } <c:if test="${questionList.reply_cnt != 0 }">
															<div style="display: inline-block; color: green; font-weight: bold;">[ ${questionList.reply_cnt } ]</div>
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

	<div class="row">
		<div class="col-md-6">
			<div class="row">
				<div class="col-md-12 grid-margin">
					<div class="card">
						<div class="card-body">
							<div class="row" style="overflow-x: auto;">
								<div style="min-width: 85%;">
									<h4 class="card-title" style="display: inline-block; font-weight: bold;">
										<i class="fa fa-pencil-square-o" style="color: #2196f3; margin-right: 5px; font-size: 12pt;"></i>건의게시판
									</h4>
								</div>
								<div style="display: grid; width: 10%; margin-left: 7px;">
									<button type="button" class="btn btn-light btn-sm" style="font-size: 5pt; height: 20px; padding-top: 5px;">
										MORE
										<!--  <i class="fa fa-plus text-primary"></i> -->
									</button>
								</div>
								<table width="100%" class="table table-hover" id="mainListTable">
									<thead>
									<tbody>
										<c:forEach items="${proposalList }" var="proposalList" begin="0" end="4">
											<tr>
												<td>
													<a class="move" href=notice/view /<c:out value="${proposalList.proposal_seq}"/>><c:out value="${proposalList.subject}" /></a>
												</td>
												<td>
													<c:out value="${proposalList.writer }" />
												</td>
												<td>
													<fmt:formatDate pattern="yyyy-MM-dd" value="${proposalList.regdate }" />
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
									<h4 class="card-title" style="display: inline-block; font-weight: bold;">
										<i class="fa fa-weixin" style="color: #2196f3; margin-right: 5px; font-size: 12pt;"></i>자유게시판
									</h4>
								</div>
								<div style="display: grid; width: 10%; margin-left: 7px;">
									<button type="button" class="btn btn-light btn-sm" style="font-size: 5pt; height: 20px; padding-top: 5px;">
										MORE
										<!--  <i class="fa fa-plus text-primary"></i> -->
									</button>
								</div>
								<table class="table table-hover">
									<tbody>
										
										<c:forEach items="${freeBoardList }" var="freeBoardList" begin="0" end="4">
											
											<tr>
												<td>
													<a href="/free/view/${freeBoardList.free_board_seq }"> ${freeBoardList.subject } <c:if test="${freeBoardList.reply_cnt != 0 }">
															<div style="display: inline-block; color: green; font-weight: bold;">[ ${freeBoardList.reply_cnt } ]</div>
														</c:if>
													</a>
												</td>
												<td>${freeBoardList.writer }</td>
												<td><fmt:formatDate pattern="yyyy-MM-dd" value="${freeBoardList.regdate }" /></td>
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