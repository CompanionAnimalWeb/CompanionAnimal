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
                        <form class="custom-form donate-form" action="successMemberJoin" method="post" role="form">
                            <h3 class="mb-4">JOIN US</h3>

                            <div class="row">
                                <div class="col-lg-12 col-12">
	                                <div class="id_wrap">
	                                	<h5 class="mb-1">아이디</h5>
	                                	<div class="id_input_box id_name">
	                                		<input type="name" class="form-control id_input" name="memberId">
	                                	</div>
	                                	<div>
	                                		<font id="id_feedback" size="2"></font>
	                                	</div>
	                                	<span class="final_id_ck">아이디를 입력해주세요.</span>
                                	</div>
                                	
                                	<br>
                                	
  	                                <div class="pw_wrap">
	                                	<h5 class="mb-1">비밀번호</h5>
	                                	<div class="pw_input_box pw_name">
	                                		<input type="password" class="form-control pw_input" name="memberPw">
	                                	</div>
	                                	<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
	                                </div>
	                                
	                                <br>
	                                
 	                                <div class="pwck_wrap">
	                                	<h5 class="mb-1">비밀번호 확인</h5>
	                                	<div class="pwck_input_box pwck_name">
	                                		<input type="password" class="form-control pwck_input" name="memberPw">
	                                	</div>
	                                	<span class="final_pwck_ck">비밀번호 확인란을 입력해주세요.</span>
	                                	<div>
	                                		<font id="pwck_feedback" size="2"></font>
	                                	</div>
	                                </div>
	                                
	                                <br>
	                                
	                                <div class="user_wrap">
	                                	<h5 class="mb-1">이름</h5>
	                                	<div class="user_input_box user_name">
	                                		<input type="name" class="form-control user_input" name="memberName">
	                                	</div>
	                                	<span class="final_name_ck">이름을 입력해주세요.</span>
	                                </div>
	                                
	                                <br>
	                                
	                                <div class="mail_wrap">
	                                	<h5 class="mb-1">이메일</h5>
	                                	<div class="mails_input_box mail_name">
	                                		<input type="name" class="form-control mail_input" name="memberMail">
	                                	</div>

										<span class="final_mail_ck">이메일을 입력해주세요.</span>
										<br><br>
										<span class="mail_input_box_warn"></span>
										<div class="mail_check_wrap">
											<div class="mail_check_input_box" id="mail_check_input_box_false">
												<input class="form-control mail_check_input" disabled="disabled">
											</div>
											<div class="mail_check_button">
										
											<div class="mail_check_button">
												<a role="button" class="btn btn-outline-dark btn-sm me-md-3">인증번호 전송</a>
											</div>
											
											<div class="clearfix"></div>
											<div>
												<font id="mail_check_input_box_warn" size="2"></font>
											</div>
										</div>
	                                	
	                                </div>
	                                
	                                <br>
	                                
	                                
	                                <div class="address_wrap">
	                                	<h5 class="mb-1">주소</h5>
	                                	<div class="address_input_1_wrap">
	                                		<div class="address_input_1_box address_name">
	                                		<input class="form-control address_input_1" name="memberAddr1" readonly="readonly" placeholder="하단의 주소 찾기를 이용해주세요.">
	                                	</div>
										<div class="address_button" onclick="execution_daum_address()">
											<a role="button" class="btn btn-outline-dark btn-sm me-md-3">주소 찾기</a>
										</div>
										<br>
										<div class="clearfix"></div>
										<div class ="address_input_2_wrap">
											<div class="address_input_2_box">
												<input class="form-control address_input_2" name="memberAddr2" readonly="readonly">
											</div>
										</div>
										<br>
										<div class ="address_input_3_wrap">
											<div class="address_input_3_box">
												<input class="form-control address_input_3" name="memberAddr3" readonly="readonly" placeholder="상세 주소를 입력해주세요.">
											</div>
										</div>
	                                </div>

									<div class="join_button_wrap">
										<button type="submit" class="form-control mt-4">가입하기</button>
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


// 다음 주소 연동
function execution_daum_address(){
 
    new daum.Postcode({
        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
    	oncomplete: function(data) {
        	 
        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
          		// 주소변수 문자열과 참고항목 문자열 합치기
                addr += extraAddr;
            
            } else {
            	addr += ' ';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $(".address_input_1").val(data.zonecode);
            //$("[name=memberAddr1]").val(data.zonecode);    // 대체가능
            $(".address_input_2").val(addr);
            //$("[name=memberAddr2]").val(addr);            // 대체가능
            
            // 커서를 상세주소 필드로 이동한다.
            // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
            $(".address_input_3").attr("readonly", false);
            $(".address_input_3").focus();
 
        }
    }).open();    
 
}
 
</script>
    
	<!-- footer --> <%@include file="../fragments/footer.jsp" %>
	<!-- js --> <%@include file="../fragments/common-js.jsp" %>
	
</body>
</html>