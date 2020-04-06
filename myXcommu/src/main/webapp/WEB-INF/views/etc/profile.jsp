<!DOCTYPE html>
<html lang="ko">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<head>
<!-- Required meta tags -->

<title>myXcommu</title>
<!-- plugins:css -->

<%@ include file="../include/header.jsp"%>


<!-- partial -->
<jsp:useBean id="currentDate" class="java.util.Date" />
<fmt:formatDate value="${currentDate}" pattern="yyyyMMdd" var="nowDate" />

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
													<img class="rounded-circle img-lg mb-3 mb-sm-0" src="/resources/assets/images/empty_face.png" alt="profile image" style="width: 150px; height: 150px;">

												</c:if>
												<c:if test="${member.profile_image != null }">
													<img class="rounded-circle img-lg mb-3 mb-sm-0" src="${member.profile_image }" alt="profile image" style="width: 150px; height: 150px;">
												</c:if>
												<div class="wrapper pl-sm-4">
													<p class="profile-user-name text-center text-sm-left" style="color: white;">${member.userid }</p>
													<div class="wrapper d-flex align-items-center justify-content-center flex-wrap">
														<p class="profile-user-designation text-center text-md-left my-2 my-md-0" style="color: white;">User Experience Specialist</p>
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
													<p style="color: white;">댓글 수</p>
													<p style="color: white;">${writerCnt.reply_cnt }</p>
												</div>
												<div class="detail-col">
													<p style="color: white;">글작성 수</p>
													<p style="color: white;">${writerCnt.board_cnt }</p>
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
															<fmt:formatDate value="${member.regDate }" pattern="yyyy-MM-dd HH:mm:ss" var="regDate" />
															<fmt:formatDate value="${member.updateDate }" pattern="yyyy-MM-dd HH:mm:ss" var="updateDate" />
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
															<div class="col-12 border-success" style="border: 2px solid;">
																<h5 class="mb-5">자기소개</h5>
																<c:if test="${member.profile_info != null }">
																		${member.profile_info }
																	</c:if>
																<c:if test="${member.profile_info == null }">
																		자기소개가 없습니다.
																	</c:if>
															</div>
														</div>
														<div class="row">
															<sec:authentication property="principal" var="pinfo" />
															<sec:authorize access="isAuthenticated()">
																<c:if test="${pinfo.username eq member.userid}">
																	<button class="btn btn-md btn-secondary" onclick="goModifyProfile()">수정</button>
																	<button class="btn btn-md btn-danger" onclick="dropOutAccount()">회원탈퇴</button>
																</c:if>
															</sec:authorize>
														</div>
													</div>
													<div class="tab-pane fade" id="user-profile-activity" role="tabpanel" aria-labelledby="user-profile-activity-tab">
														<div class="horizontal-timeline">
															<div class="card">
																<div class="card-body">
																	<ul class="bullet-line-list">
																		<c:forEach items="${userLog }" var="log" begin="0" end="4">
																			<fmt:formatDate value="${log.regdate }" pattern="yyyyMMdd" var="regiDate"/>
																			<fmt:parseDate var="sDate" value="${regiDate}" pattern="yyyyMMdd" />
																			<fmt:parseDate var="iDate" value="${nowDate}" pattern="yyyyMMdd" />
																			<fmt:parseNumber value="${sDate.time / (1000*60*60*24)}" integerOnly="true" var="isDate" scope="request" />
																			<fmt:parseNumber value="${iDate.time / (1000*60*60*24)}" integerOnly="true" var="itDate" scope="request" />
																			
																			<c:if test="${log.division eq 'board' }">
																				<li>
																					<div class="badge badge-primary" style="display : inline-block;">게시글</div>
																					<c:if test="${log.board_type eq '2' }">
																						<a href="qna/view/${log.board_seq }"><h6>${log.board_subject }</h6></a>
																					</c:if>
																					<c:if test="${log.board_type eq '3' }">
																						<a href="picture/view/${log.board_seq }"><h6>${log.board_subject }</h6></a>
																					</c:if>
																					<c:if test="${log.board_type eq '4' }">
																						<a href="proposal/view/${log.board_seq }"><h6>${log.board_subject }</h6></a>
																					</c:if>
																					<c:if test="${log.board_type eq '6' }">
																						<a href="free/view/${log.board_seq }"><h6>${log.board_subject }</h6></a>
																					</c:if>
																					<p>${log.board_content }</p>
																					<p class="text-muted">
																						<i class="mdi mdi-clock"></i> ${itDate - isDate} days ago.
																					</p>
																				</li>
																			</c:if>
																			<c:if test="${log.division eq 'reply' }">
																				<li>
																					<div class="badge badge-warning" style="display : inline-block;">댓글</div>
																					<c:if test="${log.board_type eq '2' }">
																						<a href="qna/view/${log.board_seq }"><h6>${log.reply_content }</h6></a>
																					</c:if>
																					<c:if test="${log.board_type eq '3' }">
																						<a href="picture/view/${log.board_seq }"><h6>${log.reply_content }</h6></a>
																					</c:if>
																					<c:if test="${log.board_type eq '4' }">
																						<a href="proposal/view/${log.board_seq }"><h6>${log.reply_content }</h6></a>
																					</c:if>
																					<c:if test="${log.board_type eq '6' }">
																						<a href="free/view/${log.board_seq }"><h6>${log.reply_content }</h6></a>
																					</c:if>
																					<p></p>
																					<p class="text-muted">
																						<i class="mdi mdi-clock"></i> ${itDate - isDate} days ago.
																					</p>
																				</li>
																			</c:if>
																		</c:forEach>
																	</ul>
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
	</div>

</div>
<!-- main-panel ends -->
<%@ include file="../include/footer.jsp"%>




<script>
	
	function goModifyProfile(){
		
		location.href="/myProfileModify";
		
	}
	
	function dropOutAccount(){
		
		swal({
			  title: "회원탈퇴시 복구 불가합니다. 계속하시겠습니까?",
			  icon: "error",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
				
				eraseCookie("JSESSION_ID");
			  
				swal("삭제되었습니다.", {
				      icon: "success",
				    });
				    setTimeout( function(){
				    	location.href = "/customLogout";
				    },  3000, );
				    
			});
	}
	
	function eraseCookie(name) {
		document.cookie = name +'=; Path=/; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
	}

</script>
</body>
</html>