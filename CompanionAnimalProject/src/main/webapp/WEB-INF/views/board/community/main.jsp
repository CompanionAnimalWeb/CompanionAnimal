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
							<img src="${pageContext.request.contextPath}/resources/images/animal_house3.png" style="width:50px; height:50px;">
						</h3>
						<span>
							<small class="small-font text-secondary">반려동물과 관련하여 다양한 이야기를 나눌 수 있는 커뮤니티 공간</small>
						</span>
					</div>
			
				</div>
				
				<div class="d-flex flex-row-reverse">
		            <div class="d-flex justify-content-lg-end">
					    <input class="form-control border-gray border-1 rounded-pill" type="search" placeholder="찾으시는 글이 있으신가요?" aria-label="Search" aria-describedby="search-heart" style="font-size:small" size=40/>
                		<button class="btn my-2 my-sm-0" type="submit"><i class="bi-search"></i></button>
                	</div>	
				</div>
                <div>
               		<p></p>
                </div>
                
				<table class="table table-bordered table-hover" style="font-size:small; text-align:center">
				  <thead>
				    <tr class="table-light table-striped">
				      <th scope="col">번호</th>
				      <th scope="col">제목</th>
				      <th scope="col">작성자</th>
				      <th scope="col">조회수</th>
				      <th scope="col">작성일</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row">1</th>
				      <td>Mark</td>
				      <td>Otto</td>
				      <td>@mdo</td>
				      <td></td>
				    </tr>
				    <tr>
				      <th scope="row">2</th>
				      <td>Jacob</td>
				      <td>Thornton</td>
				      <td>@fat</td>
				      <td></td>
				    </tr>
				    <tr>
				      <th scope="row">3</th>
				      <td>Jacob</td>
				      <td>Thornton</td>
				      <td>@fat</td>
				      <td></td>
				    </tr>
				    <tr>
				      <th scope="row">4</th>
				      <td>Jacob</td>
				      <td>Thornton</td>
				      <td>@fat</td>
				      <td></td>
				    </tr>
				    <tr>
				      <th scope="row">5</th>
				      <td>Jacob</td>
				      <td>Thornton</td>
				      <td>@fat</td>
				      <td></td>
				    </tr>
				    <tr>
				      <th scope="row">6</th>
				      <td>Jacob</td>
				      <td>Thornton</td>
				      <td>@fat</td>
				      <td></td>
				    </tr>
				    <tr>
				      <th scope="row">7</th>
				      <td>Jacob</td>
				      <td>Thornton</td>
				      <td>@fat</td>
				      <td></td>
				    </tr>
				    <tr>
				      <th scope="row">8</th>
				      <td>Jacob</td>
				      <td>Thornton</td>
				      <td>@fat</td>
				      <td></td>
				    </tr>
				    <tr>
				      <th scope="row">9</th>
				      <td>Jacob</td>
				      <td>Thornton</td>
				      <td>@fat</td>
				      <td></td>
				    </tr>
				    <tr>
				      <th scope="row">10</th>
				      <td>Jacob</td>
				      <td>Thornton</td>
				      <td>@fat</td>
				      <td></td>
				    </tr>	    					    					    					    
				  </tbody>
				</table>
				
			
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">	
					<p class="d-flex justify-content-center">1 2 3 4 페이지 들어갈 자리 (디비 연동 후)</p>
					<a href="<c:url value="/board/community/write"/>" role="button" style="color: var(--primary-color)">글쓰기</a>
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