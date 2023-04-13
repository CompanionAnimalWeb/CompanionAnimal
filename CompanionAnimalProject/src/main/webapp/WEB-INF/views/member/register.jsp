<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원가입 페이지</title>

</head>
<body>
<h1>${test}</h1>
<form:form modelAttribute="registerData" action="successMemberJoin" method="post" onsubmit="return registerCheck(this)">
<div>
	<h3>회원 가입 정보</h3>
    <label>
    	<h4>아이디 : &nbsp;&nbsp; <input type="text" name="inputId" value="${user.id}" style="width:200px;height:40px;font-size:15px;"/>${error}<br>
        <h4>비밀번호 : &nbsp;&nbsp; <input type="password" name="inputPW" value="${user.password}" style="width:200px;height:40px;font-size:15px;"/><br>
        <h4>이름: &nbsp;&nbsp; <input type="text" name="inputName" value="${user.name}" style="width:200px;height:40px;font-size:15px;"/><br>
        <h4>핸드폰: &nbsp;&nbsp; <input type="text" name="inputPhone" value="${user.phone}" placeholder="공백 없이 숫자만 입력하세요" style="width:200px;height:40px;font-size:15px;"/><br>
        <input type="submit" id="submitBtn" value="회원가입하기" style="width:100px;height:60px;font-size:15px">
    </label>
</div>
</form:form>
<script type="text/javascript">
function registerCheck(obj){

	if(!obj.inputId.value || obj.inputId.value.trim().length == 0) {
		alert("아이디가 입력되지 않았습니다.");
		obj.inputId.value="";
		obj.inputId.focus();
		return false;
	}	
	
	if(!obj.inputPW.value || obj.inputPW.value.trim().length == 0) {
		alert("비밀번호가 입력되지 않았습니다.");
		obj.inputPW.value="";
		obj.inputPW.focus();
		return false;
	}
	
	if(!obj.inputName.value || obj.inputName.value.trim().length == 0) {
		alert("이름이 입력되지 않았습니다.");
		obj.inputName.value="";
		obj.inputName.focus();
		return false;
	}	
	
	if(!obj.inputPhone.value || obj.inputPhone.value.trim().length == 0) {
		alert("폰번호가 입력되지 않았습니다.");
		obj.inputPhone.value="";
		obj.inputPhone.focus();
		return false;
	}	
	return true;
}

</script>
</body>
</html>