<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	
</head>

<body id="section_1">

	<!-- header -->
	<%@include file="../fragments/header.jsp" %>
	
	<!-- nav -->
	<%@include file="../fragments/nav.jsp" %>
	
	<main>		
		<section class="text-left" style="margin: auto; padding: 5% 0;">
			<div class="container">
			
				<h3 class="." style="color: var(--primary-color)">💡 반려동물 꿀팁 💡</h3>
				
				<hr>
				<br>
				
				<c:choose>
					<c:when test="${dictionaryList != null and fn:length(dictionaryList) > 0}">

						<caption>
							<div class="container text-center mt-3">
								<div class="row row-cols-1 row-cols-md-4 g-4">
									<c:forEach items="${dictionaryList}" var="dictionary">

										<div class="col">
											<div class="card h-100" style="width: 18rem"
												onclick="location.href='../dictionary/detail?no=${dictionary.content_idx}'">
												<div class="card-body bg-light text-dark"> 
													<h6 class="card-title">${dictionary.content_title}</h6>
													<p class="card-text text-danger small">${dictionary.content_idx} 번째 📝</p>
													<span class="d-inline-block text-truncate" style="max-width: 200px;">${dictionary.content_item}</span>
													
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</caption>

					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>

				<br><hr>
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					<a href="<c:url value="/dictionary/write"/>" role="button"
						style="color: var(- -primary-color)">글쓰기</a>
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