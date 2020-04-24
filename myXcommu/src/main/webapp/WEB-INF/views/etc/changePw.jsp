<!DOCTYPE html>
<html lang="ko">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<head>
<!-- Required meta tags -->

<title>myXcommu</title>
<!-- plugins:css -->

<%@ include file="../include/header.jsp"%>
<jsp:useBean id="currentDate" class="java.util.Date" />
<fmt:formatDate value="${currentDate}" pattern="MMdd" var="nowDate" />


<!-- partial -->
	<div class="content-wrapper">
		<!-- Page Title Header Starts-->
		<!-- Page Title Header Ends-->

		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">비밀번호 변경</h4>
						<form class="forms-sample">
							<div class="form-group">
								<label for="exampleInputEmail1">아이디</label> 
								<input type="email" class="form-control" id="userid" readonly="readonly" value="${member.userid}">
							</div>
							<div class="form-group">
								<label for="originPw">기존 비밀번호</label> 
								<input type="password" class="form-control" id="originPw">
							</div>
							<div class="form-group">
								<label for="newPw">새 비밀번호</label> 
								<input type="password" class="form-control" id="newPw">
							</div>
							<div class="form-group">
								<label for="newPwCheck">새 비밀번호 확인</label> 
								<input type="password" class="form-control" id="newPwCheck">
							</div>
							<button type="button" class="btn btn-success mr-2" onclick="checkAccount()">변경</button>
							<button class="btn btn-light" onclick="history.go(-2)">뒤로</button>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
<!-- main-panel ends -->
<%@ include file="../include/footer.jsp"%>



<script type="text/javascript" charset="utf8" src="/resources/assets/js/shared/jquery-1.12.4.min.js"></script>
<script>

	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	
	
	$(document).ajaxSend( function ( e, xhr, options ) {
			
		xhr.setRequestHeader( csrfHeaderName, csrfTokenValue);
	
		console.log( "csrfHeaderName : " + csrfHeaderName );
		console.log( "csrfTokenValue : " + csrfTokenValue );
	});

	function checkAccount(){

		var originPw = document.getElementById("originPw").value;
		var newPw = document.getElementById("newPw").value;
		var newPwCheck = document.getElementById("newPwCheck").value; 
		
		
		if( originPw == '' || newPw == '' || newPwCheck == '' ){
			alert("비밀번호를 입력해주세요.");
			return;
		}
		
		
		if( newPw != newPwCheck ){
			alert("새 비밀번호가 일치하지 않습니다.");
			return;
		} else {
			$.ajax({
				
				method : 'post',
				url : 'checkPwAccount',
				data : {
					'originPw' : originPw,
					'newPw' : newPw
				},
				success : function( result ) {
					swal("비밀번호가 변경되었습니다.", {
				      icon: "success",
				    });
				    setTimeout( function(){
				    	location.href = "/";
				    },  1000, );
				},
				error : function ( result ) {
					swal("기존 비밀번호가 일치하지 않습니다.", {
				      icon: "success",
				    });
				}
				
			});
		}
	}
</script>
</body>
</html>