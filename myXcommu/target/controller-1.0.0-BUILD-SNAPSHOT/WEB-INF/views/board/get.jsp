<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@ include file="../include/header.jsp"%>

<style>
.uploadResult {
	width: 100%;
	background-color: gray;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
	align-content: center;
	text-align: center;
}

.uploadResult ul li img {
	width: 100px;
}

.uploadResult ul li span {
	color: white;
}

.bigPictureWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	width: 100%;
	height: 100%;
	background-color: gray;
	z-index: 100;
	background: rgba(255, 255, 255, 0.5);
}

.bigPicture {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

.bigPictrue img {
	width: 600px;
}
</style>
<link rel="stylesheet" type="text/css" href="/resources/assets/js/dataTables/jquery.dataTables.css">
<title>myXcommu</title>

<div class="main-panel">
	<div class="content-wrapper">
		<!-- Page Title Header Starts-->
		<div class="row page-title-header">
			<div class="col-12">
				<div class="page-header">
					<h4 class="page-title">Board 1</h4>
					<div class="quick-link-wrapper w-80 d-md-flex flex-md-wrap">
						<ul class="quick-links">
							<li><a href="#">ICE Market data</a></li>
							<li><a href="#">Own analysis</a></li>
							<li><a href="#">Historic market data</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- Page Title Header Ends-->
		<div class="row">
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<form class="form-sample" style="width: 100%;">
								<div class="form-group">
									<label>Bno</label> <input class="form-control" name="bno" value='<c:out value="${board.bno }" />' readonly="readonly">
								</div>

								<div class="form-group">
									<label>Title</label> <input class="form-control" name="title" value='<c:out value="${board.title }" />' readonly="readonly">
								</div>

								<div class="form-group">
									<label>Text area</label> <input class="form-control" name="content" value='<c:out value="${board.content }" />' readonly="readonly">
								</div>

								<div class="form-group">
									<label>Writer</label> <input class="form-control" name="writer" value='<c:out value="${board.writer }" />' readonly="readonly">
								</div>


							</form>


							<!-- 현재 접속자가 올린 게시물일 경우 modify 활성화 하기 위한 부분 -->
							<sec:authentication property="principal" var="pinfo" />

							<sec:authorize access="isAuthenticated()">

								<c:if test="${pinfo.username eq board.writer }">

									<button data-oper="modify" class="btn btn-default">Modify</button>

								</c:if>

							</sec:authorize>

							<!-------------------------------------------------->
							<button style="margin-bottom : 10px;" data-oper="list" class="btn btn-info">List</button>
							
							<textarea class="form-control" rows="5" style="width : 100%;"></textarea>

							<form id="operForm" action="/board/modify" method="get">
								<input type="hidden" id="bno" name="bno" value='<c:out value="${board.bno }"/>'> <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }" />'> <input type="hidden" name="amount" value='<c:out value="${cri.amount }" />'> <input type="hidden" name="keyword" value='<c:out value="${cri.keyword }" />'> <input type="hidden" name="type" value='<c:out value="${cri.type }" />'>
							</form>

						</div>

						<div class="row">
							<div class="col-lg-12">
								<div class="panel panel-default">
									<div class="panel-heading">Board Read Page</div>
								</div>



							</div>
						</div>

						<div class="row">

							<div class="col-lg-12">
								<div class="panel panel-default">
									<div class="panel-heading">Files</div>
									<div class="panel-body">
										<div class="uploadResult">
											<ul>
											</ul>
										</div>
									</div>
								</div>
							</div>

						</div>


						<div class="row">

							<div class="col-lg-12">

								<div class="panel panel-default">

									<div class="panel-heading">

										<i class="fa fa-comments fa-fw"></i>Reply

										<!-- 로그인 한 경우에만 보여주기 -->
										<sec:authorize access="isAuthenticated()">
											<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">New Reply</button>
										</sec:authorize>

									</div>
								</div>



								<div class="panel-body">
									<ul class="chat">
									</ul>
								</div>

								<div class="panel-footer"></div>

							</div>

						</div>

						<div class="bigPictureWrapper">
							<div class="bigPicture"></div>
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
			</span> <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted &amp; made with <i class="mdi mdi-heart text-danger"></i>
			</span>
		</div>
	</footer>
	<!-- partial -->
