<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시물 상세 페이지</title>
</head>
<body>

<h2>게시물 내용 : ${post.title};</h2>
<h2>댓글 내용 : ${comment[0].content};</h2>
</body>
</html>