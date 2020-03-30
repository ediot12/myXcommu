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
<fmt:formatDate value="${pictureBoard.regdate }" pattern="yyyy-MM-dd HH:mm:ss" var="regiDate" />
<fmt:formatDate value="${contentRegiDate }" pattern="yyyy-MM-dd" var="joinDate" />
<fmt:formatDate value="${userConnectDate }" pattern="yyyy-MM-dd" var="connDate" />
<!-- partial -->
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
							<h1 style="font-family: 'NanumGothic'; font-weight: bold; display: inline-block;">${pictureBoard.subject }</h1>
							<div style="display: inline-block; float: right; padding-top: 15px; font-size: 10pt;">
								${regiDate } <span class="bar">|</span> 조회 ${pictureBoard.view_cnt }
							</div>



						</div>
						<div class="form-group">
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
		
		<div class="col-lg-12 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">

					<div class="row">
						<div class="col-12">
							<div class="page-header">
								<h4 class="page-title" style="font-weight: 1000; display : inline-block;">사진게시판</h4>
								<span class="bar" style="font-size : 17pt; color : #aaa;">|</span>
								총 ${fn:length(pictureList)} 건의 게시글을 보관중
							</div>
						</div>
						<!-- <h4 class="card-title">Basic Table</h4> -->
						<table class="table" id="pictureBoardTable">
							<thead>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
							</thead>
							<tbody>
								<c:forEach items="${pictureList}" var="pictureList" varStatus="status">
									<fmt:formatDate value="${pictureList.regdate}" pattern="yy-MM-dd" var="regDate" />
									
									<c:if test="${status.count % 5 == 1 }">
										<tr>
									</c:if>

									<td style="border: 1px solid #A9D0F5; width: 175px;" onclick="location.href='/picture/view/${pictureList.picture_seq}';">
										<div style="vertical-align: top; height: 130px; text-align: center;">
											<img src="${pictureList.base64_code }" style="width: 120px; height: 130px;">
										</div>
										<div style="vertical-align: bottom; height: 15px; font-weight: bold;">${pictureList.subject }
											<c:if test="${pictureList.reply_cnt != 0 }">
												<div style="color: green; font-weight: bold; display: inline-block;">[ ${pictureList.reply_cnt } ]</div>
											</c:if>
										</div>
										<div style="vertical-align: bottom; height: 15px; color: #A4A4A4;">
											<div style="display: inline-block;">조회 수 ${pictureList.view_cnt }</div>
											<div style="display: inline-block; margin-left: 5px;">|| ${regDate}</div>
										</div>
										<div style="vertical-align: bottom; height: 15px;">${pictureList.writer }</div>
									</td>

									<c:if test="${status.count % 5 == 0 }">

										</tr>
									</c:if>


								</c:forEach>
							</tbody>
						</table>

						<button type="button" onclick="location.href='/picture/register'" class="btn btn-outline-primary btn-fw" style="float: right; margin-top: 10px;">글쓰기</button>
					</div>
				</div>
			</div>
		</div>


	</div>

</div>
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
		   }
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
							'boardType' : '3'
						},
						success : function ( result ){
							swal("삭제되었습니다.", {
							      icon: "success",
							    });
							    setTimeout( function(){
							    	location.href = "/picture/main";
							    },  3000, );
						},
						error : function ( result ){
							alert("internal error occured!!!");	
						}
						
					});
				
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