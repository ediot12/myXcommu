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
<!-- partial -->
<div class="main-panel">
	<div class="content-wrapper">
		<div class="row">

			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<h4 class="page-title" style="font-size : 10pt; color : gray; font-weight: 1000; margin-left: 30px; margin-top: 20px; margin-bottom: -30px;">자유게시판 >> 게시글</h4>
					<div class="card-body">
						<form class="forms-sample" method="post" action="/">
							<div class="form-group">
								<input type="hidden" value="${board.free_board_seq }" id="boardSeq">
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
									<button type="button" class="btn btn-md" style="background-color: red; border-color: red; color: white;" onclick="deleteBoard()"><i class="fa fa-recycle"></i>삭제</button>
									<button type="button" class="btn btn-info btn-md" onclick="goModifyPage(${board.free_board_seq})"><i class="fa fa-edit"></i>수정</button>
								</c:if>
							</sec:authorize>
							
							<button type="button" class="btn btn-md btn-secondary" onclick="location.href='/free/main'"><i class="fa fa-list"></i>목록</button>
							<div style="float: right;">

							<input type="hidden" id="writer" value="${board.writer }">							
							<input type="hidden" id="reporter" value="${sessionScope.currentUserId}">
							<input type="hidden" id="boardType" value="6">
							<sec:authorize access="isAuthenticated()">
								<c:if test="${pinfo.username ne board.writer}">
									<button type="button" class="btn btn-danger"  data-toggle="modal" href="#reportModal" style="color : white; font-weight : bold; font-size : 9pt;"><i class="ti-alert"></i>신고</button>
								</c:if>
							</sec:authorize>

							</div>
						</form>
					</div>
				</div>
			</div>

			
					<%@ include file="../include/viewProfile.jsp"%>


			<div class="col-md-12 grid-margin stretch-card">
			<div class="card">
				<div>
					<div id="replyCount" style="text-align : left; padding-left: 30px; padding-top: 20px; display : inline-block;">댓글 ( )</div>
					<div id="countArea" style="text-align : right; padding-right: 45px; padding-top: 20px; display : inline-block; float : right;">0 / 500 자</div>
				</div>
				<div class="card-body" style="padding-top : 0px;">
					<div class="form-group" style="margin-top: 10px; width : 100%;">
						<!--  -->
						<textarea class="form-control" id="replyArea" rows="4" style="width: 88%;"></textarea>
						<button type="button" class="btn btn-warning btn-fw" style="width: 10%; height: 89px; display: inline-block; margin-top: -82px;" onclick="registerReply()">
							<i class="fa fa-comment-o"></i>댓글달기
						</button>
					</div>
					
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
												<i class="fa fa-thumbs-o-up"></i>공감
												<c:if test="${ replyList.empathy_yes != 0 }">
													<div style="display: inline-block;">${ replyList.empathy_yes }</div>
												</c:if>
											</button>
											<button class="btn btn-inverse-danger" value="2" onclick="empathyReply(this)">
												<i class="fa fa-thumbs-o-down"></i>비공감
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
			
			
			<div class="col-lg-12 grid-margin stretch-card">
				
				<div class="card">
					<div class="card-body">
						<div class="col-12">
							<div class="page-header">
								<h4 class="page-title" style="font-weight: 1000; display : inline-block;">자유게시판</h4>
								<span class="bar" style="font-size : 17pt; color : #aaa;">|</span>
								총 ${fn:length(freeBoardList)} 건의 게시글을 보관중
							</div>
						</div>
						
						<table class="table table-hover" id="freeBoardTable">
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
								<c:forEach items="${freeBoardList }" var="list">
									<tr>
										<td>${list.free_board_seq }</td>
										<td>
											<a href="/free/view/${list.free_board_seq }">
												${list.subject }
												<c:if test="${list.reply_cnt != 0 }">
													<div style="display:inline-block; color: green; font-weight: bold;">
														[ ${list.reply_cnt } ]
													</div>
												</c:if>
											</a>
										</td>
										<td>${list.writer }</td>
										<td>
											<fmt:formatDate value="${list.regdate }" pattern="HH:mm" var="todayRegiDate"/>
											<fmt:formatDate value="${list.regdate }" pattern="MMdd" var="regiDate"/>
											<fmt:formatDate value="${list.regdate }" pattern="yy.MM.dd" var="markDate"/>
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

						<button type="button" onclick="location.href='/free/register'"  class="btn btn-outline-primary btn-fw" style="float: right; margin-top : 10px;">
							글쓰기
						</button>
					</div>
				</div>
			</div>

		</div>

	</div>

	<!-- partial -->
