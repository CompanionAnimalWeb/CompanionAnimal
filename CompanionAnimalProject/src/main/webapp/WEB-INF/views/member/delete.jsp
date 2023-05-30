<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> 회원탈퇴 </title>

<script type="text/javascript">
$(document).ready(function(){
	$(".cencle").on("click", function() {
		location.href = "/";		    
		})
	$("#submit").on("click", function() {
		if($("#userPass").val()=="") {
			alert("비밀번호를 입력해주세요.");
			$("#userPass").focus();
			return false;
			}	
		});
	})
</script>
<body>
<section id="container">
<form method="post">
<div class="form-group has-feedback">
	<label class="control-label" for="id">아이디</label>
	<input class="form-control" type="text" id="id" name="id" value="${userInfo.id}" readonly="readonly"/>
</div>
<div class="form-group has-feedback">
	<label class="control-label" for="password">패스워드</label>
	<input class="form-control" type="password" id="password" name="password" />
</div>
<div class="form-group has-feedback">
	<label class="control-label" for="userName">성명</label>
	<input class="form-control" type="text" id="name" name="name" value="${userInfo.name}" readonly="readonly"/>
</div>
<div class="form-group has-feedback">
	<button class="btn btn-success" type="submit" id="submit" onclick="location.href='../main'">회원탈퇴</button>
	<button class="cencle btn btn-danger" type="button" onclick="location.href='../main'">취소</button>
</div>
</form>
<div>
<c:if test="${msg == false}">
	비밀번호가 일치하지 않습니다.
</c:if>
</div>
</section>
</body>
</head>
</html>