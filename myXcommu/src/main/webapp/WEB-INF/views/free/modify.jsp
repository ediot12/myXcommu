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
				
			</div>
		</div>

	</div>
	<!-- Page Title Header Ends-->

	<div class="row">

		<div class="col-md-12 grid-margin stretch-card">
			<div class="card">
				<h4 class="page-title" style="font-size : 10pt; color : gray; font-weight: 1000; margin-left: 30px; margin-top: 20px; margin-bottom: -30px;">자유게시판 >> 게시글수정</h4>
				<div class="card-body">
					<form class="forms-sample" method="post" action="updateFreeBoard" enctype="multipart/form-data">
						<div class="form-group">
							<label for="freeSubject" style="margin-top : 20px;">제목</label> <input type="text" class="form-control" id="freeSubject" name="subject" value="${board.subject }" placeholder="제목을 적어주세요.">
						</div>
						<div class="form-group">
							<label for="freeArea">내용</label>
							<textarea class="form-control" name="content" id="freeArea" rows="2"></textarea>
						</div>
						<input type="hidden" name="boardSeq" value="${board.free_board_seq }"> <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
						<button type="submit" class="btn btn-success mr-2"><i class="fa fa-pencil-square-o"></i>등록</button>
						<button type="button" class="btn btn-md btn-secondary" onclick="location.href='/free/main'"><i class="fa fa-list"></i>목록</button>

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
	CKEDITOR.replace('freeArea', {
		height : 600
	});

	$(document).ready(function(e) {

		CKEDITOR.instances.freeArea.setData('${board.content}');

	});
</script>
</body>
</html>