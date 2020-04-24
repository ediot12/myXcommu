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
				<!-- <h4 class="page-title" style="font-weight: 1000;">질문게시판 - 새글</h4> -->
			</div>
		</div>

	</div>
	<!-- Page Title Header Ends-->

	<div class="row">

		<div class="col-md-12 grid-margin stretch-card">
			<div class="card">
				<h4 class="page-title" style="font-size : 10pt; color : gray; font-weight: 1000; margin-left: 30px; margin-top: 20px; margin-bottom: -30px;">질문게시판 >> 새글</h4>
				<div class="card-body">
					<form class="forms-sample" method="post" id="questionForm" action="registerQuestion" enctype="multipart/form-data">
						<div class="form-group">
							<label for="questionSubject" style="margin-top : 20px;">제목</label> <input type="text" class="form-control" id="questionSubject" name="subject" placeholder="제목을 적어주세요.">
						</div>
						<div class="form-group">
							<label for="questionDivision">구분</label>
							<select class="form-control" id="questionDivision" name="division">
								<option value="q1">질문유형1</option>
								<option value="q2">질문유형2</option>
							</select>
						</div>
						<div class="form-group">
							<label>첨부파일 </label>
							<!-- <input type="file" name="uploadFile" class="file-upload-default"> -->
							<div class="input-group col-xs-12">
								<!-- <input type="text" class="form-control file-upload-info" disabled="" placeholder="첨부파일 올릴라면 올려"> <span class="input-group-append">
										<button class="file-upload-browse btn btn-info" for="ex_filename" type="button">Upload</button>
									</span> -->
								<input type="text" class="ipt form-control file-upload-info" readonly="readonly" style="width: 200px; height: 30px;" /> <input type="file" name="uploadFile" id="upload" />
							</div>
						</div>
						<div class="form-group">
							<label for="questionArea">내용</label>
							<textarea class="form-control" name="content" id="questionArea" rows="2"></textarea>
						</div>
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
						<button type="button" class="btn btn-success mr-2" onclick="registerBoard()"><i class="fa fa-pencil-square-o"></i>등록</button>
						<button type="button" class="btn btn-md btn-secondary" onclick="location.href='/qna/main'"><i class="fa fa-list"></i>목록</button>

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
	CKEDITOR.replace('questionArea', {
		height : 600
	});

	$("input[type='file']").change(function(e) {

		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;

		for (var i = 0; i < files.length; i++) {

			if (!checkExtension(files[i].name, files[i].size)) {
				return false;
			}

			formData.append("uploadFile", files[i]);
		}

		console.log(formData);

	});
	
	$(document).ready( function(e) {
		
		$('#questionSubject').keyup(function (e){
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
	
	
	function registerBoard(){
		
		
		var stringCount = CKEDITOR.instances.questionArea.getData().length;
		
		if( stringCount > 2000000 ){
			alert("이미지 용량이 크거나 글이 너무 깁니다.");
			return;
		}
		
		document.getElementById("questionForm").submit();		
		
	}
</script>
</body>
</html>