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
    
	<!-- css, js script -->
	<%@include file="../fragments/common-css.jsp" %>
	

	
</head>

<body>

	<!-- header -->
	<%@include file="../fragments/header.jsp" %>
	
	<!-- nav -->
	<%@include file="../fragments/nav.jsp" %>

	<!-- include summernote css/js -->
  	<script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
  	<script src="${pageContext.request.contextPath}/resources/summernote/summernote-ko-KR.min.js"></script>

	<main>
	<section class="text-left" style="margin: auto; padding: 5% 0;">
			<div class="container">
					
				<form action="../dictionary/write" method="post">
					<div class="mb-3 row">
						<label class="col-sm-1 col-form-label">제목</label>
						<div class="col-sm-5">
							<input type="text" name="content_title" class="form-control" placeholder="제목을 입력해주세요">
						</div>
					</div>
					
				    <textarea class="form-control" name="content_item" id="exampleTextarea" rows="15"
				    	cols="50" wrap="hard"></textarea>
	    			<br>
	    			
	    			<div class="d-grid gap-2 d-md-flex justify-content-md-end">	
		    			<input class="btn btn-dark btn-sm" type="submit" value="등록">
		    			<a href="<c:url value="/dictionary/main"/>" role="button" class="btn btn-outline-dark btn-sm">취소</a>		    			
			    	</div>
				</form>
		</section>
	</main>
	

	<!-- footer -->
	<%@include file="../fragments/footer.jsp" %>

	<%@include file="../fragments/common-js.jsp" %>
</body>
</html>