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
<%@include file="../../fragments/common-css.jsp"%>



</head>

<body>

	<!-- header -->
	<%@include file="../../fragments/header.jsp"%>

	<!-- nav -->
	<%@include file="../../fragments/nav.jsp"%>

	<!-- include summernote css/js -->
	<script
		src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/summernote/summernote-ko-KR.min.js"></script>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">


	<main>
		<section class="text-left" style="margin: auto; padding: 5% 0;">
			<div class="container">
				<div class="col-8">
					<h3 class="." style="color: var(--primary-color)">📄✏️</h3>
					<br>
				</div>
				<br>

				<table class="table"
					style="font-size: small; text-align: left">
					<tr>
						<td colspan="2"><h5>${post.title}</h5></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${post.id}</td>
					</tr>
					<tr>
						<th>작성일</th>
						<td>${post.regDate}</td>
					</tr>
				</table>

				<br>
				<div>
					<p>${post.content}</p>
				</div>
				<br>
				<br>

				<hr>				
				<div class="accordion accordion-flush" id="accordionFlushExample">
					<div class="accordion-item">
						<h2 class="accordion-header" id="flush-headingOne">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
								aria-expanded="false" aria-controls="flush-collapseOne">
								<b>Comment 💬</b>
							</button>
						</h2>
						<div id="flush-collapseOne" class="accordion-collapse collapse"
							aria-labelledby="flush-headingOne"
							data-bs-parent="#accordionFlushExample">
							<div class="accordion-body">
								<table class="" style="font-size: small; text-align: left">
									<tr>
										<th>댓글 작성자</th>
									</tr>
									<tr>
										<td>댓글입니다</td>
									</tr>
									<tr>
										<td>2023.04.04</td>
									</tr>
									<tr>
										<td><input class="btn btn-outline-dark btn-sm" type="submit" value="답글" /></td>
									</tr>
								</table>
								<br><br>
								
								<hr>
								<div class="form-floating">
								  <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px"></textarea>
								  <label for="floatingTextarea2">댓글을 입력해주세요</label><br>
								  <input class="btn btn-outline-dark btn-sm" type="submit" value="등록"/>
								</div>							
							</div>
						</div>

					</div>


				</div>



				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					<a href="<c:url value="/board/community/main"/>" role="button"
						class="btn btn-outline-dark btn-sm me-md-3">목록</a>
				</div>

			</div>
		</section>
	</main>



	<!-- footer -->
	<%@include file="../../fragments/footer.jsp"%>

	<%@include file="../../fragments/common-js.jsp"%>
</body>
</html>