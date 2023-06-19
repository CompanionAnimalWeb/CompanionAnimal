<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="">
    <meta name="author" content="">

    <title>신비한 동물사전</title>
    
    <!-- css script -->
    <%@include file="../fragments/common-css.jsp" %>
    
</head>

<body id="section_1">

    <!-- header -->
    <%@include file="../fragments/header.jsp" %>
    
    <!-- nav -->
    <%@include file="../fragments/nav.jsp" %>
    
    <main>        
        <section class="text-left" style="margin: auto; padding: 5% 0;">
            <div class="container">
            
			<h3 class="." style="color: var(--primary-color)">M Y P A G E 🔒</h3>
			
			<hr>
			
            <nav class="navbar navbar-expand-lg bg-light">
              <div class="container-fluid">                
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
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
	
function success(){
    alert('탈퇴가 완료되었습니다.');
}
</script>

<section id="container">
<form method="post">
<div class="form-group has-feedback">
	<label class="control-label" for="id">아이디</label>
	<input class="form-control" type="text" id="id" name="id" value="${userInfo.id}" readonly="readonly"/><p></p>
</div>
<div class="form-group has-feedback">
	<label class="control-label" for="password">비밀번호 확인</label>
	<input class="form-control" type="password" id="password" name="password" />
	<c:if test="${msg == false}">
	<b>비밀번호가 일치하지 않습니다.</b>
	</c:if>
	<p></p>
</div>
<div class="form-group has-feedback">
	<label class="control-label" for="userName">성명</label>
	<input class="form-control" type="text" id="name" name="name" value="${userInfo.name}" readonly="readonly"/><p></p>
</div>
<div class="form-group has-feedback">
	<button class="btn btn-success" type="submit" id="submit" onclick="location.href='../main'">회원탈퇴</button>
	<button class="cencle btn btn-danger" type="button" onclick="location.href='../main'">취소</button>
</div>
</form>
<div>

</div>
</section>
</body>
                          	
				
                        
        </section>
    </main>

    <!-- footer -->
    <%@include file="../fragments/footer.jsp" %>

    <!-- js -->
    <%@include file="../fragments/common-js.jsp" %>
    
</body>
</html>