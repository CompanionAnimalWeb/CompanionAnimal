<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> findInfo </title>
</head>
<body>

<form method="post">
	���̵� ã�� : </br>
	�̸��� ��ȭ��ȣ�� �Է����ּ���.<br />
	�̸� : <input type="text" name="name" required /> <br />
	��ȭ��ȣ : <input type="text" name="phone" required /> <br />
	<input type="submit" value="check">
	<c:if test="${check == 0}">
	<label>��ġ�ϴ� ������ �������� �ʽ��ϴٴ٤�.</label>
	</c:if>
	${message }
	<c:if test="${check == 1 }">
	<label>ã���ô� ���̵�� '${id}' �Դϴ�.</label>
	</c:if>
	<br />
	��й�ȣ ã�� : </br>
    <button type="button" onclick="location.href='../main'">Ȩ����</button>
</form>
</body>
</html>