<!DOCTYPE html>
<html lang="ko">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />

<head>
<!-- Required meta tags -->

<style>
body {
	font-family: 'NanumGothic';
}

table.dataTable tbody td {
	padding-left: 20px !important;
}
</style>

<title>myXcommu</title>
<!-- plugins:css -->

<%@ include file="../include/header.jsp"%>


<!-- partial -->
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
													<p class="profile-user-name text-center text-sm-left" style="color: white;">Richard V.Welsh (UI/UX Designer)</p>
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
													<p style="color: white;">130</p>
												</div>
												<div class="detail-col">
													<p style="color: white;">글작성 수</p>
													<p style="color: white;">130</p>
												</div>
											</div>
										</div>
									</div>
									<div class="profile-body">
										<ul class="nav tab-switch" role="tablist">
											<li class="nav-item"><a class="nav-link active" id="user-profile-info-tab" data-toggle="pill" href="#user-profile-info" role="tab" aria-controls="user-profile-info" aria-selected="true">Profile</a></li>
										</ul>
										<div class="row">
											<div class="col-md-12">
												<div class="tab-content tab-body" id="profile-log-switch">
													<div class="tab-pane fade show active pr-3" id="user-profile-info" role="tabpanel" aria-labelledby="user-profile-info-tab">
														<div class="table-responsive">
															<fmt:formatDate value="${member.regDate }" pattern="yyyy-MM-dd HH:mm:ss" var="regDate" />
															<fmt:formatDate value="${member.updateDate }" pattern="yyyy-MM-dd HH:mm:ss" var="updateDate" />
															<form method="post" action="updateProfile" enctype="multipart/form-data">
																<table class="table table-borderless w-100 mt-4">
																	<tbody>
																		<tr>
																			<td>
																				<strong>Full Name :</strong> <input type="text" class="form-control" name="userid" id="userid" value="${member.userid }" style="width: 50%;" readonly="readonly">
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
															<div class="col-12 mt-5 border-success" style="border: 2px solid;">
																<h5 class="mb-5">자기소개</h5>
																<textarea class="form-control" draggable="false" name="profile_info">${member.profile_info }</textarea>
															</div>
														</div>

														<div class="row">

															<div id="dzUpload" class="dropzone"></div>

														</div>
														<div class="row" style="margin-top: 15px;">
															<button type="submit" class="btn btn-md btn-secondary">수정</button>
														</div>
														<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> <input type="hidden" name="profile_image">
														</form>
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



<script type="text/javascript" charset="utf8" src="/resources/assets/js/shared/jquery-1.12.4.min.js"></script>
<script src="/resources/assets/dropzone/dropzone.js"></script>
<script>
	Dropzone.autoDiscover = false;

	Dropzone.options.dzUpload = {
		url : "/profileUploadCheck",
		thumbnailWidth : null,
		thumbnailHeight : null,
		init : function() {
			this.on("thumbnail", function(file, dataUrl) {
				$('.dz-image').last().find('img').attr({
					width : '100%',
					height : '100%'
				});
			}), this.on("success", function(file) {
				$('.dz-image').css({
					"width" : "100%",
					"height" : "auto"
				});
			})
		},
		addRemoveLinks : true,
		maxFiles : 1,
		acceptedFiles : ".jpeg,.jpg,.png,.JPEG,.JPG,.PNG",
		headers : {
			'X-CSRF-TOKEN' : $('meta[name="_csrf"]').attr('content')
		},
		success : function(file, response) {

			console.log();
			console.log(response);
			$('input[name=profile_image]').val(file.dataURL);

		},
		error : function(file, response) {
			console.log(file);
			console.log(response);

		}
	};
	var myDropzone = new Dropzone("div#dzUpload");
</script>
</body>
</html>