</div>




<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="display: block;">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Reply Modal</h4>
			</div>
			<div class="modal-body">

				<div class="form-group">
					<label>Reply</label> <input class="form-control" name="reply" value="New Reply!!!!">
				</div>
				<div class="form-group">
					<label>Replyer</label> <input class="form-control" name="replyer" value="replyer" readonly="readonly">
				</div>
				<div class="form-group">
					<label>Reply Date</label> <input class="form-control" name="replyDate" value="">
				</div>
			</div>


			<div class="modal-footer">
				<button id="modalModBtn" type="button" class="btn btn-warning">Modify</button>
				<button id="modalRemoveBtn" type="button" class="btn btn-warning">Remove</button>
				<button id="modalRegisterBtn" type="button" class="btn btn-warning">Register</button>
				<button id="modalCloseBtn" type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<script type="text/javascript" charset="utf8" src="/resources/assets/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/assets/js/reply.js"></script>
<script>


	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	

	$(document).ajaxSend( function ( e, xhr, options ) {
			
		xhr.setRequestHeader( csrfHeaderName, csrfTokenValue) ;

		console.log( "csrfHeaderName : " + csrfHeaderName );
		console.log( "csrfTokenValue : " + csrfTokenValue );
	});
	
	var bnoValue = '<c:out value="${board.bno}"/>';
	var replyUL = $(".chat");
	
	showList( 1 );
	
	console.log( replyService );
	
	
	function showList( page ){
		
		console.log( "show list : " + page  );
			
		replyService.getList( { bno:bnoValue, page : page || 1  }, function( replyCnt, list ) {
			
			console.log("replyCnt : " + replyCnt );
			console.log("list : " + list );
			console.log( replyCnt );
			console.log( list );
			
			if( page == -1 ){
				pageNum_temp = Math.ceil( replyCnt / 10.0 );
				showList( pageNum_temp );
				return;
			}
			
			var str = "";
			
			if( list == null || list.length == 0 ){
				/* replyUL.html(""); */
				return;
			}
			
			for( var i = 0, len = list.length || 0; i < len; i++ ){
				
				str += "<li class='left clearfix' data-rno='" + list[i].rno + "'>";
				str += "<div><div class='header'><strong class='primary-font'>[" + list[i].rno +"] " + list[i].replyer + "</strong>";
				str += "<small class='pull-right text-muted'>" + replyService.displayTime( list[i].replyDate ) + "</small></div>";
				str += "<p>" + list[i].reply + "</p></div></li>";
					
			
			}
			
			replyUL.html( str );
			
		}  );
		
	}
	
	var pageNum = 1;
	var replyPageFooter = $(".panel-footer");
	
	function showReplyPage( replyCnt ){
		
		var endNum = Math.ceil( pageNum / 10.0 ) * 10;
		var startNum = endNum - 9;
		
		var prev = startNum != 1;
		var next = false;
		
		if( endNum * 10 >= replyCnt ){
			endNum = Math.ceil( replyCnt / 10.0 );
		}
		
		if( endNum * 10 < replyCnt ){
			next = true;
		}
		
		var str = "<ul class='pagination pull-right'>";
		
		if( prev ){
			str += "<li class='page-item'><a class='page-link' href='" + ( startNum -1 ) + "'>Previous</a></li>";
		}
		
		for( var i = startNum ; i <= endNum; i++ ){
			var active = pageNum == i ? "active" : "";
			
			str += "<li class='page-item " + active + " '><a class='page-link' href='" + i + "'>" + i + "</a></li>";
			
		}
		
		if( next ){
			str += "<li class='page-item'><a class='page-link' href='" + ( endNum + 1 ) +"'>Next</a></li>";
		}
		
		str += "</ul></div>";
		
		console.log( "str!! : " + str );
		
		replyPageFooter.html( str );
		
		replyUL.html( str );
		showReplyPage( replyCnt );
		
	}
	
	
	var modal = $(".modal");
	var modalInputReply 	= modal.find("input[name='reply']");
	var modalInputReplyer 	= modal.find("input[name='replyer']");
	var modalInputReplyDate = modal.find("input[name='replyDate']");

	var modalModBtn 		= $("#modalModBtn");
	var modalRemoveBtn 		= $("#modalRemoveBtn");
	var modalRegisterBtn	= $("#modalRegisterBtn");
	
	var replyer = null;
	
	<sec:authorize access="isAuthenticated()">
	
	replyer = '<sec:authentication property="principal.username"/>';
	
	</sec:authorize>
	
	
	
	
	$("#addReplyBtn").on("click", function( e ) {
		
		modal.find("input").val("");
		modal.find("input[name='replyer']").val( replyer );
		modalInputReplyDate.closest("div").hide();
		modal.find("button[id !='modalCloseBtn' ]").hide();
		modalRegisterBtn.show();
		
		$(".modal").modal("show");
		
	});
	
	// 기본설정 ( 매번 ajaxㅇ 사용시 beforeSend를 호출하는 번거로움을 줄일 수 있다. )
	$(document).ajaxSend( function ( e, xhr, options ){
		
		xhr.setRequestHeader( csrfHeaderName, csrfTokenValue );
		
	});
	
	
	modalRegisterBtn.on("click", function( e ) {
		
		
		var reply = { 
				
				reply : modalInputReply.val(),
				replyer : modalInputReplyer.val(),
				bno : bnoValue
				
		};
		
		replyService.add( reply, function( result ){
			
			alert( result );
			
			modal.find("input").val("");
			modal.modal("hide");
			
			/* showList( 1 ); */
			showList( -1 );
			
		});
		
		
		
	});
	
	$(".chat").on("click", "li", function( e ) {
		
		var rno = $(this).data("rno");
		
		replyService.get( rno, function( reply ) {
			
			modalInputReply.val( reply.reply );
			modalInputReplyer.val( reply.replyer );
			modalInputReplyDate.val( replyService.displayTime( reply.replyDate )  ).attr("readonly", "readonly");
			modal.data("rno", reply.rno);
			
			modal.find("button[id != 'modalCloseBtn' ]").hide();
			modalModBtn.show();
			modalRemoveBtn.show();
			
			$(".modal").modal("show");
			
		});
		
	});
	

	//댓글 수정버튼을 클릭한 경우
	modalModBtn.on("click", function(e) {
		
		var originalReplyer = modalInputReplyer.val();
		
		var reply = {
			rno : modal.data("rno"),
			reply : modalInputReply.val(),
			replyer : originalReplyer
				
		};
		
		if( !replyer ){
			alert("로그인후 수정이 가능하니다.");
			modal.modal("hide");
			return;
		}
		
		console.log("Original Replyer : " + originalReplyer );
		console.log("This log loc is ::::: modalModBtn ");
		
		if( replyer != originalReplyer ){
		
			alert("자신이 작성한 댓글만 수정이 가능합니다.");
			modal.modal("hide");
			return;
		}
		
		
		replyService.update( reply, function(result) {
			
			alert( result );
			modal.modal("hide");
			showList( pageNum ); // 여기서 pageNum으로 바꾸라는데 그럼pageNum이 애초에 전역변수여야하는데 시발 뭐지;
			
		});
		
	});
	
	
	modalRemoveBtn.on("click", function(e) {
		
		var rno = modal.data("rno");
		
		console.log("Rno : " + rno );
		console.log("Replyer : " + replyer );
		
		if( !replyer ){
			alert("로그인후 삭제가 가능합니다.");
			modal.modal("hide");
			return;
		}
		
		
		var originalReplyer = modalInputReplyer.val();
		
		console.log("Original Replyer : " + originalReplyer );
		
		if( replyer != originalReplyer ){
			alert("자신이 작성한 댓글만 삭제가 가능합니다.");
			modal.modal("hide");
			return;
		}
		
	
		replyService.remove( rno, originalReplyer, function(result) {
			
			alert( result );
			modal.modal("hide");
			showList( pageNum );
			location.reload();
						
		});
		
	});
	
	replyPageFooter.on("click", "li a ", function(e) {
		
		e.preventDefault();
		
		console.log("page click");
		
		var targetPageNum = $(this).attr("href");
		
		console.log(" targetPageNum : " + targetPageNum);
		
		showList( targetPageNum );
		
	});
	
	
