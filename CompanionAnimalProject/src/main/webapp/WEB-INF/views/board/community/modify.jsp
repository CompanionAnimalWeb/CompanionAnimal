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
	<%@include file="../../fragments/common-css.jsp" %>
	

	
</head>

<body>

	<!-- header -->
	<%@include file="../../fragments/header.jsp" %>
	
	<!-- nav -->
	<%@include file="../../fragments/nav.jsp" %>

	<!-- include summernote css/js -->
  	<script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
  	<script src="${pageContext.request.contextPath}/resources/summernote/summernote-ko-KR.min.js"></script>
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
  

	<main>
	<section class="text-left" style="margin: auto; padding: 5% 0;">
			<div class="container">
               	<div class="col-8">
					<h3 class="." style="color: var(--primary-color)">자유롭게 작성해주세요 😊</h3><br>
					<span>
						<small class="small-font text-secondary">※ 누구든지 정보통신망을 통해 사람을 비방할 목적으로 공공연하게 사실이나 거짓의 사실을 드러내어 
						<br> 타인의 명예를 훼손하는 내용의 정보를 유통해서는 안 됩니다.</small>
					</span>
				</div>
				<br><br>
					
				<form action="../board/modify" method="post">
					<div class="mb-3 row">
						<label class="col-sm-1 col-form-label">제목</label>
						<div class="col-sm-5">
							<input type="text" name="title" class="form-control" value=${board.title}>
						</div>
					</div>
					
				    <textarea class="form-control" name="content" id="exampleTextarea" rows="15">${board.content}</textarea>
					
					<br>
					
				    <div class="form-group mb-3 row">
				    	<label class="col-sm-1 col-form-label"><small>첨부파일1</small></label>
						<div class="col-sm-5">
							<input class="form-control" type="file" id="formFile">
						</div>
				    </div>	
				    <div class="form-group mb-3 row">
				    	<label class="col-sm-1 col-form-label"><small>첨부파일2</small></label>
						<div class="col-sm-5">
							<input class="form-control" type="file" id="formFile">
						</div>
				    </div>	
				    
	    			<br>
	    			
	    			<div class="d-grid gap-2 d-md-flex justify-content-md-end">	
		    			<input type="hidden" name="boardIdx" value="${board.boardIdx}"/>
		    			<input class="btn btn-dark btn-sm" type="submit" value="등록">
		    			<a href="<c:url value="/board/community/main"/>" role="button" class="btn btn-outline-dark btn-sm">취소</a>		    			
			    	</div>
				</form>
		</section>
	</main>
	
	
	
	<script>
	$(document).ready(function() {
	     $('.summernote').summernote({
	             height: 500,                 // set editor height
	             focus: true                  // set focus to editable area after initializing summernote
	     });
	});
	</script>
	

	<!-- footer -->
	<%@include file="../../fragments/footer.jsp" %>

	<%@include file="../../fragments/common-js.jsp" %>
</body>
</html>