<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${marker.name}</title>
</head>
<body>
	<h1>Marker Details</h1>
    <p>Name: <span>${marker.name}</span></p>
	<p>Address: <span>${marker.address}</span></p>
	<p>Hours: <span>${marker.hours}</span></p>
	<p>Tel: <span>${marker.tel}</span></p>
	<p>Comment: <span>${marker.comment}</span></p>

</body>
</html>