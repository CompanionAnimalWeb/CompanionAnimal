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
<h1>반려묘 증상 선택</h1>

<c:choose>
	<c:when test="${catList != null}">
		<c:forEach items="${catList}" var="cat">
			<tr>${cat.getDiseaseCategory()}<br><br>
			<c:forEach items="${cat.getMainSymptom()}" var="symptom">
    			<c:set var="encodedSymptom" value="${URLEncoder.encode(symptom, 'UTF-8')}"/>
    			<li><a href="cat/detail?select=${encodedSymptom}">${symptom}</a></li>
			</c:forEach>
			<br><br>
			</tr>
		</c:forEach>
	</c:when>
</c:choose>


</body>
</html>