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
	<%@include file="../../fragments/common-css.jsp"%>
	

</head>

<body>

	<!-- header -->
	<%@include file="../../fragments/header.jsp"%>

	<!-- nav -->
	<%@include file="../../fragments/nav.jsp"%>


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
						
						
						<div id="flush-collapseOne" class="accordion-collapse collapse"
							aria-labelledby="flush-headingOne"
							data-bs-parent="#accordionFlushExample">
							<div class="accordion-body">

								<!--  댓글 목록 -->
								<c:choose>
									<c:when test="${commentList != null and fn:length(commentList) > 0}">
											<c:forEach items="${commentList}" var="comment">
												<div>
													<p><b>${comment.writer}</b> <small>${comment.regDate}</small></p>
													<p>${comment.content}</p>
												</div>
												<div>
													<input class="btn btn-outline-dark btn-sm" onclick="location.href='../board/comment/modify?bno=${board.boardIdx}&cno=${comment.commentIdx}'" type="submit" value="수정" />
													<input type="hidden" name="boardIdx" value="${comment.boardIdx}"/>
													<input type="hidden" name="commentIdx" value="${comment.commentIdx}"/>
													<input class="btn btn-outline-dark btn-sm" onclick="location.href='../board/comment/delete?bno=${board.boardIdx}&cno=${comment.commentIdx}'" type="submit" value="삭제" />
													<input class="btn btn-outline-dark btn-sm" onclick="location.href='../board/comment/reply?bno=${board.boardIdx}&cno=${comment.commentIdx}'" type="submit" value="답글" />
												</div>
												<hr>
											</c:forEach>
									</c:when>
									
									<c:otherwise>
									<!-- 등록된 댓글이 없을 경우 -->
										<div>
											<p><h5>첫 댓글을 작성해주세요!</h5></p>
										</div>
									</c:otherwise>	
								</c:choose>
								
								<!-- 댓글 작성 폼 -->	
								<form action="../board/comment/write" method="post">
									<div class="form-floating">
									  <p><input type="text" name="writer" placeholder="작성자"/></p>
									  <textarea class="form-control" name="content" id="floatingTextarea2" style="height: 100px" placeholder="답글을 입력해주세요"></textarea>
									  <input type="hidden" name="boardIdx" value="${board.boardIdx}"/><br>
									  <input class="btn btn-outline-secondary btn-sm" data-mdb-ripple-color="dark" type="submit" value="등록"/>
									</div>	
								</form>
								<hr>					
							</div>
						</div>

					</div>
				</div>

			</div>
		</section>
	</main>



	<!-- footer -->
	<%@include file="../../fragments/footer.jsp"%>

	<%@include file="../../fragments/common-js.jsp"%>
</body>
</html>