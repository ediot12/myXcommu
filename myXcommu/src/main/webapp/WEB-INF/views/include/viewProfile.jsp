<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<div class="col-md-12 mb-5">
	<div class="card rounded shadow-none">
		<div class="card-body">
			<div class="row">
				<div class="col-md-4 d-flex">
					<div class="user-avatar mb-auto">
						<c:if test="${writerInfo.profile_image == null }">
							<img src="/resources/assets/images/empty_face.png" alt="profile image" class="profile-img img-lg rounded-circle">
						</c:if>
						<c:if test="${writerInfo.profile_image != null }">
							<img src="${writerInfo.profile_image}" alt="profile image" class="profile-img img-lg rounded-circle">
						</c:if>
					</div>
					<div class="wrapper pl-4">
						<div class="wrapper d-flex align-items-center">
							<h4 class="mb-0 font-weight-medium">${writerInfo.userid }</h4>
						</div>
						<div class="wrapper d-flex align-items-center font-weight-medium text-muted">
							<!-- <i class="fa fa-user" style="margin-right: 5px;"></i> -->
							<p class="mb-0 text-muted">
								<c:if test='${writerInfo.auth eq "ROLE_ADMIN" }'>
									관리자
								</c:if>
								<c:if test='${writerInfo.auth eq "ROLE_USER" }'>
									일반회원
								</c:if>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-5">
					<!-- <div class="d-flex align-items-center w-100">
						<p class="mb-0 mr-3 font-weight-semibold">Progress</p>
						<div class="progress progress-md w-100">
							<div class="progress-bar bg-success" role="progressbar" style="width: 67%" aria-valuenow="67" aria-valuemin="0" aria-valuemax="100"></div>
						</div>
						<p class="mb-0 ml-3 font-weight-semibold">67%</p>
					</div> -->
						<div class="wrapper">
	                          <h4 class="mb-3">
	                         	 <i class="fa fa-user-circle-o mr-3"></i>
	                          	자기소개
	                          	</h4>
	                          <p>
	                          	<c:if test="${writerInfo.profile_info == null }">
									자기소개가 없습니다.
								</c:if>
								<c:if test="${writerInfo.profile_info ne null}">
									${writerInfo.profile_info}
								</c:if>
	                          </p>
                        </div>
						<%--  --%>
				</div>
				<div class="col-md-3">
					<div class="wrapper d-flex justify-content-end">
						<button type="button" class="btn btn-sm btn-inverse-primary mr-2" onclick="location.href='/viewProfile?userId=${writerInfo.userid }'"><i class="fa fa-vcard-o"></i>프로필 보기</button> 
					</div>
				</div>
			</div>
		</div>
	</div>
</div>