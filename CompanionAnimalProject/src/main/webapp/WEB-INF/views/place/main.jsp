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
						coffeePositions.push({
						    latlng : new kakao.maps.LatLng(${coffee.latitude}, ${coffee.longitude}),
							name : '${coffee.name}',
							address : '${coffee.address}'              
						});
						</script>
						</c:forEach>

						<c:forEach items="${storeList}" var="store">
						<script>
						//마트 마커가 표시될 좌표 배열입니다
						storePositions.push({
						    latlng : new kakao.maps.LatLng(${store.latitude}, ${store.longitude}),
							name : '${store.name}',
							address : '${store.address}'              
						});
						</script>
						</c:forEach>
						
						<c:forEach items="${parkList}" var="park">
						<script>
						// 공원 마커가 표시될 좌표 배열입니다
						parkPositions.push({
						    latlng : new kakao.maps.LatLng(${park.latitude}, ${park.longitude}),
							name : '${park.name}',
							address : '${park.address}'              
						});
						</script>
						</c:forEach>
						
						<c:forEach items="${restaurantList}" var="restaurant">
						<script>
						// 식당 마커가 표시될 좌표 배열입니다
						restaurantPositions.push({
						    latlng : new kakao.maps.LatLng(${restaurant.latitude}, ${restaurant.longitude}),
							name : '${restaurant.name}',
							address : '${restaurant.address}'             
						});
						</script>
						</c:forEach>
						
						<c:forEach items="${hotelList}" var="hotel">
						<script>
						// 호텔 마커가 표시될 좌표 배열입니다
						hotelPositions.push({
						    latlng : new kakao.maps.LatLng(${hotel.latitude}, ${hotel.longitude}),
							name : '${hotel.name}',
							address : '${hotel.address}'              
						});
						</script>
						</c:forEach>
						
						<c:forEach items="${hospitalList}" var="hospital">
						<script>
						// 병원 마커가 표시될 좌표 배열입니다
						hospitalPositions.push({
						    latlng : new kakao.maps.LatLng(${hospital.latitude}, ${hospital.longitude}),
							name : '${hospital.name}',
							address : '${hospital.address}'            
						});
						</script>
						</c:forEach>
						
						<c:forEach items="${salonList}" var="salon">
						<script>
						// 미용실 마커가 표시될 좌표 배열입니다
						salonPositions.push({
						    latlng : new kakao.maps.LatLng(${salon.latitude}, ${salon.longitude}),
							name : '${salon.name}',
							address : '${salon.address}'              
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
						
						changeMarker('coffee'); // 지도에 커피숍 마커가 보이도록 설정합니다    
						
						start();			//현재 위치에서 시작
						

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
						
						//인포윈도우 내용
						function nameAddress(array){
							var html = '<div style="padding:5px;">Name : ' + array.name + '<br>';
							  	html += 'Address : ' + array.address + '</div>';
							  	
							return html;
						}
						
						
						//마커에 인포윈도우 생성
						function createMarker(map, positionData) {
						  	var marker = new kakao.maps.Marker({
						    	position: positionData.latlng,
						    	clickable: true
							});
						
							marker.setMap(map);
						
						  	var infowindow = new kakao.maps.InfoWindow({
						    	content: nameAddress(positionData),
						    	removable: true
						  	});
						
						  	kakao.maps.event.addListener(marker, 'click', function () {
						    	infowindow.open(map, marker);
						  	});
						  	
						  	positionData.marker = marker; // positionData 객체에 marker 속성으로 저장합니다.
						}
						
						
						// 마커들을 표시하는 함수
						function setMarkers(map, positions) {
						  for (var i = 0; i < positions.length; i++) {
						    createMarker(map, positions[i]);
						  }
						}

						// 마커 유형에 따라 해당하는 함수 호출
						function setMarkersByType(map, markerType) {
							switch (markerType) {
								case 'coffee':
						      		setMarkers(map, coffeePositions);
						      		break;
						    	
								case 'store':
						      		setMarkers(map, storePositions);
						      		break;
						    	
						    	case 'park':
						      		setMarkers(map, parkPositions);
						      		break;
						    	
						    	case 'restaurant':
						      		setMarkers(map, restaurantPositions);
						      		break;
						    	
						    	case 'hotel':
						      		setMarkers(map, hotelPositions);
						      		break;
						    	
						    	case 'hospital':
						      		setMarkers(map, hospitalPositions);
						      		break;
						    	
						    	case 'salon':
						      		setMarkers(map, salonPositions);
						      		break;
						    	
						    	default:
						      		break;
							}
						}
						
						//해당 카테고리를 제외한 나머지 카테고리의 마커들을 지도에서 제거
						function removeMarkersByType(selectedType) {
							var allPositions = [coffeePositions, storePositions, parkPositions, restaurantPositions, hotelPositions, hospitalPositions, salonPositions];

							for (var i = 0; i < allPositions.length; i++) {
								var positions = allPositions[i];

								if (selectedType !== positions) {
									for (var j = 0; j < positions.length; j++) {
										if (positions[j].marker) {
											positions[j].marker.setMap(null); // 각 마커를 지도에서 제거합니다.
										}
							      	}
								}
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
						    
						        // 커피숍 카테고리를 선택된 스타일로 변경
						        coffeeMenu.className = 'menu_selected';
						        storeMenu.className = '';
						        parkMenu.className = '';
						        restaurantMenu.className = '';
						        hotelMenu.className = '';
						        hospitalMenu.className = '';
						        salonMenu.className = '';
						        
						        // 커피숍 마커들만 지도에 표시하도록 설정합니다
						        setMarkersByType(map, 'coffee');
						        removeMarkersByType(coffeePositions);
						        
						    } else if (type === 'store') { // 편의점 카테고리가 클릭됐을 때
						    
						        // 편의점 카테고리를 선택된 스타일로 변경
						        coffeeMenu.className = '';
						        storeMenu.className = 'menu_selected';
						        parkMenu.className = '';
						        restaurantMenu.className = '';
						        hotelMenu.className = '';
						        hospitalMenu.className = '';
						        salonMenu.className = '';
						        
						        // 편의점 마커들만 지도에 표시하도록 설정합니다
						        setMarkersByType(map, 'store');
						        removeMarkersByType(storePositions);
						        
						    } else if (type === 'park') { // 애견파크 카테고리가 클릭됐을 때
						     
						        // 애견파크 카테고리를 선택된 스타일로 변경
						        coffeeMenu.className = '';
						        storeMenu.className = '';
						        parkMenu.className = 'menu_selected';
						        restaurantMenu.className = '';
						        hotelMenu.className = '';
						        hospitalMenu.className = '';
						        salonMenu.className = '';
						        
						        // 애견파크 마커들만 지도에 표시하도록 설정합니다
						        setMarkersByType(map, 'park');
						        removeMarkersByType(parkPositions);
						        
						    } else if (type === 'restaurant') { // 식당 카테고리가 클릭됐을 때
							     
						        // 식당 카테고리를 선택된 스타일로 변경
						        coffeeMenu.className = '';
						        storeMenu.className = '';
						        parkMenu.className = '';
						        restaurantMenu.className = 'menu_selected';
						        hotelMenu.className = '';
						        hospitalMenu.className = '';
						        salonMenu.className = '';
						        
						        // 식당 마커들만 지도에 표시하도록 설정합니다
						        setMarkersByType(map, 'restaurant');
						        removeMarkersByType(restaurantPositions);
						        
						    } else if (type === 'hotel') { // 호텔 카테고리가 클릭됐을 때
							     
						        // 식당 카테고리를 선택된 스타일로 변경
						        coffeeMenu.className = '';
						        storeMenu.className = '';
						        parkMenu.className = '';
						        restaurantMenu.className = '';
						        hotelMenu.className = 'menu_selected';
						        hospitalMenu.className = '';
						        salonMenu.className = '';
						        
						        // 호텔 마커들만 지도에 표시하도록 설정합니다
						        setMarkersByType(map, 'hotel');
						        removeMarkersByType(hotelPositions);
						       
						    } else if (type === 'hospital') { // 병원 카테고리가 클릭됐을 때
							     
						        // 병원 카테고리를 선택된 스타일로 변경
						        coffeeMenu.className = '';
						        storeMenu.className = '';
						        parkMenu.className = '';
						        restaurantMenu.className = '';
						        hotelMenu.className = '';
						        hospitalMenu.className = 'menu_selected';
						        salonMenu.className = '';
						        
						        // 병원 마커들만 지도에 표시하도록 설정합니다
						        setMarkersByType(map, 'hospital');
						        removeMarkersByType(hospitalPositions);
						        
							} else if (type === 'salon') { // 미용실 카테고리가 클릭됐을 때
							     
						        // 미용실 카테고리를 선택된 스타일로 변경
						        coffeeMenu.className = '';
						        storeMenu.className = '';
						        parkMenu.className = '';
						        restaurantMenu.className = '';
						        hotelMenu.className = '';
						        hospitalMenu.className = '';
						        salonMenu.className = 'menu_selected';
						        
						        // 미용실 마커들만 지도에 표시하도록 설정합니다
						        setMarkersByType(map, 'salon');
						        removeMarkersByType(salonPositions);
							} 
						}
						
						
						function setCurrentLocation() {   	//현위치로 이동
							start();
						}
						
						
						// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
						function makeOverListener(map, marker, infowindow) {
						    return function() {
						        infowindow.open(map, marker);
						    };
						}

						// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
						function makeOutListener(infowindow) {
						    return function() {
						        infowindow.close();
						    };
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

		</section>
	</main>

	<!-- footer -->
	<%@include file="../fragments/footer.jsp" %>

	<!-- js -->
	<%@include file="../fragments/common-js.jsp" %>
	
</body>
</html>