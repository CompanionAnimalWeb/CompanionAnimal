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
<h1>�ݷ��� ���� ���� ����</h1>  <h3>${select}</h3>
<form action="../cat/detail/name" method="post">
  <c:choose>
    <c:when test="${catList != null}">
      <c:forEach items="${catList}" var="cat">
        <tr>${cat.getClassification()} ${cat.getDiseaseIdx()}<br><br>
        <c:forEach items="${cat.getDetailSymptom()}" var="detailSymptom">
          <input type="checkbox" name="selectedValues" value="${cat.getDiseaseIdx()}">${detailSymptom}<br>
        </c:forEach>
        <br><br>
        </tr>
      </c:forEach>
    </c:when>
  </c:choose>
  <input type="submit" value="���� Ȯ���ϱ�">
</form>
</body>
</html>