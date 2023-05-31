<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.net.URLEncoder" %>
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
            
			<h3 class="." style="color: var(--primary-color)">반려동물 질병 예측🩺</h3>
			
			<hr>
			
            <nav class="navbar navbar-expand-lg bg-light">
              <div class="container-fluid">                
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                  <div class="navbar-nav">
                    <a class="nav-link" aria-current="page" href="dog">강아지 연구소🐶 </a>
                    <a class="nav-link active" onclick="location.href='cat'">고양이 연구소🐱 </a>
                  </div>
                </div>
              </div>
            </nav>	
	            			
				<hr>
				<br>
					
					<h5>MY INFO.</h5>
					<table class="table table-bordered">
					  <tbody>
					    <tr>
					      <td>아이디</td>
					      <td>${userInfo.id}</td>
					    </tr>
					    <tr>
					      <td>이름</td>
					      <td>${userInfo.name}</td>
					    </tr>
					    <tr>
					      <td>전화번호</td>
					      <td>${userInfo.phone}</td>
					    </tr>
					  </tbody>
					</table>
					
					<button type="button" class="btn btn-outline-dark" onclick="location.href='../member/modify'">비밀번호 변경</button>
					<button type="button" class="btn btn-secondary" onclick="location.href='../member/delete'">탈퇴하기😭</button>
					
					</body>
			 		
					<c:choose>
						<c:when test="${dogList != null}">
							<c:forEach items="${dogList}" var="dog">
								<tr>${dog.getDiseaseCategory()}<br><br>
								<c:forEach items="${dog.getMainSymptom()}" var="symptom">
					    			<c:set var="encodedSymptom" value="${URLEncoder.encode(symptom, 'UTF-8')}"/>
					    			<li><a href="dog/detail?select=${encodedSymptom}">${symptom}</a></li>
								</c:forEach>
								<br><br>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>                         	
		                
        </section>
        
    </main>

    <!-- footer -->
    <%@include file="../fragments/footer.jsp" %>

    <!-- js -->
    <%@include file="../fragments/common-js.jsp" %>
    
</body>
</html>