<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

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
                        <form class="custom-form donate-form" action="successMemberJoin" method="post">
                            <h3 class="mb-4">JOIN US</h3>

                            <div class="row">
                                <div class="col-lg-12 col-12">
	                                
	                                <!-- 아이디 -->
	                                <div class="id_wrap">
	                                	<h5 class="mb-1">아이디</h5>
	                                	<div class="id_input_box id_name">
	                                		<input type="text" class="form-control id_input" name="id" value="${user.id}">
	                                		<b>${message }<br></b>
	                                		<spring:hasBindErrors name="user">
	                                		<c:if test="${errors.hasFieldErrors('id') }">                                     
								            <strong>${errors.getFieldError( 'id' ).defaultMessage }</strong>
											</c:if>
											</spring:hasBindErrors>
	                                	</div>
	                                	<div>
	                                		<font id="id_feedback" size="2"></font>
	                                		
	                                	</div>
	                                	
                                	</div>
                                	<br>
                                	
                                	<!-- 비밀번호 -->
  	                                <div class="pw_wrap">
	                                	<h5 class="mb-1">비밀번호</h5>
	                                	<div class="pw_input_box pw_name">
	                                		<input type="password" class="form-control pw_input" name="password" >
	                                		<spring:hasBindErrors name="user">
	                                		<c:if test="${errors.hasFieldErrors('password') }">                                     
								            <strong>${errors.getFieldError( 'password' ).defaultMessage }</strong>
											</c:if>
											</spring:hasBindErrors>
	                                	</div>
	                                	
	                                </div>
	                                <br>
	                               
	                                
	                                <!-- 이름 -->
	                                <div class="user_wrap">
	                                	<h5 class="mb-1">이름</h5>
	                                	<div class="user_input_box user_name">
	                                		<input type="text" class="form-control user_input" name="name" value="${user.name}">
	                                		<spring:hasBindErrors name="user">
	                                		<c:if test="${errors.hasFieldErrors('name') }">                                     
								            <strong>${errors.getFieldError( 'name' ).defaultMessage }</strong>
											</c:if>
											</spring:hasBindErrors>
	                                	</div>
	                                	
	                                </div>
	                                <br>
	                                
	                                <!-- 휴대폰 -->
	                                <div class="user_wrap">
	                                	<h5 class="mb-1">휴대폰</h5>
	                                	<div class="user_input_box user_name">
	                                		<input type="text" class="form-control phone_input" name="phone" value="${user.phone}">
	                                		<spring:hasBindErrors name="user">
	                                		<c:if test="${errors.hasFieldErrors('phone') }">                                     
								            <strong>${errors.getFieldError( 'phone' ).defaultMessage }</strong>
											</c:if>
											</spring:hasBindErrors>
	                                	</div>
	                                	
	                                </div>
	                                <br>
	                                
	                                

									<div class="join_button_wrap">
										<input type="submit" class="mt-4 custom-btn custom-border-btn" value="가입하기"/>
									</div>	  
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </main>


<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>


function memberJoin_click(){
	alert("회원가입이 완료되었습니다! 다시 로그인해주세요.")
}



var code = "";

var idCheck = false;
var idckCheck = false;
var pwCheck = false;
var pwckCheck = false;
var pwckcorCheck = false;
var nameCheck = false;
var mailCheck = false;
var mailnumCheck = false;
var addressCheck = false;

$(document).ready(function(){
	//회원가입 버튼(회원가입 기능 작동)
	$(".join_button").click(function(){
		
        /* 입력값 변수 */
        var id = $('.id_input').val();                 // id 입력란
        var pw = $('.pw_input').val();                // 비밀번호 입력란
        var pwck = $('.pwck_input').val();            // 비밀번호 확인 입력란
        var name = $('.user_input').val();            // 이름 입력란
        var mail = $('.mail_input').val();            // 이메일 입력란
        var addr = $('.address_input_3').val();        // 주소 입력란
        
        /* 아이디 유효성검사 */
        if(id == ""){
            $('.final_id_ck').css('display', 'block');
            idCheck = false;
        }else{
            $('.final_id_ck').css('display', 'none');
            idCheck = true;
        }
               
        /* 비밀번호 유효성 검사 */
        if(pw == ""){
            $('.final_pw_ck').css('display','block');
            pwCheck = false;
        }else{
            $('.final_pw_ck').css('display', 'none');
            pwCheck = true;
        }
 
        /* 비밀번호 확인 유효성 검사 */
        if(pwck == ""){
            $('.final_pwck_ck').css('display','block');
            pwckCheck = false;
        }else{
            $('.final_pwck_ck').css('display', 'none');
            pwckCheck = true;
        }

        
        /* 이름 유효성 검사 */
        if(name == ""){
            $('.final_name_ck').css('display','block');
            nameCheck = false;
        }else{
            $('.final_name_ck').css('display', 'none');
            nameCheck = true;
        }
 
        
        /* 이메일 유효성 검사 */
        if(mail == ""){
            $('.final_mail_ck').css('display','block');
            mailCheck = false;
        }else{
            $('.final_mail_ck').css('display', 'none');
            mailCheck = true;
        }
        
        /* 주소 유효성 검사 */
        if(addr == ""){
            $('.final_addr_ck').css('display','block');
            addressCheck = false;
        }else{
            $('.final_addr_ck').css('display', 'none');
            addressCheck = true;
        }
 
 		
        console.log(idCheck);
        console.log(idckCheck);
        console.log(pwCheck);
        console.log(pwckCheck);
        console.log(pwckcorCheck);
        console.log(nameCheck);
        console.log(mailCheck);
        console.log(mailnumCheck);
        console.log(addressCheck);
    	
    	
        /* 최종 유효성 검사 */
        if(idCheck && idckCheck && pwCheck && pwckCheck && pwckcorCheck &&
        		nameCheck && mailCheck && mailnumCheck && addressCheck ){
        	
    		$("#join_form").attr("action", "/member/join");
    		$("#join_form").submit();
        }   
        
        return false;
        
	});
});