</script>
<script>
	
	$(document).ready(function(){
		
		
		( function(){
			
			var bno = '<c:out value="${board.bno}"/>';
			
			$.getJSON("/board/getAttachList", {bno : bno}, function( arr ) {
				
				console.log( arr );
				
				
				var str = "";
				
				$(arr).each( function ( i, attach ){
					
					if( attach.fileType ){
						
						var fileCallPath = encodeURIComponent( attach.uploadPath + "/s_" + attach.fileName );
						str += "<li data-path='" + attach.uploadPath + "'data-uuid='" + attach.uuid + "'data-filename='" + attach.fileName + " 'data-type='" + attach.fileType +"'><div>'";
						str += "<img src='display?fileName=" + fileCallPath + "'>";
						str += "</div>";
						str += "</li>";
						
					} else {
						
						str += "<li data-path='" + attach.uploadPath + "'data-uuid='" + attach.uuid + "'data-filename='" + attach.fileName + " 'data-type='" + attach.fileType +"'><div>'";
						str += "<span> " + attach.fileName + "</span><br/>";
						str += "<img src='/resources/img/attach.png'>";
						str += "</div>";
						str += "</li>";
						
					}
					
				});
				
				$(".uploadResult ul").html( str );
				
			});
			
			
		})();
		
		
		var operForm = $("#operForm");
		
		$("button[data-oper='modify']").on("click",function(){
			
			operForm.attr("action", "/board/modify").submit();
			
		});
		
		$("button[data-oper='list']").on("click", function(){
			
			operForm.find("#bno").remove();
			operForm.attr("action","/board/list");
			operForm.submit();
			
		});
		
		$(".uploadResult").on("click", "li", function( e ) {
			
			console.log(" view image ");
			
			var liObj = $(this);
			var r_path = liObj.data("path").replace(/(\s*)/g, "") ;
			var r_fileName = liObj.data("filename").replace(/(\s*)/g, "") ;
			console.log( liObj ); //위에 hidden 에서 넘길때 뭔가 빈칸이 같이 넘어가는거같음 일단 
			var path = encodeURIComponent( r_path + "/s_" + r_fileName );
			
			if( liObj.data("type") ) {
				showImage( path.replace (new RegExp(/\\/g), "/"  ) );				
			} else {
				self.location = "/download?fileName=" + path;
			}

		});
		
		
		$(".bigPictureWrapper").on("click", function ( e ) {
			
			$(".bigPicture").animate( { width : '0%', height : '0%' }, 1000 );
			setTimeout( function (){
				$(".bigPictureWrapper").hide();
			}, 1000);
			
		});
		
		
	});
	
	
	function showImage ( fileCallPath ) {
		
		alert( fileCallPath );
		
		$(".bigPictureWrapper").css("display", "flex").show();
		$(".bigPicture").html
		( "<img src='display?fileName=" + fileCallPath + "'>" ).animate( { width : '100%', height : '100%' }, 1000 );
		
		
	}
	
</script>


<%@ include file="../include/footer.jsp"%>