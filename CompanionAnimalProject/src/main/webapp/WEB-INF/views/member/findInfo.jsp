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
	아이디 찾기 : </br>
	이름과 전화번호를 입력해주세요.<br />
	이름 : <input type="text" name="name" required /> <br />
	전화번호 : <input type="text" name="phone" required /> <br />
	<input type="submit" value="check">
	<c:if test="${check == 0}">
	<label>일치하는 정보가 존재하지 않습니다다ㅏ.</label>
	</c:if>
	${message }
	<c:if test="${check == 1 }">
	<label>찾으시는 아이디는 '${id}' 입니다.</label>
	</c:if>
	<br />
	비밀번호 찾기 : </br>
    <button type="button" onclick="location.href='../main'">홈으로</button>
</form>
</body>
</html>