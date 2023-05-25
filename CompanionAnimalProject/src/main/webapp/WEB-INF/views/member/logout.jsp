<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<meta charset="EUC-KR">
<title> logout </title>
<script type="text/javascript">
	window.location.href="./main";
</script>
</head>
<body>
	<% session.removeAttribute("userInfo"); %>
	${userInfo.id }님 안녕하세요!
</body>
</html>