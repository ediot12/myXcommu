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
<div class="main-panel">
	<div class="content-wrapper">
		<!-- Page Title Header Starts-->
		<div class="row page-title-header">
			<div class="col-12">
				<div class="page-header">
					<h4 class="page-title" style="font-weight: 1000;">사진게시판 - 새글</h4>
				</div>
			</div>

		</div>
		<!-- Page Title Header Ends-->

		<div class="row">

			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<form class="forms-sample" method="post" action="registerQuestion" enctype="multipart/form-data">
							<div class="form-group">
								<label for="pictureSubject">제목</label> 
								<input type="text" class="form-control" id="pictureSubject" name="subject" placeholder="제목을 적어주세요.">
							</div>
							<div class="form-group">
								<label for="pictureDivision">구분</label>
								<select class="form-control" id="pictureDivision" name="division">
									<option value="p1">일상사진</option>
									<option value="p2">기타</option>
								</select>
							</div>
							<!-- <div class="form-group">
								<label>첨부파일 </label>
								<div class="input-group col-xs-12">
									<input type="text" class="ipt form-control file-upload-info" readonly="readonly" style="width: 200px; height: 20px;" />
									<input type="file" name="uploadFile" id="upload" />
								</div>
							</div> -->
							<div class="form-group">
								<label for="questionArea">내용</label>
								<textarea class="form-control" name="content" id="pictureArea" rows="2"></textarea>
							</div>
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
							<button type="submit" class="btn btn-success mr-2">등록</button>
							<button type="button" class="btn btn-md btn-secondary" onclick="location.href='/qna/main'">목록</button>
							
						</form>
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



<script type="text/javascript" charset="utf8" src="/resources/assets/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/assets/ckeditor/ckeditor.js"></script>
<script>

	CKEDITOR.replace('pictureArea', {
		height : 300
	});
	
	$("input[type='file']").change( function( e ) {
		
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		
		for( var i = 0; i < files.length; i++ ){
			
			if( !checkExtension( files[i].name, files[i].size ) ){
				return false;
			}
			
			formData.append("uploadFile", files[i]);
		}
		
		console.log( formData );
	
	});
</script>
</body>
</html>