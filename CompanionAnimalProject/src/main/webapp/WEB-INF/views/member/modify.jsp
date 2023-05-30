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
<script type="text/javascript"> 

function validate() {
    var valid = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
    var pw = document.getElementById("password");
    var pw2 = document.getElementById("password2");
    
    if(!check(valid, pw, "비밀번호는 영문 대소문자, 숫자, 특수문자를 포함한 8~16자여야 합니다.")) {
        return false;
    }
    
    if(pw.value != pw2.value) { 
        alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
        modify.pw2.value = "";
        modify.pw2.focus();
        return false;
    }
    alert("비밀번호 변경이 완료되었습니다.");
}

function check(valid, what, message) {
    if(valid.test(what.value)) {
        return true;
    }
    alert(message);
    what.value = "";
    what.focus();
}

</script>
<body>
<form method="post" onsubmit="return validate();">
	아이디 : <input type="text" name="id" value="${userInfo.id}" readonly /> <br />
    비밀번호 : <input type="password" name="password" id="password" required/> <br />
    비밀번호 확인 : <input type="password" name="password2" id="password2" required/> <br />
    이름 : <input type="text" name="name" value="${userInfo.name}" readonly /> <br />
    핸드폰번호 : <input type="text" name="phone" value="${userInfo.phone}" readonly /> <br />
    <input type="submit" value="비밀번호 변경" onclick="modify();" />
    <button type="button" onclick="location.href='../main'">홈으로</button>
</form>
</body>
</head>
</html>