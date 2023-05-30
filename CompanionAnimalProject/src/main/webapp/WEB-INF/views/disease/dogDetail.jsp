<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>반려견 세부 증상 선택</h1>

<c:choose>
	<c:when test="${dogList != null}">
		<c:forEach items="${dogList}" var="dog">
		  <c:set var="encodedDog" value="${URLEncoder.encode(dog, 'UTF-8')}"/>
			<li><a href="detail/symptomName?select=${encodedDog}">${dog}</a></li>
			<br><br>
			</tr>
		</c:forEach>
	</c:when>
</c:choose>
</body>
</html>