<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>

<html>
<head>
	<title>Home</title>
</head>
<body>

<script type="text/javascript">

	<sec:authorize access="isAuthenticated()">
		self.location="/board/list_";
	</sec:authorize>
	

	<sec:authorize access="isAnonymous()">

		self.location="/customLogin";
	</sec:authorize>

	
</script>

</body>
</html>