// 아이디 중복 검사
$('.id_input').on("propertychange change keyup paste input", function(){
	var memberId = $('.id_input').val();	// .id_input에 입력되는 값
	var data = {memberId : memberId}  		// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
	
	$.ajax({
		type : "post",
		url : "/member/memberIdChk",
		data : data,
		success : function(result){
			// console.log("성공 여부" + result);
			if(result != 'fail'){
				$("#id_feedback").html('사용할 수 있는 아이디입니다.');
				$("#id_feedback").attr('color','#2fb380');
				idckCheck = true;
			} else {
				$("#id_feedback").html('이미 사용중인 아이디입니다.');
				$("#id_feedback").attr('color','#dc3545');		
				idckCheck = false;
			}	
		}, // success 종료
		error : function(){
			alert("서버 요청 실패");
		}
	}) // ajax 종료
})


/* 비밀번호 확인 일치 유효성 검사 */
$('.pwck_input').on("propertychange change keyup paste input", function(){
 
    var pw = $('.pw_input').val();
    var pwck = $('.pwck_input').val();
    $('.final_pwck_ck').css('display', 'none');
    
    if(pw == pwck){
        $("#pwck_feedback").html('비밀번호가 일치합니다.');
        $('#pwck_feedback').attr('color','green');
        pwckcorCheck = true;
    }else{
        $('#pwck_feedback').html('비밀번호가 일치하지 않습니다.');
        $('#pwck_feedback').attr('color','red');
        pwckcorCheck = false;
    }   
});   


// 입력 이메일 형식 유효성 검사
function mailFormCheck(email) {
	var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	return form.test(email);
}


/* 인증번호 이메일 전송 */
$(".mail_check_button").click(function(){
	var email = $(".mail_input").val();	// 입력한 이메일
	var checkBox = $(".mail_check_input");
	var checkBoxWrap = $(".mail_check_input_box");
	var warnMsg = $(".mail_input_box_warn");	// 이메일 입력 경고글
	
	if(mailFormCheck(email)){
		warnMsg.html("인증번호가 전송되었습니다.");
		warnMsg.css("display", "inline-block");
	} else {
		warnMsg.html("올바르지 못한 이메일 형식입니다.");
		warnMsg.css("display", "inline-block");
	}
	
	$.ajax({
		type : "GET",
		url : "mailCheck?email=" + email,
		success : function(data) {
			//console.log("data : " + data);
			checkBox.attr("disabled", false);
			checkBox.focus();
            checkBoxWrap.attr("id", "mail_check_input_box_true");
            code = data;
		},
		error : function(){
			alert("서버 요청 실패");
		}
				
	})
})

/* 인증번호 비교 */
$(".mail_check_input").blur(function(){
    
    var inputCode = $(".mail_check_input").val();        // 사용자 입력 코드    
    var checkResult = $("#mail_check_input_box_warn");   // 비교 결과     

    if(inputCode == code){                         		// 일치할 경우
        checkResult.html("인증번호가 일치합니다.");
        checkResult.attr('color','green');     
        mailnumCheck = true;     // 일치할 경우
    } else {                                            // 일치하지 않을 경우
        checkResult.html("인증번호를 다시 확인해주세요.");
        checkResult.attr('color','red');
        mailnumCheck = false;    // 일치하지 않을 경우
    }  
})

 
</script>
    
	<!-- footer --> <%@include file="../fragments/footer.jsp" %>
	<!-- js --> <%@include file="../fragments/common-js.jsp" %>
	
</body>
</html>