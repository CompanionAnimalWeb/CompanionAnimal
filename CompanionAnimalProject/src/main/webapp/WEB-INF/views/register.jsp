<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성 페이지</title>
</head>
<body>
<h1>${test}</h1>
<form action="successMemberJoin" method="post">
<div>
	<h3>회원 가입 정보</h3>
    <label>
    	<h4>아이디 : &nbsp;&nbsp; <input type="text" name = "inputId" style="width:200px;height:40px;font-size:15px;"/><br>
        <h4>비밀번호 : &nbsp;&nbsp; <input type="password" name = "inputPW" style="width:200px;height:40px;font-size:15px;"/><br>
        <h4>이름: &nbsp;&nbsp; <input type="text" name = "inputName" style="width:200px;height:40px;font-size:15px;"/><br>
        <h4>핸드폰: &nbsp;&nbsp; <input type="text" name = "inputPhone" placeholder="공백 없이 입력하세요" style="width:200px;height:40px;font-size:15px;"/><br>
        <input type="submit" id="submitBtn" value="가입하기" style="width:100px;height:60px;font-size:15px">
    </label>
</div>
</form>

</body>
</html>