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
<h1>�ݷ��� ���� ���� ����</h1>

<form action="../dog/detail/name" method="post">
  <c:choose>
    <c:when test="${dogList != null}">
      <c:forEach items="${dogList}" var="dog">
        <tr>${dog.getClassification()} ${dog.getDiseaseIdx()}<br><br>
        <c:forEach items="${dog.getDetailSymptom()}" var="detailSymptom">
          <input type="checkbox" name="selectedValues" value="${dog.getDiseaseIdx()}">${detailSymptom}<br>
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