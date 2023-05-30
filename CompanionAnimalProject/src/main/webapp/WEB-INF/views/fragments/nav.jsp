<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <nav class="navbar navbar-expand-lg bg-light shadow-lg">
        <div class="container">
            <a class="navbar-brand" href="<c:url value="/main"/>">
                <img src="${pageContext.request.contextPath}/resources/images/logo/Logo.png" class="logo img-fluid" alt="Kind Heart Charity">
                <span>
                    Companion Animal Community
                    <small>신비한 동물사전</small>
                </span>
            </a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link click-scroll" href="<c:url value="/main"/>">Home</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/board/list?page=1"/>">견사무소</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/place/main"/>">우리동네</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/board/hospital/main"/>">동물병원</a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link click-scroll dropdown-toggle" href="#section_5"
                            id="navbarLightDropdownMenuLink" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">동물보감</a>
                    </li>

					<c:if test="${userInfo ==null }">
                    <li class="nav-item ms-3">
                        <a class="nav-link custom-btn custom-border-btn btn" href="<c:url value="/member/login"/>">로그인</a>
                    </li>
                    </c:if>
                    <c:if test="${userInfo !=null }">
                    <a class="nav-link custom-btn custom-border-btn btn" href="<c:url value="/board/community/myPage"/>">마이페이지</a>
                    <a class="nav-link custom-btn custom-border-btn btn" href="<c:url value="/member/logout"/>">로그아웃</a>                        	
					</c:if>
                </ul>
            </div>
        </div>
    </nav>