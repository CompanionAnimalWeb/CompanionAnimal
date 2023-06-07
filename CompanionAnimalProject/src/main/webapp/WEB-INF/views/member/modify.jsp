<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<body id="section_1">

	<!-- header -->
	<%@include file="../fragments/header.jsp" %>
	
	<!-- nav -->
	<%@include file="../fragments/nav.jsp" %>
	
	<main>		
		<section class="text-left" style="margin: auto; padding: 5% 0;">
			<div class="container">
			
				<h3 class="." style="color: var(--primary-color)">내 정보 수정📝</h3>
				<br>
				<span>
					<small class="small-font text-secondary">* 표시는 필수 입력사항 입니다.</small>
				</span>
				
				<br>
				<br>
				
				<form method="post" onsubmit="return validate();">

					<table class="table table-bordered">
					  <tbody>
					    <tr>
					      <td>아이디</td>
					      <td><input type="text" name="id" value="${userInfo.id}" style="border:0 solid black" readonly /></td>
						</tr>
					    <tr>
					      <td>비밀번호*</td>
					      <td><input type="password" name="password" id="password" required/></td>
					    </tr>
					    <tr>
					      <td>비밀번호 확인*</td>
					      <td><input type="password" name="password2" id="password2" required/></td>
					    </tr>
					    <tr>
					      <td>이름</td>
					      <td><input type="text" name="name" value="${userInfo.name}" style="border:0 solid black" readonly /></td>
					    </tr>
					    <tr>
					      <td>전화번호</td>
					      <td><input type="text" name="phone" value="${userInfo.phone}" style="border:0 solid black" readonly /></td>
					    </tr>
					  </tbody>
					</table>	
									
					<button type="submit" class="btn btn-outline-dark" onclick="modify();">비밀번호 변경</button>
					<button type="button" class="btn btn-success" onclick="location.href='../main'">메인으로</button>
					
					
				</form>



			</div>
		</section>
	</main>

	<!-- footer -->
	<%@include file="../fragments/footer.jsp" %>

	<!-- js -->
	<%@include file="../fragments/common-js.jsp" %>
	
</body>




</html>