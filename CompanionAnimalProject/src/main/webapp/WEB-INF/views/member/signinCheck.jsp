<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 로그인 정보 확인 </title>
</head>
<body>
로그인 완료 <br>
아이디 : ${userInfo.id }<br>
비밀번호 : ${userInfo.password }<br>
이름 : ${userInfo.name }<br>
전화번호 : ${userInfo.phone }<br>
</body>
</html>