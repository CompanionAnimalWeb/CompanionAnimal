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
	
	<!-- font -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
   
</head>

<body id="section_1">

    <!-- header -->
    <%@include file="../fragments/header.jsp" %>
    
    <!-- nav -->
    <%@include file="../fragments/nav.jsp" %>
    
    <main>        
        <section class="text-left" style="margin: auto; padding: 5% 0;">
            <div class="container text-center">
            
				<h3 class="." style="color: var(--primary-color)">반려동물 질병 예측🩺</h3>
				
				<hr>
				
				<ul class="nav justify-content-center">
		            <nav class="navbar navbar-expand-lg bg-light">
		              <div class="container-fluid">                
		                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
		                  <span class="navbar-toggler-icon"></span>
		                </button>
		                
		                <div class="collapse navbar-collapse" id="navbarNavAltMarkup" >
		                  <div class="navbar-nav">
		                    <a class="nav-link fw-bold fs-5" href="<c:url value="/disease/dog"/>">강아지 연구소🐶 </a>
		                    <a class="nav-link active fw-bold fs-5" href="<c:url value="/disease/cat"/>">고양이 연구소🐱 </a>
		                  </div>
		                </div>
		                
		              </div>
		            </nav>
		        </ul>
		            			
				<hr>
				<br>
				
				<div class="container text-center">
					<h3>증상 세부사항 선택</h3>
					<br><hr>
					<h5>${select}</h5>
					<hr>
					<form action="../cat/detail/name" method="post">
					  <c:choose>
					    <c:when test="${catList != null}">
					      <c:forEach items="${catList}" var="cat">
					        <tr><p class="fw-bold">${cat.getClassification()} ${cat.getDiseaseIdx()}</p>
					        <c:forEach items="${cat.getDetailSymptom()}" var="detailSymptom">
					        	<p class="fw-semibold">
					        		<input type="checkbox" name="selectedValues" value="${cat.getDiseaseIdx()}">${detailSymptom}<br>
					        	</p>
					        </c:forEach>
					        </tr>
					        <hr>
					      </c:forEach>
					    </c:when>
					  </c:choose>
					  <br>
					  <input type="submit" value="증상 확인하기">
					</form>				
					<hr>
				</div>
				
	      	</div>        
        </section>
        
    </main>

    <!-- footer -->
    <%@include file="../fragments/footer.jsp" %>

    <!-- js -->
    <%@include file="../fragments/common-js.jsp" %>
    
</body>
</html>