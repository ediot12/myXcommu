<!DOCTYPE html>
<html lang="ko">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<head>

<link rel="stylesheet" type="text/css" href="/resources/assets/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
<link rel="stylesheet" type="text/css" href="/resources/assets/vendors/datatables.net-fixedcolumns-bs4/fixedColumns.bootstrap4.min.css">
<title>myXcommu</title>
<!-- plugins:css -->

<%@ include file="../include/header.jsp"%>
<jsp:useBean id="currentDate" class="java.util.Date" />
<fmt:formatDate value="${currentDate}" pattern="MMdd" var="nowDate" />


<!-- partial -->
<div class="content-wrapper">
	<div class="row">
		<div class="col-12 grid-margin">
			<div class="card card-statistics">
				<div class="row">
					<div class="card-col col-xl-3 col-lg-3 col-md-3 col-6">
						<div class="card-body">
							<div class="d-flex align-items-center justify-content-center flex-column flex-sm-row">
								<i class="mdi mdi-account-multiple-outline text-primary mr-0 mr-sm-4 icon-lg"></i>
								<div class="wrapper text-center text-sm-left">
									<p class="card-text mb-0">가입자 수</p>
									<div class="fluid-container">
										<h3 class="mb-0 font-weight-medium">${stats.member_cnt }</h3>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="card-col col-xl-3 col-lg-3 col-md-3 col-6">
						<div class="card-body">
							<div class="d-flex align-items-center justify-content-center flex-column flex-sm-row">
								<!-- <i class="mdi mdi-checkbox-marked-circle-outline text-primary mr-0 mr-sm-4 icon-lg"></i> -->
								<i class="text-primary fa fa-list-alt mr-0 mr-sm-4 icon-lg" style="font-size: 2.5rem;"></i>
								<div class="wrapper text-center text-sm-left">
									<p class="card-text mb-0">게시물 수</p>
									<div class="fluid-container">
										<h3 class="mb-0 font-weight-medium">${stats.board_cnt }</h3>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="card-col col-xl-3 col-lg-3 col-md-3 col-6">
						<div class="card-body">
							<div class="d-flex align-items-center justify-content-center flex-column flex-sm-row">
								<!-- <i class="mdi mdi-trophy-outline text-primary mr-0 mr-sm-4 icon-lg"></i> -->
								<i class="text-primary fa fa-comments mr-0 mr-sm-4 icon-lg" style="font-size: 2.5rem;"></i>
								<div class="wrapper text-center text-sm-left">
									<p class="card-text mb-0">댓글 수</p>
									<div class="fluid-container">
										<h3 class="mb-0 font-weight-medium">${stats.reply_cnt }</h3>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="card-col col-xl-3 col-lg-3 col-md-3 col-6">
						<div class="card-body">
							<div class="d-flex align-items-center justify-content-center flex-column flex-sm-row">
								<i class="mdi mdi-target text-primary mr-0 mr-sm-4 icon-lg"></i>
								<div class="wrapper text-center text-sm-left">
									<p class="card-text mb-0">Total Sales</p>
									<div class="fluid-container">
										<h3 class="mb-0 font-weight-medium">61,119</h3>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-12 col-sm-6 col-md-3 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<div class="d-flex justify-content-center">
						<i class="mdi mdi-clock icon-lg text-primary d-flex align-items-center"></i>
						<div class="d-flex flex-column ml-4">
							<span class="d-flex flex-column">
								<p class="mb-0">Bounce rate</p>
								<h4 class="font-weight-bold">32.16%</h4>
							</span> <small class="text-muted">65.45% on average time</small>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-12 col-sm-6 col-md-3 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<div class="d-flex justify-content-center">
						<i class="mdi mdi-cart-outline icon-lg text-success d-flex align-items-center"></i>
						<div class="d-flex flex-column ml-4">
							<span class="d-flex flex-column">
								<p class="mb-0">Today sales</p>
								<h4 class="font-weight-bold">$489,271</h4>
							</span> <small class="text-muted">$489,271 before tax</small>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-12 col-sm-6 col-md-3 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<div class="d-flex justify-content-center">
						<i class="mdi mdi-laptop icon-lg text-warning d-flex align-items-center"></i>
						<div class="d-flex flex-column ml-4">
							<span class="d-flex flex-column">
								<p class="mb-0">Unique visits</p>
								<h4 class="font-weight-bold">74.50%</h4>
							</span> <small class="text-muted">80% average duration</small>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-12 col-sm-6 col-md-3 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<div class="d-flex justify-content-center">
						<i class="mdi mdi-earth icon-lg text-danger d-flex align-items-center"></i>
						<div class="d-flex flex-column ml-4">
							<span class="d-flex flex-column">
								<p class="mb-0">Today's visits</p>
								<h4 class="font-weight-bold">6,775,440</h4>
							</span> <small class="text-muted">45% higher yesterday</small>
						</div>
					</div>
				</div>
			</div>
		</div>		
	</div>

	<div>
		<div class="col-lg-12 stretch-card">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">Table with contextual classes</h4>
					 
					<div class="table-responsive">
						<table class="table table-bordered" id="userStatsTable">
							<thead>
								<tr>
									<th>아이디명</th>
									<th>회원가입일</th>
									<th>최근 로그인</th>
									<th>레벨</th>
									<th>로그인 횟수</th>
									<th>이메일</th>
									<th>전체 게시글 수</th>
									<th>전체 댓글 수</th>
								</tr>
							</thead>
							<tbody>
								<!-- <tr class="table-info">
									<td>1</td>
									<td>Herman Beck</td>
									<td>Photoshop</td>
									<td>$ 77.99</td>
									<td>May 15, 2015</td>
								</tr>
								<tr class="table-warning">
									<td>2</td>
									<td>Messsy Adam</td>
									<td>Flash</td>
									<td>$245.30</td>
									<td>July 1, 2015</td>
								</tr>
								<tr class="table-danger">
									<td>3</td>
									<td>John Richards</td>
									<td>Premeire</td>
									<td>$138.00</td>
									<td>Apr 12, 2015</td>
								</tr>
								<tr class="table-success">
									<td>4</td>
									<td>Peter Meggik</td>
									<td>After effects</td>
									<td>$ 77.99</td>
									<td>May 15, 2015</td>
								</tr>
								<tr class="table-primary">
									<td>5</td>
									<td>Edward</td>
									<td>Illustrator</td>
									<td>$ 160.25</td>
									<td>May 03, 2015</td>
								</tr> -->
								<c:forEach items="${memberStats }" var="memberStats">
									<fmt:formatDate value="${memberStats.regdate }" pattern="yyyy-MM-dd HH:mm:ss" var="regdate"/>
									<fmt:formatDate value="${memberStats.updatedate }" pattern="yyyy-MM-dd HH:mm:ss" var="updatedate"/>
									<tr>
										<td><a href="/viewProfile?userId=${memberStats.userid }">${memberStats.userid }</a></td>
										<td>${regdate }</td>
										<td>${updatedate }</td>
										<td>${memberStats.user_level }</td>
										<td>${memberStats.login_count }</td>
										<td>${memberStats.email }</td>
										<td>${memberStats.board_cnt }</td>
										<td>${memberStats.reply_cnt }</td>									
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
<!-- main-panel ends -->
<%@ include file="../include/footer.jsp"%>



<script type="text/javascript" charset="utf8" src="/resources/assets/js/shared/jquery-1.12.4.min.js"></script>
<script type="text/javascript" charset="utf8" src="/resources/assets/vendors/datatables.net/jquery.dataTables.js"></script>

<!-- <script src="/resources/assets/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script> -->
<!-- <script src="/resources/assets/vendors/datatables.net-fixedcolumns/dataTables.fixedColumns.min.js"></script> -->
<script>


$(document).ready(function() {
	$('#userStatsTable').DataTable({
		responsive : true,
		searching: true,
		ordering : true,
		bInfo : false,
		bLengthChange : false
	});
});


</script>
</body>
</html>