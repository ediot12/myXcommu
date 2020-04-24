<!DOCTYPE html>
<html lang="ko">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<head>

<link rel="stylesheet" type="text/css" href="/resources/assets/js/dataTables/jquery.dataTables.css">
<title>myXcommu</title>
<!-- plugins:css -->

<%@ include file="../include/header.jsp"%>
<!-- partial -->
	<div class="content-wrapper">
		<!-- Page Title Header Starts-->
		<div class="row page-title-header">
			<div class="col-12">
				<div class="page-header">
					
				</div>
			</div>

		</div>
		<!-- Page Title Header Ends-->

		<div class="row">

			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<h4 class="page-title" style="font-size : 10pt; color : gray; font-weight: 1000; margin-left: 30px; margin-top: 20px; margin-bottom: -30px;">사진게시판 >> 게시글수정</h4>
					<div class="card-body">
						<form class="forms-sample" method="post" id="mainForm" action="updatePictureBoard">
							<div class="form-group">
								<input type="hidden" value="${pictureBoard.picture_seq }" name="boardSeq">
								<label for="questionSubject">제목</label> 
								<input type="text" class="form-control" id="questionSubject" name="subject" value="${pictureBoard.subject }" placeholder="제목을 적어주세요.">
							</div>
							<div class="form-group">
								<label for="questionDivision">구분</label>
								<select class="form-control" id="questionDivision" name="division">
									<option value="p1" <c:if test="${pictureBoard.division eq 'p1'}">selected</c:if>>일상사진</option>
									<option value="p2" <c:if test="${pictureBoard.division eq 'p2'}">selected</c:if>>기타</option>
								</select>
							</div>
							<div class="form-group">
								<label for="questionArea">내용</label>
								<textarea class="form-control" name="content" id="contentArea" rows="2"></textarea>
							</div>
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
							<button type="button" class="btn btn-success mr-2" onclick="submitForm()"><i class="fa fa-pencil-square-o"></i>등록</button>
							<button type="button" class="btn btn-md btn-secondary" onclick="location.href='/picture/main'"><i class="fa fa-list"></i>목록</button>
							
						</form>
					</div>
				</div>
			</div>




		</div>

	</div>
<!-- main-panel ends -->
<%@ include file="../include/footer.jsp"%>



<script type="text/javascript" charset="utf8" src="/resources/assets/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/assets/ckeditor/ckeditor.js"></script>
<script>

	CKEDITOR.replace('contentArea', {
		height : 600
	});
	
	$(document).ready( function(e) {
		
		CKEDITOR.instances.contentArea.setData('${pictureBoard.content}');
		
	});
	
	function submitForm(){
		
		var data = CKEDITOR.instances.pictureArea.getData();
		var patt = new RegExp("data:image");
		var stringCount = CKEDITOR.instances.pictureArea.getData().length;
		
		if( stringCount > 2000000 ){
			alert("이미지 용량이 크거나 글이 너무 깁니다.");
			return;
		}
		
		if( patt.test( data ) == true ){
			document.getElementById("mainForm").submit();	
		} else {
			alert("이미지를 올려라 씨발아");
		}
		
		
		
	}
</script>
</body>
</html>