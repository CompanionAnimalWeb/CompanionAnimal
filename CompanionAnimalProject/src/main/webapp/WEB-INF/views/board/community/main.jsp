<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="">
    <meta name="author" content="">

    <title>신비한 동물사전</title>
    
	<!-- css script -->
	<%@include file="../../fragments/common-css.jsp" %>
	
</head>



<body id="section_1">

	<!-- header -->
	<%@include file="../../fragments/header.jsp" %>
	
	<!-- nav -->
	<%@include file="../../fragments/nav.jsp" %>
	
	<main>		
		<section class="text-left" style="margin: auto; padding: 5% 0;">
			<div class="container">
                <div class="row">
                	<div class="col-8">
						<h3 class="." style="color: var(--primary-color)">Community
							<img src="${pageContext.request.contextPath}/resources/images/animal_house3.png" style="width:50px; height:50px;"/>
						</h3>
						<span>
							<small class="small-font text-secondary">펫과 관련하여 다양한 이야기를 나눌 수 있는 커뮤니티 공간</small>
						</span>
					</div>
			
				</div>
				
				<hr>
				
				<form action="../board/listSearch">
					<div class="d-flex flex-row-reverse">
			            <div class="d-flex justify-content-lg-end">
						 
						    <input class="form-control border-gray border-1 rounded-pill" type="search" name="keyword"
						    	placeholder="찾으시는 글이 있으신가요?" aria-label="Search" aria-describedby="search-heart" style="font-size:small" size=40>
	                		<button class="btn my-2 my-sm-0" type="submit" onclick="location.href='../board/mainSearch?keyword=${keyword}'"><i class="bi-search"></i></button>
	                	</div>	
					</div>
				</form>
                <div>
               		<p></p>
                </div>
                
				<table class="table table-bordered table-hover" style="font-size:small; text-align:center">
					<tr class="table-light">
				    	<th scope="col" style="width:10%">번호</th>
				    	<th scope="col" style="width:50%">제목</th>
				    	<th scope="col" style="width:20%">작성자</th>
				    	<th scope="col" style="width:20%">작성일</th>
				    </tr>
				  	<c:choose>
					  	<c:when test="${boardList != null and fn:length(boardList) > 0}">
							<c:forEach items="${boardList}" var="board">
								<tr onclick="location.href='../board/detail?bno=${board.boardIdx}'">
							     	<th>${board.boardIdx}</th>
							      	<td>${board.title}</td>
							      	<td>${board.id}</td>
						      		<td>${board.regDate}</td>
								</tr>
							</c:forEach>
					    </c:when>
						<c:otherwise>
						  	<!-- 등록된 게시물이 없는 경우 -->
					  		<tr style="height: 30px;">
								<td colspan="5" style="text-align: center;">등록된 게시물이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
				
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">	
					<c:if test="${userInfo != null }">
						<button type="button" class="btn btn-outline-secondary">
							<a href="<c:url value="/board/write"/>" role="ㅣbutton" style="color: var(--primary-color)"><small>글쓰기</small></a>
						</button>
					</c:if>
				</div>
							
				<div class="d-flex justify-content-center">	
					<p class="d-flex justify-content-center">
					<c:choose>
					 <c:when test="${pageMaker != null}">
						<c:forEach var="idx" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<a href="list?page=${idx}">${idx}&nbsp;&nbsp;</a>
                     	</c:forEach>
                     </c:when>
                     </c:choose>
					</p>
				</div>

			<div>
		</div>
				
		</section>
	</main>

	<!-- footer -->
	<%@include file="../../fragments/footer.jsp" %>

	<!-- js -->
	<%@include file="../../fragments/common-js.jsp" %>
	
</body>
</html>