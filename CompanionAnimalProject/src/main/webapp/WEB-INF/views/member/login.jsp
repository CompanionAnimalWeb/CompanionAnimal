<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<%@include file="../fragments/common-css.jsp" %>
	
</head>

<body id="section_1">

	<!-- header -->
	<%@include file="../fragments/header.jsp" %>
	
	<!-- nav -->
	<%@include file="../fragments/nav.jsp" %>
	
   <main>

        <section class="donate-section">
            <div class="section-overlay"></div>
            <div class="container">
                <div class="row">

                    <div class="col-lg-6 col-12 mx-auto">
                        <form class="custom-form donate-form" action="signinCheck" method="post">
                            <h3 class="mb-4">LOGIN</h3>
				
                            <div class="row">
                                <div class="col-lg-12 col-12">
                                	<h5 class="mb-1">ID</h5>
									<input type="text" name="id" class="form-control" id="exampleFormControlInput1" value="${user.id}"/>
									<br>
									<h5 class="mb-1">Password</h5>
									<input type="password" name="password" class="form-control" id="exampleFormControlInput1" placeholder=""/>								 
									<b>${message}</b>
								</div>
								
								<button type="submit" class="form-control mt-4">로그인</button>
							 	<a class="mt-4 custom-btn custom-border-btn btn" href="<c:url value="findInfo"/>">아이디 찾기</a>
                               	<br>
                               	<a class="mt-4 custom-btn custom-border-btn btn" href="<c:url value="../member/join"/>">회원가입</a>
                            </div>
                        </form>
                    </div>

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