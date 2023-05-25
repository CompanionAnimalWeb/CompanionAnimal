<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원 정보 수정 및 탈퇴 </title>
</head>
<body>
<form method="post">
	아이디 : <input type="text" name="id" value="${userInfo.id}" readonly /> <br />
    비밀번호 : <input type="password" name="password" value="${userInfo.password}" required/> <br />
    이름 : <input type="text" name="name" value="${userInfo.name}" readonly /> <br />
    핸드폰번호 : <input type="text" name="phone" value="${userInfo.phone}" readonly /> <br />
    <input type="submit" value="비밀번호 변경" onclick="modify();" />
    <button type="button" onclick="location.href='delete'">탈퇴하기</button>
    <button type="button" onclick="location.href='../main'">홈으로</button>
</form>
<script>
function modify() {
	if(window.confirm("비밀번호 변경이 완료되었습니다.")) {
		location.href="../main";
	}
}

</script>
</body>
</html>