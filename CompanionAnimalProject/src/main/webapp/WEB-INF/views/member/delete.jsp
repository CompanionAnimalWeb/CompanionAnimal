<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> ȸ��Ż�� </title>

<script type="text/javascript">
$(document).ready(function(){
	$(".cencle").on("click", function() {
		location.href = "/";		    
		})
	$("#submit").on("click", function() {
		if($("#userPass").val()=="") {
			alert("��й�ȣ�� �Է����ּ���.");
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
	<label class="control-label" for="id">���̵�</label>
	<input class="form-control" type="text" id="id" name="id" value="${userInfo.id}" readonly="readonly"/>
</div>
<div class="form-group has-feedback">
	<label class="control-label" for="password">�н�����</label>
	<input class="form-control" type="password" id="password" name="password" />
</div>
<div class="form-group has-feedback">
	<label class="control-label" for="userName">����</label>
	<input class="form-control" type="text" id="name" name="name" value="${userInfo.name}" readonly="readonly"/>
</div>
<div class="form-group has-feedback">
	<button class="btn btn-success" type="submit" id="submit" onclick="location.href='../main'">ȸ��Ż��</button>
	<button class="cencle btn btn-danger" type="button" onclick="location.href='../main'">���</button>
</div>
</form>
<div>
<c:if test="${msg == false}">
	��й�ȣ�� ��ġ���� �ʽ��ϴ�.
</c:if>
</div>
</section>
</body>
</head>
</html>