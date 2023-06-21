<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="">
    <meta name="author" content="">

    <title>신비한 동물사전</title>
    
    <style>
	#mapwrap{position:relative;overflow:hidden;}
	.category, .category *{margin:0;padding:0;color:#000;}   
	.category {overflow:hidden;top:10px;left:10px;width:350px;height:60px;z-index:10;border:1px solid black;font-family:'Malgun Gothic','맑은 고딕',sans-serif;font-size:12px;text-align:center;background-color:#fff;}
	.category .menu_selected {background:#FF5F4A;color:#fff;border-left:1px solid #915B2F;border-right:1px solid #915B2F;margin:0 -1px;} 
	.category li{list-style:none;float:left;width:50px;height:45px;padding-top:5px;cursor:pointer;} 
	.category .ico_comm {display:block;margin:0 auto 2px;width:22px;height:26px;} 
	.currentLocation {position:absolute;overflow:hidden;bottom:10px;right:20px;width:30px;height:30px;z-index:10;border:1px solid black;background-color:#fff;}
	</style>
    
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
                <div class="row">
                	<div class="col-8">
						<h3 class="." style="color: var(--primary-color)">우리동네
							<img src="${pageContext.request.contextPath}/resources/images/downtown1.png" style="width:50px; height:50px;">
						</h3>
						<span>
							<small class="small-font text-secondary">애견파크, 미용, 호텔, 펜션, 카페, 식당 등 우리 동물과 함께할 수 있는 장소를 알아봅니다.</small>
						</span>
						<hr>

						<br>
						<h3>📢 ${marker.name}</h3><br>
					    <img src="${pageContext.request.contextPath}/resources/images/map/placeImages/${marker.imagePath}" style="width:50%; height:50%;">
					   	<hr>
					   	<p><b>주소</b> : <span>${marker.address}</span></p>
						<p><b>영업시간</b> : <span>${marker.hours}</span></p>
						<p><b>📞Tel</b> <span>${marker.tel}</span></p>
						
						<hr>
						<p><span>${marker.comment}</span></p>
	
						<hr>

		</section>
	</main>

	<!-- footer -->
	<%@include file="../fragments/footer.jsp" %>

	<!-- js -->
	<%@include file="../fragments/common-js.jsp" %>
	
</body>
</html>