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
						<div class="category">
					        <ul>
					            <li id="coffeeMenu" onclick="changeMarker('coffee')">
					            <img src="${pageContext.request.contextPath}/resources/images/map/cafe.png" style="width:50px; height:50px;">
					            <span class="ico_comm"></span>
					                커피숍
					            </li>
					            
					            <li id="storeMenu" onclick="changeMarker('store')">
					            <img src="${pageContext.request.contextPath}/resources/images/map/shop.png" style="width:50px; height:50px;">
					                <span class="ico_comm"></span>
					                마트
					            </li>
					            
					            <li id="parkMenu" onclick="changeMarker('park')">
					            <img src="${pageContext.request.contextPath}/resources/images/map/park.png" style="width:50px; height:50px;">
					                <span class="ico_comm"></span>
					                공원
					            </li>
					            
					            <li id="restaurantMenu" onclick="changeMarker('restaurant')">
					            <img src="${pageContext.request.contextPath}/resources/images/map/restaurant.png" style="width:50px; height:50px;">
					                <span class="ico_comm"></span>
					                식당
					            </li>
					            
					            <li id="hotelMenu" onclick="changeMarker('hotel')">
					            <img src="${pageContext.request.contextPath}/resources/images/map/hotel.png" style="width:50px; height:50px;">
					                <span class="ico_comm"></span>
					                호텔
					            </li>
					            
					            <li id="hospitalMenu" onclick="changeMarker('hospital')">
					            <img src="${pageContext.request.contextPath}/resources/images/map/hospital.png" style="width:50px; height:50px;">
					                <span class="ico_comm"></span>
					                병원
					            </li>
					            
					            <li id="salonMenu" onclick="changeMarker('salon')">
					            <img src="${pageContext.request.contextPath}/resources/images/map/salon.png" style="width:50px; height:50px;">
					                <span class="ico_comm"></span>
					                미용실
					            </li>
					        </ul>
					    </div>
					</div>
					
					<div id="mapwrap">
						 
	                    <div id="map" style="width:100%;height:450px;"></div>
	                   
					    <div class="currentLocation" onclick="setCurrentLocation()">
					    	<img src="${pageContext.request.contextPath}/resources/images/map/currentLocation.png" style="width:30px; height:30px;">
					    </div>
					</div>
						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cfa528c2d7f45ee55449b267e67ffb19"></script>
						<script>
						coffeePositions = [];
						storePositions = [];
						parkPositions = [];
						restaurantPositions = [];
						hotelPositions = [];
						hospitalPositions = [];
						salonPositions = [];
						
						</script>
						
						<c:forEach items="${coffeeList}" var="coffee">
						<script>
						// 커피숍 마커가 표시될 좌표 배열입니다
						coffeePositions.push(
						    new kakao.maps.LatLng(${coffee.latitude}, ${coffee.longitude})              
						);
						
						coffeeMarkers.push({
							lat : ${coffee.latitude},
							lng : ${coffee.longitude}
						});
						</script>
						</c:forEach>

						<c:forEach items="${storeList}" var="store">
						<script>
						//마트 마커가 표시될 좌표 배열입니다
						storePositions.push(
						    new kakao.maps.LatLng(${store.latitude}, ${store.longitude})              
						);
						
						storeMarkers.push({
							lat : ${store.latitude},
							lng : ${store.longitude}
						});
						</script>
						</c:forEach>
						
						<c:forEach items="${parkList}" var="park">
						<script>
						// 공원 마커가 표시될 좌표 배열입니다
						parkPositions.push(
						    new kakao.maps.LatLng(${park.latitude}, ${park.longitude})              
						);
						
						parkMarkers.push({
							lat : ${park.latitude},
							lng : ${park.longitude}
						});
						</script>
						</c:forEach>
						
						<c:forEach items="${restaurantList}" var="restaurant">
						<script>
						// 식당 마커가 표시될 좌표 배열입니다
						restaurantPositions.push(
						    new kakao.maps.LatLng(${restaurant.latitude}, ${restaurant.longitude})              
						);
						
						restaurantMarkers.push({
							lat : ${restaurant.latitude},
							lng : ${restaurant.longitude}
						});
						</script>
						</c:forEach>
						
						
						<c:forEach items="${hotelList}" var="hotel">
						<script>
						// 호텔 마커가 표시될 좌표 배열입니다
						hotelPositions.push(
						    new kakao.maps.LatLng(${hotel.latitude}, ${hotel.longitude})              
						);
						
						hotelMarkers.push({
							lat : ${hotel.latitude},
							lng : ${hotel.longitude}
						});
						</script>
						</c:forEach>
						
						<c:forEach items="${hospitalList}" var="hospital">
						<script>
						// 병원 마커가 표시될 좌표 배열입니다
						hospitalPositions.push(
						    new kakao.maps.LatLng(${hospital.latitude}, ${hospital.longitude})              
						);
						
						hospitalMarkers.push({
							lat : ${hospital.latitude},
							lng : ${hospital.longitude}
						});
						</script>
						</c:forEach>
						
						<c:forEach items="${salonList}" var="salon">
						<script>
						// 미용실 마커가 표시될 좌표 배열입니다
						salonPositions.push(
						    new kakao.maps.LatLng(${salon.latitude}, ${salon.longitude})              
						);
						
						salonMarkers.push({
							lat : ${salon.latitude},
							lng : ${salon.longitude}
						});
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
						    parkMarkers = [], // 애견파크 마커 객체를 가지고 있을 배열입니다
						    restaurantMarkers = [], // 식당 마커 객체를 가지고 있을 배열입니다
						    hotelMarkers = []; // 호텔 마커 객체를 가지고 있을 배열입니다
						    hospitalMarkers = []; // 병원 마커 객체를 가지고 있을 배열입니다
						    salonMarkers = []; // 미용실 마커 객체를 가지고 있을 배열입니다
						    
						
						createCoffeeMarkers(); // 커피숍 마커를 생성하고 커피숍 마커 배열에 추가합니다
						createStoreMarkers(); // 편의점 마커를 생성하고 편의점 마커 배열에 추가합니다
						createParkMarkers(); // 애견파크 마커를 생성하고 애견파크 마커 배열에 추가합니다
						createRestaurantMarkers(); // 식당 마커를 생성하고 식당 마커 배열에 추가합니다
						createHotelMarkers(); // 호텔 마커를 생성하고 호텔 마커 배열에 추가합니다
						createHospitalMarkers(); // 병원 마커를 생성하고 병원 마커 배열에 추가합니다
						createSalonMarkers(); // 미용실 마커를 생성하고 미용실 마커 배열에 추가합니다
						
						changeMarker('coffee'); // 지도에 커피숍 마커가 보이도록 설정합니다    
						
						start();
						
						// 마커 클러스터러를 생성합니다 
				        var clusterer = new kakao.maps.MarkerClusterer({
				            map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
				            averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
				            minLevel: 10 // 클러스터 할 최소 지도 레벨 
				        });
				            
						var clustererMarkers =[];
						
						/* var markers = [];

				        for (var i = 0; i < coffeeMarkers.length; i++ ) {

				          // 지도에 마커를 생성하고 표시한다.
				          var marker = new kakao.maps.Marker({
				            position: new kakao.maps.LatLng(coffeeMarkers[i].lat, coffeeMarkers[i].lng), // 마커의 좌표
				            map: map // 마커를 표시할 지도 객체
				          });

				          // 생성된 마커를 마커 저장하는 변수에 넣음(마커 클러스터러 관련)
				          markers.push(marker);
				        } */

				        
						
						function start(){
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

						// 식당 마커를 생성하고 식당 마커 배열에 추가하는 함수입니다
						function createRestaurantMarkers() {
						    for (var i = 0; i < restaurantPositions.length; i++) {
						        
						        var imageSize = new kakao.maps.Size(22, 26),
						            imageOptions = {   
						                spriteOrigin: new kakao.maps.Point(10, 72),    
						                spriteSize: new kakao.maps.Size(36, 98)  
						            };       
						     
						        // 마커이미지와 마커를 생성합니다
						        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
						            marker = createMarker(restaurantPositions[i], markerImage);  

						        // 생성된 마커를 식당 마커 배열에 추가합니다
						        restaurantMarkers.push(marker);        
						    }                
						}

						// 식당 마커들의 지도 표시 여부를 설정하는 함수입니다
						function setRestaurantMarkers(map) {        
						    for (var i = 0; i < restaurantMarkers.length; i++) {  
						        restaurantMarkers[i].setMap(map);
						    }        
						}
						
						// 호텔 마커를 생성하고 호텔 마커 배열에 추가하는 함수입니다
						function createHotelMarkers() {
						    for (var i = 0; i < hotelPositions.length; i++) {
						        
						        var imageSize = new kakao.maps.Size(22, 26),
						            imageOptions = {   
						                spriteOrigin: new kakao.maps.Point(10, 72),    
						                spriteSize: new kakao.maps.Size(36, 98)  
						            };       
						     
						        // 마커이미지와 마커를 생성합니다
						        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
						            marker = createMarker(hotelPositions[i], markerImage);  

						        // 생성된 마커를 호텔 마커 배열에 추가합니다
						        hotelMarkers.push(marker);        
						    }                
						}

						// 호텔 마커들의 지도 표시 여부를 설정하는 함수입니다
						function setHotelMarkers(map) {        
						    for (var i = 0; i < hotelMarkers.length; i++) {  
						        hotelMarkers[i].setMap(map);
						    }        
						}
						
						// 병원 마커를 생성하고 병원 마커 배열에 추가하는 함수입니다
						function createHospitalMarkers() {
						    for (var i = 0; i < hospitalPositions.length; i++) {
						        
						        var imageSize = new kakao.maps.Size(22, 26),
						            imageOptions = {   
						                spriteOrigin: new kakao.maps.Point(10, 72),    
						                spriteSize: new kakao.maps.Size(36, 98)  
						            };       
						     
						        // 마커이미지와 마커를 생성합니다
						        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
						            marker = createMarker(hospitalPositions[i], markerImage);  

						        // 생성된 마커를 병원 마커 배열에 추가합니다
						        hospitalMarkers.push(marker);        
						    }                
						}

						// 병원 마커들의 지도 표시 여부를 설정하는 함수입니다
						function setHospitalMarkers(map) {        
						    for (var i = 0; i < hospitalMarkers.length; i++) {  
						        hospitalMarkers[i].setMap(map);
						    }        
						}
						
						// 미용실 마커를 생성하고 미용실 마커 배열에 추가하는 함수입니다
						function createSalonMarkers() {
						    for (var i = 0; i < salonPositions.length; i++) {
						        
						        var imageSize = new kakao.maps.Size(22, 26),
						            imageOptions = {   
						                spriteOrigin: new kakao.maps.Point(10, 72),    
						                spriteSize: new kakao.maps.Size(36, 98)  
						            };       
						     
						        // 마커이미지와 마커를 생성합니다
						        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
						            marker = createMarker(salonPositions[i], markerImage);  

						        // 생성된 마커를 미용실 마커 배열에 추가합니다
						        salonMarkers.push(marker);        
						    }                
						}

						// 미용실 마커들의 지도 표시 여부를 설정하는 함수입니다
						function setSalonMarkers(map) {        
						    for (var i = 0; i < salonMarkers.length; i++) {  
						        salonMarkers[i].setMap(map);
						    }        
						}
						
						// 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
						function changeMarker(type){
						    
						    var coffeeMenu = document.getElementById('coffeeMenu');
						    var storeMenu = document.getElementById('storeMenu');
						    var parkMenu = document.getElementById('parkMenu');
						    var restaurantMenu = document.getElementById('restaurantMenu');
						    var hotelMenu = document.getElementById('hotelMenu');
						    var hospitalMenu = document.getElementById('hospitalMenu');
						    var salonMenu = document.getElementById('salonMenu');
						   
						    
						    // 커피숍 카테고리가 클릭됐을 때
						    if (type === 'coffee') {
						    
						        // 커피숍 카테고리를 선택된 스타일로 변경하고
						        coffeeMenu.className = 'menu_selected';
						        
						        // 편의점과 애견파크, 식당, 호텔 등 카테고리는 선택되지 않은 스타일로 바꿉니다
						        storeMenu.className = '';
						        parkMenu.className = '';
						        restaurantMenu.className = '';
						        hotelMenu.className = '';
						        hospitalMenu.className = '';
						        salonMenu.className = '';
						        
						        // 커피숍 마커들만 지도에 표시하도록 설정합니다
						        setCoffeeMarkers(map);
						        setStoreMarkers(null);
						        setParkMarkers(null);
						        setRestaurantMarkers(null);
						        setHotelMarkers(null);
						        setHospitalMarkers(null);
						        setSalonMarkers(null);
						        
						        
						        
						        //clusterer.addMarker(coffeeMarkers);  // 마커를 클러스터러에 추가
						        
						    } else if (type === 'store') { // 편의점 카테고리가 클릭됐을 때
						    
						        // 편의점 카테고리를 선택된 스타일로 변경하고
						        coffeeMenu.className = '';
						        storeMenu.className = 'menu_selected';
						        parkMenu.className = '';
						        restaurantMenu.className = '';
						        hotelMenu.className = '';
						        hospitalMenu.className = '';
						        salonMenu.className = '';
						        
						        // 편의점 마커들만 지도에 표시하도록 설정합니다
						        setCoffeeMarkers(null);
						        setStoreMarkers(map);
						        setParkMarkers(null);
						        setRestaurantMarkers(null);
						        setHotelMarkers(null);
						        setHospitalMarkers(null);
						        setSalonMarkers(null);
						        
						        //clusterer.addMarker(storeMarkers);  // 마커를 클러스터러에 추가
						        
						    } else if (type === 'park') { // 애견파크 카테고리가 클릭됐을 때
						     
						        // 애견파크 카테고리를 선택된 스타일로 변경하고
						        coffeeMenu.className = '';
						        storeMenu.className = '';
						        parkMenu.className = 'menu_selected';
						        restaurantMenu.className = '';
						        hotelMenu.className = '';
						        hospitalMenu.className = '';
						        salonMenu.className = '';
						        
						        // 애견파크 마커들만 지도에 표시하도록 설정합니다
						        setCoffeeMarkers(null);
						        setStoreMarkers(null);
						        setParkMarkers(map);  
						        setRestaurantMarkers(null);
						        setHotelMarkers(null);
						        setHospitalMarkers(null);
						        setSalonMarkers(null);
						        
						        //clusterer.addMarker(parkMarkers);  // 마커를 클러스터러에 추가
						        
						    } else if (type === 'restaurant') { // 식당 카테고리가 클릭됐을 때
							     
						        // 식당 카테고리를 선택된 스타일로 변경하고
						        coffeeMenu.className = '';
						        storeMenu.className = '';
						        parkMenu.className = '';
						        restaurantMenu.className = 'menu_selected';
						        hotelMenu.className = '';
						        hospitalMenu.className = '';
						        salonMenu.className = '';
						        
						        // 식당 마커들만 지도에 표시하도록 설정합니다
						        setCoffeeMarkers(null);
						        setStoreMarkers(null);
						        setParkMarkers(null);  
						        setRestaurantMarkers(map);
						        setHotelMarkers(null);
						        setHospitalMarkers(null);
						        setSalonMarkers(null);
						        
						        //clusterer.addMarker(restaurantMarkers);  // 마커를 클러스터러에 추가
						        
						    } else if (type === 'hotel') { // 호텔 카테고리가 클릭됐을 때
							     
						        // 식당 카테고리를 선택된 스타일로 변경하고
						        coffeeMenu.className = '';
						        storeMenu.className = '';
						        parkMenu.className = '';
						        restaurantMenu.className = '';
						        hotelMenu.className = 'menu_selected';
						        hospitalMenu.className = '';
						        salonMenu.className = '';
						        
						        // 식당 마커들만 지도에 표시하도록 설정합니다
						        setCoffeeMarkers(null);
						        setStoreMarkers(null);
						        setParkMarkers(null);  
						        setRestaurantMarkers(null);
						        setHotelMarkers(map);
						        setHospitalMarkers(null);
						        setSalonMarkers(null);
						        
						        //clusterer.addMarker(hotelMarkers);  // 마커를 클러스터러에 추가

						    } else if (type === 'hospital') { // 병원 카테고리가 클릭됐을 때
							     
						        // 병원 카테고리를 선택된 스타일로 변경하고
						        coffeeMenu.className = '';
						        storeMenu.className = '';
						        parkMenu.className = '';
						        restaurantMenu.className = '';
						        hotelMenu.className = '';
						        hospitalMenu.className = 'menu_selected';
						        salonMenu.className = '';
						        
						        // 병원 마커들만 지도에 표시하도록 설정합니다
						        setCoffeeMarkers(null);
						        setStoreMarkers(null);
						        setParkMarkers(null);  
						        setRestaurantMarkers(null);
						        setHotelMarkers(null);
						        setHospitalMarkers(map);
						        setSalonMarkers(null);
						        
						        //clusterer.addMarker(hotelMarkers);  // 마커를 클러스터러에 추가
  
						} else if (type === 'salon') { // 미용실 카테고리가 클릭됐을 때
						     
					        // 미용실 카테고리를 선택된 스타일로 변경하고
					        coffeeMenu.className = '';
					        storeMenu.className = '';
					        parkMenu.className = '';
					        restaurantMenu.className = '';
					        hotelMenu.className = '';
					        hospitalMenu.className = '';
					        salonMenu.className = 'menu_selected';
					        
					        // 미용실 마커들만 지도에 표시하도록 설정합니다
					        setCoffeeMarkers(null);
					        setStoreMarkers(null);
					        setParkMarkers(null);  
					        setRestaurantMarkers(null);
					        setHotelMarkers(null);
					        setHospitalMarkers(null);
					        setSalonMarkers(map);
					        
					        //clusterer.addMarker(hotelMarkers);  // 마커를 클러스터러에 추가

						} 
					}
						
						function setCurrentLocation() {   	//현위치로 이동
							start();
						}
						
						/* function setMarkers(Positions){
							// 커피숍 카테고리가 클릭됐을 때
						    if (Positions === 'coffeePositions') {
						        
							Positions.map(function(position) {  // 마커를 배열 단위로 묶음
						        return new kakao.maps.Marker({
						            position : new kakao.maps.LatLng(position.lat, position.lng)
						        });
						    });
						} */
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