<!DOCTYPE html>
<html lang="ko">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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

table.dataTable tbody td {
	padding-left: 20px !important;
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
		<!-- Page Title Header Ends-->

		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="row profile-page">
							<div class="col-12">
								<div class="card">
									<div class="card-body">
										<div class="profile-header text-white">
											<div class="d-flex justify-content-center justify-content-md-between mx-4 mx-xl-5 px-xl-5 flex-wrap">
												<div class="profile-info d-flex align-items-center justify-content-center flex-wrap mr-sm-3">
													<c:if test="${member.profile_image == null }">
														<img class="rounded-circle img-lg mb-3 mb-sm-0" src="/resources/assets/images/empty_face.png" alt="profile image" style="width : 150px; height : 150px;">
														
													</c:if>
													<c:if test="${member.profile_image != null }">
														<img class="rounded-circle img-lg mb-3 mb-sm-0" src="${member.profile_image }" alt="profile image" style="width : 150px; height : 150px;">
													</c:if>
													<div class="wrapper pl-sm-4">
														<p class="profile-user-name text-center text-sm-left" style="color : white;">Richard V.Welsh (UI/UX Designer)</p>
														<div class="wrapper d-flex align-items-center justify-content-center flex-wrap">
															<p class="profile-user-designation text-center text-md-left my-2 my-md-0" style="color : white;">User Experience Specialist</p>
															<div class="br-wrapper br-theme-css-stars">
																<select id="example-css" name="rating" autocomplete="off" style="display: none;">
																	<option value="1">1</option>
																	<option value="2">2</option>
																	<option value="3">3</option>
																	<option value="4">4</option>
																	<option value="5">5</option>
																</select>
																<div class="br-widget">
																	<a href="#" data-rating-value="1" data-rating-text="1" class="br-selected br-current"></a><a href="#" data-rating-value="2" data-rating-text="2"></a><a href="#" data-rating-value="3" data-rating-text="3"></a><a href="#" data-rating-value="4" data-rating-text="4"></a><a href="#" data-rating-value="5" data-rating-text="5"></a>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="details mt-2 mt-md-0">
													<div class="detail-col pr-3 mr-3">
														<p style="color : white;">댓글 수</p>
														<p style="color : white;">130</p>
													</div>
													<div class="detail-col">
														<p style="color : white;">글작성 수</p>
														<p style="color : white;">130</p>
													</div>
												</div>
											</div>
										</div>
										<div class="profile-body">
											<ul class="nav tab-switch" role="tablist">
												<li class="nav-item"><a class="nav-link active" id="user-profile-info-tab" data-toggle="pill" href="#user-profile-info" role="tab" aria-controls="user-profile-info" aria-selected="true">Profile</a></li>
												<li class="nav-item"><a class="nav-link" id="user-profile-activity-tab" data-toggle="pill" href="#user-profile-activity" role="tab" aria-controls="user-profile-activity" aria-selected="false">Activity</a></li>
											</ul>
											<div class="row">
												<div class="col-md-12">
													<div class="tab-content tab-body" id="profile-log-switch">
														<div class="tab-pane fade show active pr-3" id="user-profile-info" role="tabpanel" aria-labelledby="user-profile-info-tab">
															<div class="table-responsive">
																<fmt:formatDate value="${member.regDate }" pattern="yyyy-MM-dd HH:mm:ss" var="regDate"/>
																<fmt:formatDate value="${member.updateDate }" pattern="yyyy-MM-dd HH:mm:ss" var="updateDate"/>
																<table class="table table-borderless w-100 mt-4">
																	<tbody>
																		<tr>
																			<td>
																				<strong>Full Name :</strong> ${member.userid }
																			</td>
																			<td>
																				<strong>Email :</strong> ${member.email }
																			</td>
																		</tr>
																		<tr>
																			<td>
																				<strong>회원 가입일 :</strong> ${regDate }
																			</td>
																			<td>
																				<strong>마지막 접속일 :</strong> ${updateDate }
																			</td>
																		</tr>
																	</tbody>
																</table>
															</div>
															
															<div class="row">
																<div class="col-12 mt-5 border-success" style="border : 2px solid;">
																	<h5 class="mb-5">자기소개</h5>
																	<c:if test="${member.profile_info != null }">
																		${member.profile_info }
																	</c:if>
																	<c:if test="${member.profile_info == null }">
																		자기소개가 없습니다.
																	</c:if>																	
																</div>
															</div>
															<div class="row" style="margin-top : 15px;">
																<sec:authentication property="principal" var="pinfo" />
																	<sec:authorize access="isAuthenticated()">
																		<c:if test="${pinfo.username eq member.userid}">
																			<button class="btn btn-md btn-secondary" onclick="goModifyProfile()">수정</button>
																		</c:if>
																	</sec:authorize>
																
															</div>
														</div>
														<div class="tab-pane fade" id="user-profile-activity" role="tabpanel" aria-labelledby="user-profile-activity-tab">
															<div class="horizontal-timeline">
																<section class="time-frame">
																	<h4 class="section-time-frame">Today</h4>
																	<div class="event">
																		<p class="event-text">We’re big on real names around here, so people know who’s who</p>
																		<div class="event-alert">You have added task #26 Successfully to the project “Agile CRM”</div>
																		<div class="event-info">New Dashboard Design - 9:24 PM</div>
																	</div>
																	<div class="event">
																		<p class="event-text">Admin is a full featured, multipurpose, premium bootstrap admin template built with Bootstrap 4 Framework</p>
																		
																		<div class="event-info">New Dashboard Design - 9:24 PM</div>
																	</div>
																	<div class="event">
																		<p class="event-text">It is a fully responsive bootstrap admin template / bootstrap admin dashboard</p>
																		<div class="event-alert">You have added task #26 Successfully to the project “Agile CRM”</div>
																		<div class="event-info">New Dashboard Design - 9:24 PM</div>
																	</div>
																</section>
																<section class="time-frame">
																	<h4 class="section-time-frame">Yesterday</h4>
																	<div class="event">
																		<p class="event-text">Night fill together itself. Midst. Beginning. Behold living god had.</p>
																		<div class="event-alert">You have added task #26 Successfully to the project “Agile CRM”</div>
																		<div class="event-info">New Dashboard Design - 11:24 PM</div>
																	</div>
																	<div class="event">
																		<p class="event-text">Why waste time starting from scratch; try out our admin dashboard template</p>
																		<div class="event-info">New Dashboard Design - 11:30 PM</div>
																	</div>
																</section>
																<section class="time-frame">
																	<h4 class="section-time-frame">30 March</h4>
																	<div class="event">
																		<p class="event-text">Gerald Vaughn changed the status to QA on MA-86 - Retargeting Ads</p>
																		
																		<div class="event-alert">You have added task #26 Successfully to the project “Agile CRM”</div>
																		<div class="event-info">New Dashboard Design - 11:45 PM</div>
																	</div>
																</section>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
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



<script type="text/javascript" charset="utf8" src="/resources/assets/js/shared/jquery-1.12.4.min.js"></script>
<script>
	
	function goModifyProfile(){
		
		location.href="/myProfileModify";
		
	}

</script>
</body>
</html>