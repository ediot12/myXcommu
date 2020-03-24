<!DOCTYPE html>
<html lang="ko">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<head>

<link rel="stylesheet" type="text/css" href="/resources/assets/js/dataTables/jquery.dataTables.css">
<title>myXcommu</title>
<!-- plugins:css -->

<%@ include file="../include/header.jsp"%>
<!-- partial -->
<div class="main-panel">
	<div class="content-wrapper">
		<!-- Page Title Header Starts-->
		<div class="row page-title-header">
			<div class="col-12">
				<div class="page-header">
					<h4 class="page-title" style="font-weight: 1000;">사진게시판 - 게시글</h4>
				</div>
			</div>

		</div>
		<!-- Page Title Header Ends-->

		<div class="row">

			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<form class="forms-sample" method="post" action="registerQuestion">
							<div class="form-group">
								<input type="hidden" value="${pictureBoard.picture_seq }" id="boardSeq">
								<h1 style="font-family: 'NanumGothic'; font-weight: bold;">${pictureBoard.subject }</h1>

								<fmt:formatDate value="${pictureBoard.regdate }" pattern="yyyy-MM-dd HH:mm:ss" var="regiDate" />
								<fmt:formatDate value="${contentRegiDate }" pattern="yyyy-MM-dd" var="joinDate" />
								<fmt:formatDate value="${userConnectDate }" pattern="yyyy-MM-dd" var="connDate" />
								<table class="table" style="border: 2px solid gray; width: 400px;">
									<tr>
										<th rowspan="3" style="width: 20%;"><img src="/resources/assets/images/Invulnerability_anim.gif"></th>
										<th colspan="2" style="width: 80%;">${pictureBoard.writer }에의해 ${regiDate }에 게시됨</th>
									</tr>
									<tr>
										<td>조회</td>
										<td>구분 : ${pictureBoard.division }</td>
									</tr>
									<tr>
										<td>최근 접속 : ${connDate }</td>
										<td>가입일 : ${joinDate }</td>
									</tr>
								</table>
							</div>
							<div class="form-group">
								<label for="questionArea">내용</label>
								<textarea class="form-control" name="content" id="contentArea" rows="10" disabled="disabled"></textarea>
							</div>
							<sec:authentication property="principal" var="pinfo" />

							<!-- 작성자와 본인이 일치하지  않으면 수정과 삭제 버튼은 뜨지 않는다. -->
							<sec:authorize access="isAuthenticated()">
								<c:if test="${pinfo.username eq pictureBoard.writer}">
									<button type="button" class="btn btn-md" style="background-color: red; border-color: red; color: white;" onclick="deleteBoard()">삭제</button>
									<button type="button" class="btn btn-info btn-md" onclick="goModifyPage(${pictureBoard.picture_seq})">수정</button>
								</c:if>
							</sec:authorize>

							<button type="button" class="btn btn-md btn-secondary" onclick="location.href='/picture/main'">목록</button>
							<div style="float: right;">

								<input type="hidden" id="writer" value="${pictureBoard.writer }">
								<button type="button" class="btn" style="color: white; font-weight: bold; background-color: green;" onclick="recommandBoard()">
									<i class="fa fa-thumbs-up"></i> 추천
									<div style="display: inline-block;">
										<c:if test="${pictureBoard.recommand_cnt != 0 }">
												${pictureBoard.recommand_cnt }
											</c:if>
									</div>
								</button>

							</div>

						</form>
					</div>


				</div>
			</div>


			<%@ include file="../include/viewProfile.jsp"%>


			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<label for="exampleTextarea1" style="display: block; font-size: 14px; margin-top: 10px;">댓글쓰기</label>
						<div id="countArea">0 / 500 자</div>
						<div class="form-group" style="margin-top: 10px;">
							<!--  -->
							<textarea class="form-control" id="replyArea" rows="4" style="width: 79%;"></textarea>
							<button type="button" class="btn btn-warning btn-fw" style="width: 20%; height: 89px; margin-top: -81px;" onclick="registerReply()">댓글달기</button>
						</div>


						<div class="card-body">

							<c:if test="${fn:length(replyList) > 0}">
								<table class="table">
									<c:forEach items="${replyList }" var="replyList">
										<fmt:formatDate value="${replyList.regdate }" pattern="yyyy-MM-dd HH:mm:ss" var="replyRegiDate" />
										<tr>
											<td>
												<div style="font-weight: bold; display: inline-block;">${replyList.replyer }</div>
												( ${replyRegiDate } )
												<sec:authorize access="isAuthenticated()">
													<c:if test="${pinfo.username eq replyList.replyer}">
														<i class="fa fa-window-close-o overActive" style="color: gray; font-size: 15px; position: absolute; margin-left: 5px;" onclick="deleteReply(this)"></i>
													</c:if>
												</sec:authorize>
											</td>
											<td style="text-align: right;" replySeq="${replyList.reply_seq }" replyer="${replyList.replyer }">
												<button class="btn btn-inverse-primary" value="1" onclick="empathyReply(this)">
													공감
													<c:if test="${ replyList.empathy_yes != 0 }">
														<div style="display: inline-block;">${ replyList.empathy_yes }</div>
													</c:if>
												</button>
												<button class="btn btn-inverse-danger" value="2" onclick="empathyReply(this)">
													비공감
													<c:if test="${ replyList.empathy_no != 0 }">
														<div style="display: inline-block;">${ replyList.empathy_no }</div>
													</c:if>
												</button>
											</td>
										</tr>
										<tr>
											<td>${replyList.reply }</td>
											<td style="text-align: right;"></td>
										</tr>
									</c:forEach>
								</table>
							</c:if>


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
		
		$('#replyArea').keyup(function (e){
		    var content = $(this).val();
		   $('#countArea').html( content.length + " /  500 자");   //글자수 실시간 카운팅

		    if (content.length > 500){
		        alert("최대 500자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 200));
		        $('#countArea').html(" 500 / 500 자");
		    }
		});
		
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
	
	CKEDITOR.instances.contentArea.setData( '${pictureBoard.content }' )
	
	function registerReply(){
		
		var reply = document.getElementById("replyArea").value;
		var newURL = window.location.pathname;
		var boardType = newURL.split("/")[1];
		var boardSeq = newURL.split("/")[3];
		
		$.ajax({
			
			method : 'POST',
			url : '/common/view/registerReply',
			data : {
				'reply' : reply,
				'boardType' : boardType,
				'boardSeq' : boardSeq
			},
			success: function ( result ){

				console.log( result );
				
				if( result == "success" ){
					alert("댓글달기 성공!");
					location.reload();
				}
				
			}	
			
		});
		
	}
	
	/* 사실  위에 completeQuestion과 흡사하므로 하나로 합칠수 있음 .. 다만 나중에 */
	function deleteBoard(){
		$.ajax({
			
			url : '/common/view/deleteBoard',
			method : 'GET',
			data : {
				'writer': document.getElementById("writer").value,
				'boardSeq' : document.getElementById("boardSeq").value,
				'boardType' : '3'
			},
			success : function ( result ){
				alert("delete complete");
				location.href = "/picture/main";
			},
			error : function ( result ){
				alert("internal error occured!!!");	
			}
			
		});
		
	}
	
	
	function recommandBoard(){
		$.ajax({
			
			url : '/common/view/recommandBoard',
			method : 'POST',
			data : {
				'writer': document.getElementById("writer").value,
				'boardSeq' : document.getElementById("boardSeq").value,
				'boardType' : '3'
			},
			success : function ( result ){
				alert("recommand complete");
				location.reload();
			},
			error : function ( result ){
				alert("internal error occured!!!");	
			}
			
		});
		
	}
	
	function empathyReply( val ){
		
		var empathy = val.value;		
		var replySeq = $(val.closest("td")).attr("replyseq");
		var replyer = $(val.closest("td")).attr("replyer");
		var boardSeq = document.getElementById("boardSeq").value;
		
		if( empathy != 1 && empathy != 2 ){
			alert("error occured!");
			return;
		}
		
		$.ajax({
			
			url : '/common/view/empathyReply',
			method : 'POST',
			data : {
				'replyer' : replyer,
				'replySeq' : replySeq,
				'empathy' : empathy,
				'boardSeq' : boardSeq,
				'boardType' : '3'
			},
			success : function ( result ){
				alert("empathy complete");
			},
			error : function ( result ){
				alert("internal error occured!!!");	
			}
			
		});
		
		
	}
	
	function goModifyPage( pageNum ){
		
		location.href="/picture/modify/"+pageNum;
	}
	
	
</script>
</body>
</html>