<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	.category {position:absolute;overflow:hidden;top:10px;left:10px;width:150px;height:60px;z-index:10;border:1px solid black;font-family:'Malgun Gothic','맑은 고딕',sans-serif;font-size:12px;text-align:center;background-color:#fff;}
	.category .menu_selected {background:#FF5F4A;color:#fff;border-left:1px solid #915B2F;border-right:1px solid #915B2F;margin:0 -1px;} 
	.category li{list-style:none;float:left;width:50px;height:45px;padding-top:5px;cursor:pointer;} 
	.category .ico_comm {display:block;margin:0 auto 2px;width:22px;height:26px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png') no-repeat;} 
	.category .ico_coffee {background-position:-10px 0;}  
	.category .ico_store {background-position:-10px -36px;}   
	.category .ico_park {background-position:-10px -72px;} 
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
					</div>
					<div id="mapwrap">
	                    <div id="map" style="width:100%;height:450px;"></div>
	                    <div class="category">
					        <ul>
					            <li id="coffeeMenu" onclick="changeMarker('coffee')">
					                <span class="ico_comm ico_coffee"></span>
					                커피숍
					            </li>
					            <li id="storeMenu" onclick="changeMarker('store')">
					                <span class="ico_comm ico_store"></span>
					                마트
					            </li>
					            <li id="parkMenu" onclick="changeMarker('park')">
					                <span class="ico_comm ico_park"></span>
					                공원
					            </li>
					        </ul>
					    </div>
					</div>
						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cfa528c2d7f45ee55449b267e67ffb19"></script>
						<script>
						coffeePositions = [];
						storePositions = [];
						parkPositions = [];
						</script>
						
						<c:forEach items="${coffeeList}" var="coffee">
						<script>
						// 커피숍 마커가 표시될 좌표 배열입니다
						coffeePositions.push(
						    new kakao.maps.LatLng(${coffee.latitude}, ${coffee.longitude})              
						);
						</script>
						</c:forEach>

						<c:forEach items="${storeList}" var="store">
						<script>
						//마트 마커가 표시될 좌표 배열입니다
						storePositions.push(
						    new kakao.maps.LatLng(${store.latitude}, ${store.longitude})              
						);
						</script>
						</c:forEach>
						
						<c:forEach items="${parkList}" var="park">
						<script>
						// 공원 마커가 표시될 좌표 배열입니다
						parkPositions.push(
						    new kakao.maps.LatLng(${park.latitude}, ${park.longitude})              
						);
						</script>
						</c:forEach>
						
						<script>
						 
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						    mapOption = { 
						        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						        level: 4 // 지도의 확대 레벨 
						    }; 
						
						var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
						
						

						var markerImageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png';  // 마커이미지의 주소입니다. 스프라이트 이미지 입니다
						    coffeeMarkers = [], // 커피숍 마커 객체를 가지고 있을 배열입니다
						    storeMarkers = [], // 편의점 마커 객체를 가지고 있을 배열입니다
						    parkMarkers = []; // 애견파크 마커 객체를 가지고 있을 배열입니다

						createCoffeeMarkers(); // 커피숍 마커를 생성하고 커피숍 마커 배열에 추가합니다
						createStoreMarkers(); // 편의점 마커를 생성하고 편의점 마커 배열에 추가합니다
						createParkMarkers(); // 애견파크 마커를 생성하고 애견파크 마커 배열에 추가합니다
						
						changeMarker('coffee'); // 지도에 커피숍 마커가 보이도록 설정합니다    
						
						// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
						if (navigator.geolocation) {
						    
						    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
						    navigator.geolocation.getCurrentPosition(function(position) {
						        
						        var lat = position.coords.latitude, // 위도
						            lon = position.coords.longitude; // 경도
						        
						        var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
						            
						        // 마커와 인포윈도우를 표시합니다
						        displayMarker(locPosition);
						            
						      });
						    
						} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
						    
						    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667);   
						        alert('geolocation을 사용할수 없어요..');
						        
						    displayMarker(locPosition);
						}
						
						// 지도에 마커와 인포윈도우를 표시하는 함수입니다
						function displayMarker(locPosition) {
						
						    // 마커를 생성합니다
						    var marker = new kakao.maps.Marker({  
						        map: map, 
						        position: locPosition
						    }); 
						    
						    // 지도 중심좌표를 접속위치로 변경합니다
						    map.setCenter(locPosition);      
						}    
						
						// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
						function createMarkerImage(src, size, options) {
						    var markerImage = new kakao.maps.MarkerImage(src, size, options);
						    return markerImage;            
						}

						// 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
						function createMarker(position, image) {
						    var marker = new kakao.maps.Marker({
						        position: position,
						        image: image
						    });
						    
						    return marker;  
						}   
						   
						// 커피숍 마커를 생성하고 커피숍 마커 배열에 추가하는 함수입니다
						function createCoffeeMarkers() {
						    for (var i = 0; i < coffeePositions.length; i++) {  

						        var imageSize = new kakao.maps.Size(22, 26),
						            imageOptions = {  
						                spriteOrigin: new kakao.maps.Point(10, 0),    
						                spriteSize: new kakao.maps.Size(36, 98)  
						            };     

						        // 마커이미지와 마커를 생성합니다
						        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
						            marker = createMarker(coffeePositions[i], markerImage);  
						        
						        // 생성된 마커를 커피숍 마커 배열에 추가합니다
						        coffeeMarkers.push(marker);
						    }     
						}

						// 커피숍 마커들의 지도 표시 여부를 설정하는 함수입니다
						function setCoffeeMarkers(map) {        
						    for (var i = 0; i < coffeeMarkers.length; i++) {  
						        coffeeMarkers[i].setMap(map);
						    }        
						}

						// 편의점 마커를 생성하고 편의점 마커 배열에 추가하는 함수입니다
						function createStoreMarkers() {
						    for (var i = 0; i < storePositions.length; i++) {
						        
						        var imageSize = new kakao.maps.Size(22, 26),
						            imageOptions = {   
						                spriteOrigin: new kakao.maps.Point(10, 36),    
						                spriteSize: new kakao.maps.Size(36, 98)  
						            };       
						     
						        // 마커이미지와 마커를 생성합니다
						        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
						            marker = createMarker(storePositions[i], markerImage);  

						        // 생성된 마커를 편의점 마커 배열에 추가합니다
						        storeMarkers.push(marker);    
						    }        
						}

						// 편의점 마커들의 지도 표시 여부를 설정하는 함수입니다
						function setStoreMarkers(map) {        
						    for (var i = 0; i < storeMarkers.length; i++) {  
						        storeMarkers[i].setMap(map);
						    }        
						}

						// 애견파크 마커를 생성하고 애견파크 마커 배열에 추가하는 함수입니다
						function createParkMarkers() {
						    for (var i = 0; i < parkPositions.length; i++) {
						        
						        var imageSize = new kakao.maps.Size(22, 26),
						            imageOptions = {   
						                spriteOrigin: new kakao.maps.Point(10, 72),    
						                spriteSize: new kakao.maps.Size(36, 98)  
						            };       
						     
						        // 마커이미지와 마커를 생성합니다
						        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
						            marker = createMarker(parkPositions[i], markerImage);  

						        // 생성된 마커를 애견파크 마커 배열에 추가합니다
						        parkMarkers.push(marker);        
						    }                
						}

						// 애견파크 마커들의 지도 표시 여부를 설정하는 함수입니다
						function setParkMarkers(map) {        
						    for (var i = 0; i < parkMarkers.length; i++) {  
						        parkMarkers[i].setMap(map);
						    }        
						}

						// 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
						function changeMarker(type){
						    
						    var coffeeMenu = document.getElementById('coffeeMenu');
						    var storeMenu = document.getElementById('storeMenu');
						    var parkMenu = document.getElementById('parkMenu');
						    
						    // 커피숍 카테고리가 클릭됐을 때
						    if (type === 'coffee') {
						    
						        // 커피숍 카테고리를 선택된 스타일로 변경하고
						        coffeeMenu.className = 'menu_selected';
						        
						        // 편의점과 애견파크 카테고리는 선택되지 않은 스타일로 바꿉니다
						        storeMenu.className = '';
						        parkMenu.className = '';
						        
						        // 커피숍 마커들만 지도에 표시하도록 설정합니다
						        setCoffeeMarkers(map);
						        setStoreMarkers(null);
						        setParkMarkers(null);
						        
						    } else if (type === 'store') { // 편의점 카테고리가 클릭됐을 때
						    
						        // 편의점 카테고리를 선택된 스타일로 변경하고
						        coffeeMenu.className = '';
						        storeMenu.className = 'menu_selected';
						        parkMenu.className = '';
						        
						        // 편의점 마커들만 지도에 표시하도록 설정합니다
						        setCoffeeMarkers(null);
						        setStoreMarkers(map);
						        setParkMarkers(null);
						        
						    } else if (type === 'park') { // 애견파크 카테고리가 클릭됐을 때
						     
						        // 애견파크 카테고리를 선택된 스타일로 변경하고
						        coffeeMenu.className = '';
						        storeMenu.className = '';
						        parkMenu.className = 'menu_selected';
						        
						        // 애견파크 마커들만 지도에 표시하도록 설정합니다
						        setCoffeeMarkers(null);
						        setStoreMarkers(null);
						        setParkMarkers(map);  
						    }    
						} 
						</script>
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
	<%@include file="../fragments/footer.jsp" %>

	<!-- js -->
	<%@include file="../fragments/common-js.jsp" %>
	
</body>
</html>