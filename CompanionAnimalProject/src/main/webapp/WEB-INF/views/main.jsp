<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<%@include file="fragments/common-css.jsp" %>
	
</head>
<body id="section_1">
	<!-- header -->
	<%@include file="fragments/header.jsp" %>
	
	<!-- nav -->
	<%@include file="fragments/nav.jsp" %>
	
	<main>
        <section class="hero-section hero-section-full-height">
            <div class="container-fluid">
                <div class="row">

                    <div class="col-lg-12 col-12 p-0">
                        <div id="hero-slide" class="carousel carousel-fade slide" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img src="${pageContext.request.contextPath}/resources/images/main/main_image_1.png" 
                                    	height="700" width="2000" class="img-fluid">
                                </div>

                                <div class="carousel-item">
                                    <img src="${pageContext.request.contextPath}/resources/images/main/main_image_2.png"
                                        alt="..." height="700" width="2000" class="img-fluid">
                                </div>

                                <div class="carousel-item">
                                    <img src="${pageContext.request.contextPath}/resources/images/main/main_image_3.png"
                                       alt="..." height="700" width="2000" class="img-fluid">
                                </div>
                            </div>

                            <button class="carousel-control-prev" type="button" data-bs-target="#hero-slide"
                                data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>

                            <button class="carousel-control-next" type="button" data-bs-target="#hero-slide"
                                data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>

                </div>
            </div>
        </section>


        <section class="section-padding">
            <div class="container">
                <div class="row">

                    <div class="col-lg-10 col-12 text-center mx-auto">
                        <h2 class="mb-5">🐶 🐱 🐭 🐹 🐰 🦊 🐻</h2>
                    </div>

                    <div class="col-lg-3 col-md-6 col-12 mb-4 mb-lg-0">
                        <div class="featured-block d-flex justify-content-center align-items-center">
                            <a href="donate.html" class="d-block">
                                <img src="${pageContext.request.contextPath}/resources/images/main/dog2.png" class="featured-block-image img-fluid" alt="">
                            </a>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-12 mb-4 mb-lg-0 mb-md-4">
                        <div class="featured-block d-flex justify-content-center align-items-center">
                            <a href="donate.html" class="d-block">
                                <img src="${pageContext.request.contextPath}/resources/images/main/dog1.png" class="featured-block-image img-fluid" alt="">
                            </a>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-12 mb-4 mb-lg-0 mb-md-4">
                        <div class="featured-block d-flex justify-content-center align-items-center">
                            <a href="donate.html" class="d-block">
                                <img src="${pageContext.request.contextPath}/resources/images/main/cat1.png" class="featured-block-image img-fluid" alt="">
                            </a>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-12 mb-4 mb-lg-0">
                        <div class="featured-block d-flex justify-content-center align-items-center">
                            <a href="donate.html" class="d-block">
                                <img src="${pageContext.request.contextPath}/resources/images/main/cat2.png" class="featured-block-image img-fluid" alt="">

                            </a>
                        </div>
                    </div>

                </div>
            </div>
        </section>

        <section class="section-padding section-bg" id="section_2">
            <div class="container">
                <div class="row">

                    <div class="col-lg-6 col-12 mb-5 mb-lg-0">
                        <img src="${pageContext.request.contextPath}/resources/images/main/main_image.png"
                            style="width=100%;height=100%;object-fit:fill;"
                            class="custom-text-box-image img-fluid" alt="">
                    </div>

                    <div class="col-lg-6 col-12">
                        <div class="custom-text-box">
                            <h2 class="mb-2">Community</h2>
                        </div>
                        
                       	<div class="custom-text-box">
	                       <h5 class="mb-3">동물보감📒</h5>
	                       <p>우리 아이에게 도움이 될만한 여러가지 꿀팁을 확인해볼 수 있어요</p>
                        </div>
                        
                       	<div class="custom-text-box">
	                       <h5 class="mb-3">동물병원🚑</h5>
	                       <p>우리 아이에게 이상 증상이 보인다면? 증상별 병명을 예측해볼 수 있어요</p>
                        </div>                        
                        
                    </div>

                </div>
            </div>
        </section>


        <section class="about-section section-padding" id="section_3">
            <div class="container">
                <div class="row">

                    <div class="col-lg-6 col-md-5 col-12">
                        <img src="${pageContext.request.contextPath}/resources/images/main/main_image_map.png"
                            class="about-image ms-lg-auto bg-light shadow-lg img-fluid" alt="">
                    </div>

                    <div class="col-lg-5 col-md-7 col-12">
                        <div class="custom-text-block">
                            <h2 class="mb-0">우리 동네</h2>
                            <br><br>
                            <h5 class="mb-3">애견 동반 가능한 카페, 음식점 및 여러가지</h5>
                            <h5 class="mb-3">펫 서비스 시설을 빠르게 찾아보세요💙 </h5>
                        </div>
                    </div>

                </div>
            </div>
        </section>



        <section class="contact-section section-padding" id="section_6">
            <div class="container">
                <div class="row">

                    <div class="col-lg-4 col-12 ms-auto mb-5 mb-lg-0">
                        <div class="contact-info-wrap">
                            <h2>만든 사람</h2>

                            <div class="contact-image-wrap d-flex flex-wrap">
                                <img src="${pageContext.request.contextPath}/resources/images/main/main_image_pet.png"
                                    class="img-fluid avatar-image" alt="">

                                <div class="d-flex flex-column justify-content-center ms-3">
                                    <p class="mb-0">우리 조 고생했다🧡</p>
                                    <p class="mb-0"><strong>수빈, 주현, 창현, 훈택</strong></p>
                                </div>
                            </div>

                            <div class="contact-info">
                                <h5 class="mb-3">Contact Infomation</h5>

                                <p class="d-flex mb-2">
                                    <i class="bi-geo-alt me-2"></i>
                                    경상남도 진주시 진주대로629번길 35
                                </p>

                                <p class="d-flex mb-2">
                                    <i class="bi-telephone me-2"></i>

                                    <a href="tel: 055-751-2190">
                                        055-751-2190, 2199
                                    </a>
                                </p>

                                <p class="d-flex">
                                    <i class="bi-envelope me-2"></i>

                                    <a href="petdocter@naver.com">
                                        petdocter@naver.com
                                    </a>
                                </p>

                                <a href="#" class="custom-btn btn mt-3">Get Direction</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-5 col-12 mx-auto">
                        <form class="custom-form contact-form" action="#" method="post" role="form">
                            <h2>Contact form</h2>

                            <p class="mb-4">Or, you can just send an email:
                                <a href="#">petdocter@naver.com</a>
                            </p>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-12">
                                    <input type="text" name="first-name" id="first-name" class="form-control"
                                        placeholder="성" required>
                                </div>

                                <div class="col-lg-6 col-md-6 col-12">
                                    <input type="text" name="last-name" id="last-name" class="form-control"
                                        placeholder="이름" required>
                                </div>
                            </div>

                            <input type="email" name="email" id="email" pattern="[^ @]*@[^ @]*" class="form-control"
                                placeholder="이메일" required>

                            <textarea name="message" rows="5" class="form-control" id="message"
                                placeholder="도움이 필요하신가요?"></textarea>

                            <button type="submit" class="form-control">Send Message</button>
                        </form>
                    </div>

                </div>
            </div>
        </section>
    </main>
	
	<!-- footer -->
	<%@include file="fragments/footer.jsp" %>


	<!-- js script -->
	<%@include file="fragments/common-js.jsp" %>

</body>
</html>