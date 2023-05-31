<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h1>반려견 증상 선택</h1>

<c:choose>
	<c:when test="${dogList != null}">
		<c:forEach items="${dogList}" var="dog">
			<tr>${dog.getDiseaseCategory()}<br><br>
			<c:forEach items="${dog.getMainSymptom()}" var="symptom">
    			<c:set var="encodedSymptom" value="${URLEncoder.encode(symptom, 'UTF-8')}"/>
    			<li><a href="dog/detail?select=${encodedSymptom}">${symptom}</a></li>
			</c:forEach>
			<br><br>
			</tr>
		</c:forEach>
	</c:when>
</c:choose>
</body>
</html>