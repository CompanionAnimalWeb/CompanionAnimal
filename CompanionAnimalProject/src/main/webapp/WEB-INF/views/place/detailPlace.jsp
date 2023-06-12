<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${marker.name}</title>
</head>
<body>
	<h1>${marker.name}</h1>
    <img src="${pageContext.request.contextPath}/resources/images/map/placeImages/${marker.imagePath}" style="width:25%; height:25%;">
   	<p>Address: <span>${marker.address}</span></p>
	<p>Hours: <span>${marker.hours}</span></p>
	<p>Tel: <span>${marker.tel}</span></p>
	<p>Comment: <span>${marker.comment}</span></p>

</body>
</html>