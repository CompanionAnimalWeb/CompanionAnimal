<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>신비한 동물사전</title>
	
	<!-- css, js script -->
	<%@include file="../fragments/common-css.jsp"%>
	

</head>

<body>

	<!-- header -->
	<%@include file="../fragments/header.jsp"%>

	<!-- nav -->
	<%@include file="../fragments/nav.jsp"%>


	<main>
		<section class="text-left" style="margin: auto; padding: 5% 0;">
			<div class="container">
				<div class="col-8">
					<h3 class="." style="color: var(--primary-color)">📄✏️</h3>
					<br>
				</div>
				<br>
				<!-- 게시글 내용 영역 -->
				<table class="table"
					style="font-size: small; text-align: left">
					<tr>
						<td colspan="2"><h5>${dictionary.content_title}</h5></td>
					</tr>
				</table>

				<br>
				<div>
					<p>${dictionary.content_item}</p>
				</div>
				
				<br>
				<hr>

			</div>
		</section>
	</main>


	<!-- footer -->
	<%@include file="../fragments/footer.jsp"%>
	<%@include file="../fragments/common-js.jsp"%>
	
</body>
</html>