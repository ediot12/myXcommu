<!DOCTYPE html>
<html lang="ko">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<head>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />

<title>myXcommu</title>
<!-- plugins:css -->

<%@ include file="../include/header.jsp"%>
<!-- partial -->
<div class="content-wrapper">
	<!-- Page Title Header Starts-->
	<div class="row page-title-header">
		<div class="col-12">
			<div class="page-header">
				<!-- <h4 class="page-title" style="font-weight: 1000;">자유게시판 - 새글</h4> -->
			</div>
		</div>

	</div>
	<!-- Page Title Header Ends-->

	<div class="row">

		<div class="col-md-12 grid-margin stretch-card">
			<div class="card">
				<h4 class="page-title" style="font-size : 10pt; color : gray; font-weight: 1000; margin-left: 30px; margin-top: 20px; margin-bottom: -30px;">자유게시판 >> 새글</h4>
				<div class="card-body">
					<form class="forms-sample" method="post" id="freeFrom" action="registerFreeBoard" enctype="multipart/form-data">
						<div class="form-group">
							<label for="freeSubject" style="margin-top : 20px;">제목</label> <input type="text" class="form-control" id="freeSubject" name="subject" placeholder="제목을 적어주세요.">
						</div>
						<div class="form-group">
							<label for="freeArea">내용</label>
							<textarea class="form-control" name="content" id="freeArea" rows="2"></textarea>
						</div>
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
						<input type="hidden" name="writer" value="${sessionScope.currentUserId}">						
						<button type="button" class="btn btn-outline-success mr-2" onclick="registerFreeBoard()"><i class="fa fa-pencil-square-o"></i>등록</button>
						<button type="button" class="btn btn-md btn-secondary" onclick="location.href='/free/main'"><i class="fa fa-list"></i>목록</button>

					</form>
				</div>
			</div>
		</div>




	</div>

</div>
<!-- main-panel ends -->
<%@ include file="../include/footer.jsp"%>



<!-- <script type="text/javascript" charset="utf8" src="/resources/assets/js/shared/jquery-1.12.4.min.js"></script> -->
<script type="text/javascript" src="/resources/assets/ckeditor/ckeditor.js"></script>
<script>
	CKEDITOR.replace('freeArea', {
		height : 600,
	});
	
	$(document).ready( function(e) {
		
		$('#freeSubject').keyup(function (e){
		    var content = $(this).val();
		    

		    if (content.length > 40){
		    	$.toast({
				      text: '최대 40자까지 가능합니다.',
				      showHideTransition: 'slide',
				      icon: 'info',
				      loaderBg: '#f96868',
				      position: 'bottom-left'
				});
		        $(this).val(content.substring(0, 40));
		    }
		});
		
	});
	
	function registerFreeBoard(){
		
		
		var stringCount = CKEDITOR.instances.freeArea.getData().length;
		
		if( stringCount > 2000000 ){
			alert("이미지 용량이 크거나 글이 너무 깁니다.");
			return;
		}
		
		document.getElementById("freeFrom").submit();		
		
	}
</script>
</body>
</html>