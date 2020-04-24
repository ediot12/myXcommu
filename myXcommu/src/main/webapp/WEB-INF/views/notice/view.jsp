<!DOCTYPE html>
<html lang="ko">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<head>

<title>myXcommu</title>
<!-- plugins:css -->

<%@ include file="../include/header.jsp"%>

<fmt:formatDate value="${board.regdate }" pattern="yy-MM-dd HH:mm" var="regiDate" />
<fmt:formatDate value="${contentRegiDate }" pattern="yyyy-MM-dd" var="joinDate" />
<fmt:formatDate value="${userConnectDate }" pattern="yyyy-MM-dd" var="connDate" />

<style>
span.bar {
	line-height: 40px;
	height: 40px;
	color: #aaa;
	margin: 0 10px;
	font-size: 17px;
}
</style>
<!-- partial -->
<div class="content-wrapper">

	<div class="row">

		<div class="col-md-12 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<form class="forms-sample" method="post" action="/">
						<div class="form-group">
							<input type="hidden" value="${board.notice_seq }" id="boardSeq">
							<h1 style="font-family: 'NanumGothic'; font-weight: bold; display: inline-block;">${board.subject }</h1>
							<div style="display: inline-block; float: right; padding-top: 15px; font-size: 10pt;">
								${regiDate } <span class="bar">|</span> 조회 ${board.view_cnt }
							</div>
						</div>
						<div class="form-group">
							<textarea class="form-control" name="content" id="contentArea" rows="2" value="${board.content }" disabled="disabled"></textarea>
						</div>
						<sec:authentication property="principal" var="pinfo" />

						<!-- 작성자와 본인이 일치하지  않으면 수정과 삭제 버튼은 뜨지 않는다. -->
						<sec:authorize access="isAuthenticated()">
							<c:if test="${pinfo.username eq board.writer}">
								<button type="button" class="btn btn-md" style="background-color: red; border-color: red; color: white;" onclick="deleteBoard()"><i class="fa fa-recycle"></i>삭제</button>
								<button type="button" class="btn btn-info btn-md" onclick="goModifyPage(${board.notice_seq})"><i class="fa fa-edit"></i>수정</button>
							</c:if>
						</sec:authorize>

						<button type="button" class="btn btn-md btn-secondary" onclick="location.href='/notice/main'"><i class="fa fa-list"></i>목록</button>

						<input type="hidden" id="writer" value="${board.writer }">							
						<input type="hidden" id="reporter" value="${sessionScope.currentUserId}">
						<input type="hidden" id="boardType" value="4">

					</form>
				</div>


			</div>
		</div>
		
		

		<%@ include file="../include/viewProfile.jsp"%>
		
		<div class="col-lg-12 grid-margin stretch-card">

			<div class="card">
				<div class="card-body">



					<div class="col-12">
						<div class="page-header">
							<h4 class="page-title" style="font-weight: 1000; display : inline-block;">공지사항</h4>
							<span class="bar" style="font-size : 17pt; color : #aaa;">|</span>
							총 ${fn:length(noticeList)} 건의 게시글을 보관중
						</div>
					</div>

					<table class="table table-hover" id="noticeBoardTable">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>글쓴이</th>
								<th>등록일</th>
								<th>조회</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${noticeList }" var="list">
								<tr>
									<td>${list.notice_seq }</td>
									<td>
										<a href="/notice/view/${list.notice_seq }"> <!-- <i class="fa fa-lock" style="margin-right : 5px;"></i> -->${list.subject } <%-- <c:if test="${list.reply_cnt != 0 }">
													<div style="display:inline-block; color: green; font-weight: bold;">
														[ ${list.reply_cnt } ]
													</div>
												</c:if> --%>
										</a>
									</td>
									<td>${list.writer }</td>
									<td>
										<fmt:formatDate value="${list.regdate }" pattern="HH:mm" var="todayRegiDate" />
										<fmt:formatDate value="${list.regdate }" pattern="MMdd" var="regiDate" />
										<fmt:formatDate value="${list.regdate }" pattern="yy.MM.dd" var="markDate" />
										<c:choose>
											<c:when test="${nowDate != regiDate }">
													${markDate }
												</c:when>
											<c:otherwise>
													${todayRegiDate }
												</c:otherwise>
										</c:choose>
									</td>
									<td>${list.view_cnt }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<sec:authentication property="principal" var="pinfo" />

					<!-- 작성자와 본인이 일치하지  않으면 수정과 삭제 버튼은 뜨지 않는다. -->
					<sec:authorize access="hasAnyRole('ROLE_ADMIN')">

						<button type="button" onclick="location.href='/notice/register'" class="btn btn-outline-primary btn-fw" style="float: right; margin-top: 10px;">글쓰기</button>
					</sec:authorize>

				</div>
			</div>
		</div>


	</div>

</div>
<!-- main-panel ends -->
<%@ include file="../include/footer.jsp"%>



<script type="text/javascript" charset="utf8" src="/resources/assets/js/shared/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/assets/ckeditor/ckeditor.js"></script>
<script>

	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";



	$(document).ajaxSend( function ( e, xhr, options ) {
			
		xhr.setRequestHeader( csrfHeaderName, csrfTokenValue);
	
		console.log( "csrfHeaderName : " + csrfHeaderName );
		console.log( "csrfTokenValue : " + csrfTokenValue );
	});

	$(document).ready( function(e) {
		
		
		
	});

	CKEDITOR.replace('contentArea', {
			height : 600,
			on :
			   {
			      instanceReady : function ( evt )
			      {
			         // Hide the editor top bar.
			    	  document.getElementById("cke_1_top").style.display='none';
			      }
			   }
		
	});	
	
	CKEDITOR.instances.contentArea.setData( '${board.content }' )
	
	
	/* 사실  위에 completeQuestion과 흡사하므로 하나로 합칠수 있음 .. 다만 나중에 */
	function deleteBoard(){
		
		swal({
			  title: "해당 게시물이 삭제됩니다. 계속하시겠습니까?",
			  icon: "error",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				 
				  $.ajax({
						
						url : '/common/view/deleteBoard',
						method : 'GET',
						data : {
							'writer': document.getElementById("writer").value,
							'boardSeq' : document.getElementById("boardSeq").value,
							'boardType' : '5'
						},
						success : function ( result ){
							  
							  
						    swal("삭제되었습니다.", {
						      icon: "success",
						    });
						    setTimeout( function(){
						    	location.href = "/notice/main";
						    },  1000, );
						},
						error : function ( result ){
							alert("internal error occured!!!");	
						}
						
					});
				
			  }
			});
		
		
	}
	
	
	function goModifyPage( pageNum ){
		
		location.href="/notice/modify/"+pageNum;
	}
	
	
</script>
</body>
</html>