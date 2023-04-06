<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html>
<head>
	<title>Home</title>
</head>
<body>
	<form:form modelAttribute="test" action="signinCheck" method="post">

	<label>ID : <input type="text" name="id" value="${user.id}"/></label>
	<br>
	
	<label>PW : <input type="password" name="password"/></label>
	<br>
	
	<input type="submit" value="로그인"/><br>
</form:form>


<a href="<c:url value="/member/register"/>">회원가입</a>

</body>
</html>