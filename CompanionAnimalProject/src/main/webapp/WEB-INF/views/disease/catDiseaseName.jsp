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
<h1>증상명과 설명</h1>
  <c:choose>
    <c:when test="${catList != null}">
      <c:forEach items="${catList}" var="cat">
        <h2>${cat.getDiseaseName()}</h2>
        <h4>${cat.getTreatment()}</h4>
      </c:forEach>
    </c:when>
  </c:choose>
</body>
</html>