</div>
<!-- main-panel ends -->
<%@ include file="../include/footer.jsp"%>



<!-- <script type="text/javascript" charset="utf8" src="/resources/assets/js/shared/jquery-1.12.4.min.js"></script> -->
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
		
		document.getElementById("replyCount").innerHTML = "댓글 ( ${fn:length(replyList)} )";
		
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
	
	CKEDITOR.instances.contentArea.setData( '${board.content }' );
	CKEDITOR.instances.contentArea.config.readOnly = true;
	
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
				'boardType' : 6,
				'boardSeq' : boardSeq
			},
			success: function ( result ){

				console.log( result );
				
				if( result == "success" ){
					
					$.toast({
				      text: '댓글이 등록되었습니다.',
				      showHideTransition: 'slide',
				      icon: 'info',
				      loaderBg: '#f96868',
				      position: 'bottom-left'
				    });
					
				    setTimeout( function(){
				    	location.reload();
				    },  1000, );
				}
				
			}	
			
		});
		
	}
	
	function completeQuestion(){
		
		$.ajax({
			
			url : 'completeQuestion',
			method : 'POST',
			data : {
				'writer': document.getElementById("writer").value
			},
			success : function ( result ){
				swal("질문이 종료되었습니다.", {
				      icon: "success",
				    });
				
			    setTimeout( function(){
			    	location.href = "/free/main";
			    },  1000, );
			    
			    
			},
			error : function ( result ){
				swal("에러가 발생했습니다.", {
				      icon: "error",
			    });
				console.log( result );
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
							'boardType' : '6'
						},
						success : function ( result ){
							swal("삭제되었습니다.", {
							      icon: "success",
							    });
							    setTimeout( function(){
							    	location.href = "/free/main";
							    },  1000, );
						},
						error : function ( result ){
							alert("internal error occured!!!");	
						}
						
					});
				
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
				'boardType' : '6'
			},
			success : function ( result ){
				swal("공감하였습니다.", {
				      icon: "success",
			    });
			},
			error : function ( result ){

				if( result.responseText == 'fail_1' ){
					swal("이미 공감을 누르셨습니다.", {
					      icon: "error",
				    });
				}
				if( result.responseText == 'fail_2' ){
					swal("본인 글에는 공감 할 수 없습니다.", {
					      icon: "error",
				    });
				}
				
				console.log( result );	
			}
			
		});
		
		
	}
	
	function goModifyPage( pageNum ){
		
		location.href="/free/modify/"+pageNum;
	}
	
function deleteReply( val ){
		
		// 일부러 이렇게 해봤음.
		var replySeq = $($($(val.parentNode.parentNode)[0]).find("td")[1]).attr("replySeq");
		var replyer = $($($(val.parentNode.parentNode)[0]).find("td")[1]).attr("replyer");
		
		swal({
			  title: "댓글이 삭제됩니다. 계속하시겠습니까?",
			  icon: "error",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				  
				  $.ajax({
						
						url : '/common/view/deleteReply',
						method : 'GET',
						data : {
							'replySeq' : replySeq,
							'replyer' : replyer
						} ,
						success : function(e){
							swal("삭제되었습니다.", {
							      icon: "success",
						    });
						    setTimeout( function(){
						    	location.reload();
						    },  1000, );
							
						},
						error : function ( e ){
							console.log( e );
							swal("에러가 발생했습니다.", {
							      icon: "error",
						    });
						}
						
					});
				
			  }
			});
	}
	
	
</script>
</body>
</html>