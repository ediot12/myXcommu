<!DOCTYPE html>
<html lang="ko">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<head>

<title>myXcommu</title>
<!-- plugins:css -->

<%@ include file="../include/header.jsp"%>
<!-- partial -->
	<div class="content-wrapper">
		<!-- Page Title Header Starts-->
		<div class="row page-title-header">
			<div class="col-12">
				<div class="page-header">
					<h4 class="page-title" style="font-weight: 1000;">공지사항 - 게시글수정</h4>
				</div>
			</div>

		</div>
		<!-- Page Title Header Ends-->

		<div class="row">
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<form class="forms-sample" method="post" id="noticeForm" action="updateNotice" enctype="multipart/form-data">
							<div class="form-group">
								<label for="noticeSubject">제목</label> 
								<input type="text" class="form-control" id="noticeSubject" name="subject" value="${board.subject }" placeholder="제목을 적어주세요.">
							</div>
							<div class="form-group">
								<label for="noticeArea">내용</label>
								<textarea class="form-control" name="content" id="noticeArea" rows="2"></textarea>
							</div>
							<input type="hidden" name="boardSeq" value="${board.notice_seq }">
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
							<button type="button" class="btn btn-success mr-2" onclick="registerBoard()"><i class="fa fa-pencil-square-o"></i>등록</button>
							<button type="button" class="btn btn-md btn-secondary" onclick="location.href='/notice/main'"><i class="fa fa-list"></i>목록</button>
							
						</form>
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

	CKEDITOR.replace('noticeArea', {
		height : 600
	});
	
	$(document).ready( function(e) {
		
		CKEDITOR.instances.noticeArea.setData('${board.content}');
		
	});
	
	function registerBoard(){
		
		var stringCount = CKEDITOR.instances.noticeArea.getData().length;
		
		if( stringCount > 2000000 ){
			alert("이미지 용량이 크거나 글이 너무 깁니다.");
			return;
		}
		
		document.getElementById("noticeForm").submit();		
		
	}
</script>
</body>
</html>