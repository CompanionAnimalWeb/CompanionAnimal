<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true" %>
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
            
			<h3 class="." style="color: var(--primary-color)">아이디 찾기</h3>
			
			<hr>
			
            <nav class="navbar navbar-expand-lg bg-light">
              <div class="container-fluid">                
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
<form method="post">

	<b>이름과 전화번호를 입력해주세요. </b></p>
	<label class="control-label" for="name">이름 : </label>
	<input class="form-control" type="text" id="name" name="name" required/></p>
	<label class="control-label" for="phone">전화번호 : </label>
	<input class="form-control" type="text" id="phone" name="phone" required/>
    </p>
	<input class="form-control" type="submit" value="아이디 찾기" >
	<br />

    <button type="button" class="btn btn-secondary" onclick="location.href='../main'">홈으로</button>
</form>

<c:choose>
    <c:when test="${check == 1}">
	<script type="text/javascript">
    	alert("${message}");
        window.location.href = "login";
    </script>
    </c:when>
    <c:when test="${check == 0}">
    <script type="text/javascript">
    	window.location.href = "findInfo";
    	alert("일치하는 정보가 존재하지 않습니다.");
    	</script>
    </c:when>
</c:choose>
              </div>
            </nav>	
                    </section>
    </main>

    <!-- footer -->
    <%@include file="../fragments/footer.jsp" %>

    <!-- js -->
    <%@include file="../fragments/common-js.jsp" %>

</body>
</html>