<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> 마이페이지 </title>
</head>
<body>
${userInfo.name }님, 안녕하세요! </br>
<input type="button" value="내가 쓴 글 확인" onclick="location.href='myPosts'"> </br>
<input type="button" value="비밀번호 변경" onclick="location.href='../../member/modify'"> </br>
<input type="button" value="탈퇴하기" onclick="location.href='../../member/delete'">
</body>
</html>