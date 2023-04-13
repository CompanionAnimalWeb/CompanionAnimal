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
	<%@include file="../../../fragments/common-css.jsp"%>
	

</head>

<body>

	<!-- header -->
	<%@include file="../../../fragments/header.jsp"%>

	<!-- nav -->
	<%@include file="../../../fragments/nav.jsp"%>


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
						<td colspan="2"><h5>${board.title}</h5></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${board.id}</td>
					</tr>
					<tr>
						<th>작성일</th>
						<td>${board.regDate}</td>
					</tr>
				</table>

				<br>
				<div>
					<p>${board.content}</p>
				</div>
				
				<br>

				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					<a href="../board/modify?bno=${board.boardIdx}" role="button" class="btn btn-outline-dark btn-sm me-md-3">수정</a>
					<a href="../board/delete?bno=${board.boardIdx}" role="button" class="btn btn-outline-dark btn-sm me-md-3">삭제</a>
					<a href="<c:url value="/board/list"/>" role="button" class="btn btn-outline-dark btn-sm me-md-3">목록</a>
				</div>
				
				<br>
				<br>
				<hr>
				
				<!-- 댓글 영역 -->				
				<div class="accordion accordion-flush" id="accordionFlushExample">
					<div class="accordion-item">
						<h2 class="accordion-header" id="flush-headingOne">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
								aria-expanded="false" aria-controls="flush-collapseOne">
							<b>Comment 💬</b>
							</button>
						</h2>
						
						
						<div id="flush-collapseOne" class="accordion-collapse collapse show"
							aria-labelledby="flush-headingOne">
							<div class="accordion-body">
								<!--  comment list form -->
								<c:choose>
									<c:when test="${commentList != null and fn:length(commentList) > 0}">
										<c:forEach items="${commentList}" var="comment">
											<c:choose>
												<c:when test="${comment.commentIdx == cno}">
													  <form action="../comment/modify" method="post">
															<p>${comment.id}</p>
															<textarea class="form-control" name="content" id="floatingTextarea2" style="height: 100px">${comment.content}</textarea>
															<input type="hidden" name="boardIdx" value="${board.boardIdx}"/>
															<input type="hidden" name="commentIdx" value="${comment.commentIdx}"/><br>
															<input class="btn btn-outline-secondary btn-sm" data-mdb-ripple-color="dark" type="submit" value="완료"/>
														  	<hr>
													  </form>
												</c:when>
												<c:otherwise>
													<div>
														<p><b>${comment.id}</b> <small>${comment.regDate}</small></p>
														<p>${comment.content}</p>
													</div>
													<hr>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose>				
							</div>
						</div>
					</div>
				</div>

			</div>
		</section>
	</main>



	<!-- footer -->
	<%@include file="../../../fragments/footer.jsp"%>

	<%@include file="../../../fragments/common-js.jsp"%>
</body>
</html>