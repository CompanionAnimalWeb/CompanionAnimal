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
                <div class="row">
                	<div class="col-8">
						<h3 class="." style="color: var(--primary-color)">우리동네
							<img src="${pageContext.request.contextPath}/resources/images/downtown1.png" style="width:50px; height:50px;">
						</h3>
						<span>
							<small class="small-font text-secondary">산책로, 미용, 호텔, 펜션, 카페, 식당 등 우리 동물과 함께할 수 있는 장소를 알아봅니다.</small>
						</span>
					</div>
                    
			
				</div>
				
				<div class="d-flex flex-row-reverse">
		            <div class="d-flex justify-content-lg-end">
					    <input class="form-control border-gray border-1 rounded-pill" type="search" placeholder="찾으시는 글이 있으신가요?" aria-label="Search" aria-describedby="search-heart" style="font-size:small" size=40/>
                		<button class="btn my-2 my-sm-0" type="submit"><i class="bi-search"></i></button>
                	</div>	
				</div>
				
                <div>
               		<p></p>
                </div>

			<div>
				
		</section>
	</main>

	<!-- footer -->
	<%@include file="../../fragments/footer.jsp" %>

	<!-- js -->
	<%@include file="../../fragments/common-js.jsp" %>
	
</body>
</html>