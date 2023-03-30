<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="">
    <meta name="author" content="">

    <title>신비한 동물사전</title>
    
	<!-- css script -->
	<%@include file="../../fragments/common-css.jsp" %>
	
</head>

<body id="section_1">

	<!-- header -->
	<%@include file="../../fragments/header.jsp" %>
	
	<!-- nav -->
	<%@include file="../../fragments/nav.jsp" %>
	
	<main>		
		<section class="text-left" style="margin: auto; padding: 5% 0;">
			<div class="container">
			
			<h3 class="." style="color: var(--primary-color)">동물병원 🚨</h3>
			<nav class="navbar navbar-expand-lg bg-light">
			  <div class="container-fluid">			    
			    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
			      <span class="navbar-toggler-icon"></span>
			    </button>
			    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			      <div class="navbar-nav">
			        <a class="nav-link active" aria-current="page" href="#">강아지 연구소 🐶</a>
			        <a class="nav-link" href="#">고양이 연구소  🐱</a>
			        <a class="nav-link" href="#">그외의 동물들 🐣</a>
			        <a class="nav-link disabled">우리동네 동물병원 🏥</a>
			      </div>
			    </div>
			  </div>
			</nav>

						
		</section>
	</main>

	<!-- footer -->
	<%@include file="../../fragments/footer.jsp" %>

	<!-- js -->
	<%@include file="../../fragments/common-js.jsp" %>
	
</body>
</html>