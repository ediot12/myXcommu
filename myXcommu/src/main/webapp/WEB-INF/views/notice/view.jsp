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
span.bar{
	line-height: 40px;
    height: 40px;
    color: #aaa;
    margin: 0 10px;
    font-size: 17px;
}



</style>
<!-- partial -->
<div class="main-panel">
	<div class="content-wrapper">
		<!-- Page Title Header Starts-->
		<div class="row page-title-header">
			<div class="col-12">
				<div class="page-header">
					<h4 class="page-title" style="font-weight: 1000;">공지사항 - 게시글</h4>
				</div>
			</div>

		</div>
		<!-- Page Title Header Ends-->

		<div class="row">

			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<form class="forms-sample" method="post" action="/">
							<div class="form-group">
								<input type="hidden" value="${board.notice_seq }" id="boardSeq">
								<h1 style="font-family: 'NanumGothic'; font-weight: bold; display : inline-block;">${board.subject }</h1>
								<div style="display : inline-block; float : right; padding-top : 15px; font-size : 10pt;">
									${regiDate }
									<span class="bar">|</span>
									조회 ${board.view_cnt }
								</div>
							</div>
							<div class="form-group">
								<textarea class="form-control" name="content" id="contentArea" rows="2" value="${board.content }" disabled="disabled"></textarea>
							</div>
							<sec:authentication property="principal" var="pinfo" />

							<!-- 작성자와 본인이 일치하지  않으면 수정과 삭제 버튼은 뜨지 않는다. -->
							<sec:authorize access="isAuthenticated()">
								<c:if test="${pinfo.username eq board.writer}">
									<button type="button" class="btn btn-md" style="background-color: red; border-color: red; color: white;" onclick="deleteBoard()">삭제</button>
									<button type="button" class="btn btn-info btn-md" onclick="goModifyPage(${board.notice_seq})">수정</button>
								</c:if>
							</sec:authorize>

							<button type="button" class="btn btn-md btn-secondary" onclick="location.href='/notice/main'">목록</button>

							<input type="hidden" id="writer" value="${board.writer }">


						</form>
					</div>


				</div>
			</div>

			<%@ include file="../include/viewProfile.jsp"%>


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
			   },
		   contentsCss : '/resources/assets/ckeditor/custom.css'
		
	});	
	
	CKEDITOR.instances.contentArea.setData( '${board.content }' )
	
	
	/* 사실  위에 completeQuestion과 흡사하므로 하나로 합칠수 있음 .. 다만 나중에 */
	function deleteBoard(){
		$.ajax({
			
			url : '/common/view/deleteBoard',
			method : 'GET',
			data : {
				'writer': document.getElementById("writer").value,
				'boardSeq' : document.getElementById("boardSeq").value,
				'boardType' : '5'
			},
			success : function ( result ){
				alert("delete complete");
				location.href = "/notice/main";
			},
			error : function ( result ){
				alert("internal error occured!!!");	
			}
			
		});
		
	}
	
	
	function goModifyPage( pageNum ){
		
		location.href="/notice/modify/"+pageNum;
	}
	
	
</script>
</body>
</html>