$(document).ready(function(){
	/*-- 공통  ----------------------------------------------*/
    // focus legend
    var $inputItem = $(".js-inputWrapper");
    $inputItem.length && $inputItem.each(function () {
        var $this = $(this),
            $input = $this.find(".formRow--input"),
            placeholderTxt = $input.attr("placeholder"),
            $placeholder;

        $input.after('<span class="placeholder">' + placeholderTxt + "</span>"),
            $input.attr("placeholder", ""),
            $placeholder = $this.find(".placeholder"),

            $input.val().length ? $this.addClass("active") : $this.removeClass("active"),

            $input.on("focusout", function () {
                $input.val().length ? $this.addClass("active") : $this.removeClass("active");
            }).on("focus", function () {
                $this.addClass("active");
            });
    });
	
    // 정규표현식
    function chk(re, val, selector, msg){
        if(!re.test(val)){                
            selector.css("display","block").html('<i class="fa fa-warning"></i>  ' + msg);
            return false;
        }
        return true;
    }

    // 유효성검사 에러메시지 
    function displayErrorMsg(selector, msg){
        selector.css("display","block").html('<i class="fa fa-warning"></i>  ' + msg);
    }
    
    // 비밀번호 Caps Lock
    $(":password").keypress(function(e){
        var keyCode = 0;
        var shirftKey = false;
        keyCode = e.keyCode;
        shiftKey = e.shiftKey;
        if(((keyCode >= 65 && keyCode <90) && !shiftKey) || ((keyCode >= 97 && keyCode <= 112) && shiftKey)){
            displayErrorMsg($('#pwdMsg'), "Caps Lock이 켜져있습니다.")
            displayErrorMsg($('#loginPwdMsg'), "Caps Lock이 켜져있습니다.")
        }else{
            $("#pwdMsg").css("display","none");
            $("#loginPwdMsg").css("display","none");
        }
    })

    // 비밀번호 CapslockMsg 제거 
    $("input[type=password]").focusout(function(){
        $("#pwdMsg").css("display","none");
    })

    // 비밀번호 영문만 입력
    $("input[type=password], input[type=email]").keyup(function(event){ 
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[^a-zA-Z0-9#?!@$%^&*.]/gi,''));
//            displayErrorMsg($('#pwdMsg'), "8~16자 영문 대 소문자, 숫자, 특수문자(#?!@$%^&*)를 사용하세요.");
        }
    });

	
	/*-- Navigation  ----------------------------------------------*/
	$(".signUpView").click(function(){
		location.href="policyView.me"
	});
	
	$(".loginView").click(function(){
		location.href="loginView.me"
	})
	
	$(".logout").click(function(){
		location.href="logout.me";
		history.go();
	})
	
	$(".driverPage").click(function(){
		location.href="driverMain.ydl"
	})
	
	$(".userPage").click(function(){
		location.href="home.do"
	})
	
	$(".adminPage").click(function(){
		location.href="#"
	})
	
	
	
	/*-- 로그인페이지 ----------------------------------------------*/
    // 엔터시 로그인 클릭
	$('#pwd, #mId').keypress(function(event){
        var keycode = (event.keyCode ? event.keyCode : event.which);
        if(keycode == '13'){
        	$(".submitBtn").trigger("click");
        }
    }); 
	
    $("#loginBtn").click(function(){
    	var mId = $("input[type=email]").val();
    	var pwd = $("#pwd").val();
    	if(mId == "" ){
    		displayErrorMsg($("#emailMsg"), '이메일을 입력하세요.');
    	}else{
    		$.ajax({
    			url : "login.me",
    			data : {
    					 mId : mId,
    					 pwd : pwd
    					},
    			type : "post",
    			success : function(result){
    				console.log(result);
    				if(result == 'loginSuccess'){
    					location.href="home.do";
    				}else if(result == 'nonExistentId'){
    					displayErrorMsg($("#emailMsg"), '존재하지 않는 이메일입니다.');
    				}else{
    					displayErrorMsg($("#pwdMsg"), '비밀번호가 틀렸습니다.');
    					$("#emailMsg").css("display","none");
    				}
    			}
    			, error : function(){
	        		var msg = "로그인 중 에러 발생!";
	        		location.href="error.ydl?msg="+msg;

    			}
    		})
    	}
    })
    
    /*-- 약관 ----------------------------------------------*/
    // 동의 체크    
    var checked = '/yongdali/resources/images/login&signUp/checked-circle.png';
    var unchecked = '/yongdali/resources/images/login&signUp/unchecked-circle.png';
    
    $('#chkAll').on("click",function(){
        if($(this).attr('src') == unchecked) {	        	
        	$('.chkPolicy').attr('src',checked).attr('checked',true);
        	$('input[name=pushEnabled]').val('Y') ;
        } else{
        	$('.chkPolicy').attr('src',unchecked).attr('checked',false);	
        	$('input[name=pushEnabled]').val('N');
        }
    });
   
    $('.chkPolicy:eq(1)').click(function(){
        if($(this).attr('src') == unchecked) {
            $(this).attr('src',checked).attr('checked',true);
        } else{
            $(this).attr('src',unchecked).attr('checked',false);
        }
    });

    $('.chkPolicy:eq(2)').click(function(){
        if($(this).attr('src') == unchecked) {
            $(this).attr('src',checked).attr('checked',true);
        } else{
            $(this).attr('src',unchecked).attr('checked',false);
        }
    });

    $('.chkPolicy:eq(3)').click(function(){
        if($(this).attr('src') == unchecked) {
            $(this).attr('src',checked).attr('checked',true);
            $('input[name=pushEnabled]').val('Y') ;
            
        } else{
            $(this).attr('src',unchecked).attr('checked',false);
            $('input[name=pushEnabled]').val('N');
        }
    });
    
    // 약관 모달
    $('#viewYondaliPolicy').click(function(){
        $('#yongdaliPolicy').css("display","block");
    })

    $('#viewPersonalInfoPolicy').click(function(){
        $('#personalInfoPolicy').css("display","block");
    })

    $('.modalClose:eq(0)').click(function(){
        $('#yongdaliPolicy').css("display","none");
    })

    $('.modalClose:eq(1)').click(function(){
        $('#personalInfoPolicy').css("display","none");
    })

    var modal = document.getElementById("carInfo");
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
    
    // 용달이 회원가입 버튼
    $('#yongdaliSignUp').click(function(){
    	$('#pushEnabledForm').attr('action','signUpView.me');
    	if($('.chkPolicy:eq(1)').attr('checked') == "checked" && $('.chkPolicy:eq(2)').attr('checked') == "checked"){
    		$('#pushEnabledForm').trigger('submit');
    	}else {
    		alert("필수 약관에 동의해야합니다.")
    	}
    })
    

    /*-- 회원가입 ----------------------------------------------*/
    /*-- 유효성 검사 이벤트 선언 -------------------*/
    // 엔터 클릭 시 submit 막기
    $('form input').keydown(function(e) {
        if (e.keyCode == 13) {
            return false;
        }
    });
    
    // 이메일 체크(중복 및 유효성 검사)
    $("#email").focusout(function(){
    	if(emailValidate() == true){
    		emailDupChk();
    	}
    })
    
    // '인증번호 받기' 클릭시 TODO
    $('#btn_sendVeriCode').click(function(){
    	let emailVal = $("#email").val();  
    	
    	if(!chk(/^[\a-z0-9_-]{5,20}@[\a-zA-Z]+(\.[\a-zA-Z]+){1,2}$/, emailVal, $("#emailMsg"), "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.")){
//            return false;
            
    	} else{
    		$.ajax({
    			url : "emailVerify.me",
    			type : "get",
    			data : {email : emailVal},
    			success : function(result){
    				alert("입력하신 이메일로 인증번호를 전송하였습니다.")
    		    	$(this).hide();
    		    	$('.verifyBtn:eq(1), .verifyBtn:eq(2)').show();
    				
    			}, 
    			error : function(){
            		var msg = "이메일 인증 절차 진행 중 오류 발생";
                	location.href="error.ydl?msg="+msg;
            	}
    		})
    		
    		

    	}
    	
    	

    })
    
    // 인증번호 '재전송' 
    $('#btn_resend').click(function(){
    	alert("입력하신 이메일로 인증번호를 재전송하였습니다.")
    })
    
    // 인증번호 '확인' 
    $('#btn_verify').click(function(){
    	
    })
    
    // 비밀번호 입력 시 유효성 검사
    $('#signUpPwd').focusout(function(){
    	pwdValidate();
    })
    
    $('#signUpPwdChk').focusout(function(){
    	pwdChkValidate();
    })
    
    $('input[name=name]').focusout(function(){
    	nameValidate();
    })
    
    $('input[name=phone]').focusout(function(){
    	phoneValidate();
    })
    
    // '가입하기' 버튼 클릭 시 '전체 유효성 검사' 후 submit
    $('#signUpBtn').click(function(){
    	// 기본 정보 에러메시지 노출용
    	if(emailValidate() == true){
    		emailDupChk();
    	};
    	
    	if(pwdValidate() == true){
    		pwdChkValidate();
    	};
    	
    	nameValidate();
    	phoneValidate();
    	
    	if($('input[name=mSort]').val() == '일반'){
        	// 기본 정보 전체 유효성 검사 후 제출용
        	if(emailValidate() == true && emailDupChk() == true 
        		&& pwdValidate() == true && pwdChkValidate() == true 
        		&& nameValidate() == true && phoneValidate() == true){
        		$('#sigInForm').trigger('submit');
        	};
    	}else{
        	// 사업자 정보 에러메시지 노출용
    		carInfoValidate();
    		
    		
    		// 사업자 정보 포함 전체 유효성 검사 후 제출용
        	if(emailValidate() == true && emailDupChk() == true 
        		&& pwdValidate() == true && pwdChkValidate() == true 
        		&& nameValidate() == true && phoneValidate() == true
        		&& bizFormValidate() == true){
        		$('#sigInForm').trigger('submit');
        	};
    	}

    });
    
    /*-- 함수 선언 -------------------*/
    // 이메일 유효성 검사
    function emailValidate(){ 
        let emailVal = $("#email").val();  
        // 이메일 미입력
        if (emailVal == "" ){
            displayErrorMsg($("#emailMsg"), '이메일을 입력하세요.');
             return false;
        }
        // 이메일 정규표현식
        else if(!chk(/^[\a-z0-9_-]{5,20}@[\a-zA-Z]+(\.[\a-zA-Z]+){1,2}$/, emailVal, $("#emailMsg"), "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.")){
             return false;
        } 
        else{
            $("#emailMsg").css("display","none");
            return true;
        }
    }
    
    // 이메일 중복 검사
    function emailDupChk(){
    	$.ajax({
        	url : "emailDup.me",
        	type : "get",
        	data : { mId : $('#email').val() },
        	success : function(result){
        		if(result == "exist" ){
        			displayErrorMsg($("#emailMsg"), '이미 사용중이거나 탈퇴한 아이디입니다.');
        			return false;
        		}else{
        			$("#emailMsg").css("display","none");
        			return true;
        		}
        	}
        	, error : function(){
        		var msg = "이메일 중복검사중 에러 발생";
        		location.href="error.ydl?msg="+msg;
        	}
        })
    }
    
    // TODO 인증번호 유효성 검사
    function verifyValidate(){
        let veriNo = $("input[name=verify]").val();  

        // 인증번호 미입력
        if(veriNo == ""){
            displayErrorMsg($('#veriMsg'), "인증번호를 입력하세요.")
            return false
        }else{
            $("#veriMsg").css("display","none");
        }

        // TODO 인증번호 확인
        // else if{
        	
        // }
        // return true;
    }    
    
    // 비밀번호 유효성 검사
    function pwdValidate(){
        let pwdVal = $("#signUpPwd").val();
        
        // 비밀번호 미입력
        if(pwdVal == ""){
            displayErrorMsg($('#pwdMsg'), "비밀번호를 입력하세요.")
             return false;
        }

        // 비밀번호 정규표현식 
        else if(!chk(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*]).{8,16}$/, pwdVal, $("#pwdMsg"), "8~16자 영문 대 소문자, 숫자, 특수문자(#?!@$%^&*)를 사용하세요.")){
            // (?=            -->  positive lookahed(전방 탐색) : Matches a group after 'the main expression' without including it in the result
            // .*?            -->  non-greedy : will search for a match using as few characters as possible
            // (?=.*?[A-Z])   -->  A-Z 중 하나 이상
            // .              -->  wildcard : Matches any character cept line breaks
            // {8,20}         -->  8자 이상 20자 이하
        	return false;
        } else{
            $("#pwdMsg").css("display","none");
            return true;
        }   
    }
    
    // 비밀번호 확인 유효성 검사
    function pwdChkValidate(){
    	let pwdVal = $("#signUpPwd").val();
    	let pwdChkVal = $("#signUpPwdChk").val();
    	
        // 비밀번호 확인 미입력
        if(pwdChkVal == ""){
            displayErrorMsg($('#pwdMsg'), "비밀번호를 확인하세요.")
             return false;
        }
        // 비밀번호 불일치 
        else if(pwdVal != pwdChkVal){
            displayErrorMsg($('#pwdMsg'), "비밀번호가 일치하지 않습니다.")
             return false;
        }        
        // 비밀번호 정규표현식 
        else if(!chk(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*]).{8,16}$/, pwdChkVal, $("#pwdMsg"), "8~16자 영문 대 소문자, 숫자, 특수문자(#?!@$%^&*)를 사용하세요.")){
        	return false;
        }else{
            $("#pwdMsg").css("display","none");
            return true;
        }
    }
    
    // 이름 유효성 검사
    function nameValidate(){
        // 이름 미입력
        if($('input[name=name]').val() == ""){
            displayErrorMsg($('#nameMsg'), "이름을 입력하세요.(한글 두자 이상)");
            return false;
        }
        // 이름 정규표현식
        else if(!chk(/[가-힣]{2,}/, $('input[name=name]').val(), $('#nameMsg'), "한글 두자 이상 입력하세요.")){
        	return false;
        }else{
            $('#nameMsg').css('display','none');
            return true;
        }
    }

    //  휴대폰번호 유효성 검사
    function phoneValidate(){
        // 폰번호 미입력
        if($('input[name=phone]').val() == ""){
            displayErrorMsg($('#phoneMsg'), "휴대폰 번호를 입력하세요.")
            return false;
        }
        else if($('input[name=phone]').val().length < 12){
            displayErrorMsg($('#phoneMsg'), "휴대폰 번호를 확인하세요.")
            return false;
        }
        
        else{
            $('#phoneMsg').css('display','none');
            return true;
        }
    }
    
    /*-- 기타 기능 이벤트 선언 -------------------*/
    // 비밀번호 보기
    $('.pwdWrap i').on('click',function(){
        $('.pwdWrap input').toggleClass('showPwd');
        if($('.pwdWrap input').hasClass('showPwd')){
            $(this).attr('class',"far fa-eye");
            $('.pwdWrap input').attr('type','text');
        }else{
            $(this).attr('class',"far fa-eye-slash");
            $('.pwdWrap input').attr('type','password');
        }
    });

    // 이름 한글만 입력
    $("input[name=name]").keyup(function(event){ 
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[^ㄱ-힣]/gi,''));                
        } 
    });

    // 폰번호 숫자만 입력 & 하이픈(-)기호 자동 삽입
    $("input[name=phone]").keyup(function(event){ 
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[^0-9]/gi,''));                
        } 
        
        var number = $("input[name=phone]").val();
        var phone = "";
        if($("input[name=phone]").val().length < 4){
            return number;
        } 
        else if($("input[name=phone]").val().length < 7){
            phone += number.substr(0, 3);
            phone += "-";
            phone += number.substr(3);
        } 
        else if($("input[name=phone]").val().length < 7){
            phone += number.substr(0, 3);
            phone += "-";
            phone += number.substr(3, 3);
            phone += "-";
            phone += number.substr(7);
        }      
        else{
            phone += number.substr(0, 3);
            phone += "-";
            phone += number.substr(3, 4);
            phone += "-";
            phone += number.substr(7);
        }
        $("input[name=phone]").val(phone);
    });   

    /*-- 사업자 ----------------------------------------------*/
    // 사업자 또는 일반회원으로 가입하기
    $('#slecBiz').click(function(){
        if($('#slecBiz img').attr('alt') == '더하기'){
            $('#slecBiz img').attr('src', 'resources/images/login&signUp/round-substract.svg').attr('alt','빼기');            
            $('#slecBiz div').text('일반회원으로 가입하기');
            $('.bizForm').show();
            $('input[name=mSort]').val('사업자');
        }else{
            $('#slecBiz img').attr('src', 'resources/images/login&signUp/round-add.svg').attr('alt','더하기');
            $('#slecBiz div').text('사업자(기사)로 가입하기');
            $('.bizForm').hide();
            $('#bizFormMsg1').css("display","none");
            $('input[name=mSort]').val('일반');
        }
    });

    // 차량번호 한글, 숫자만 입력
    $("input[name=carNo]").keyup(function(event){ 
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[^ㄱ-힣0-9]/gi,''));                
        } 
    });

    // 차량정보 모달
    $('.guide').click(function(){
        $('#carInfo').css("display","block");
    })
    
    $('.modalClose:eq(0)').click(function(){
        $('#carInfo').css("display","none");
    })

    // 차량 형태 및 적재 크기 선택
    $('.dpmSTb').click(function(){
        $(this).css('background-color','white');
        $('.cCvWPY').css('background-color','rgb(236, 240, 242)');
 
        $('.fGXWzu').css('display','none');
        $('.ezDdUH').css({'display':'flex'});
    })

    $('.cCvWPY').click(function(){
        $(this).css('background-color','white');
        $('.dpmSTb').css('background-color','rgb(236, 240, 242)');
        $('.ezDdUH').css('display','none');
        $('.fGXWzu').css('display','block');
    })
    
    // 사업자 정보 유효성 검사
    function carInfoValidate(){
        // 톤수 미입력
        if($('select[name=carCapcity]').val() == ""){
            displayErrorMsg($('#bizFormMsg1'), "톤수를 선택하세요.");
            return false;
        }
        // 차종 미입력
        else if($('select[name=carType]').val() == ""){
            displayErrorMsg($('#bizFormMsg1'), "차종을 선택하세요.");
            return false;
        }
        // 차량번호 미입력
        else if($('input[name=carNo]').val() == ""){
            displayErrorMsg($('#bizFormMsg1'), "차량번호를 입력하세요.");
            return false;
        }
        // 차량번호 정규표현식
        else if(!chk(/[가-힣0-9]{7,}/, $('input[name=carNo]').val(), $('#bizFormMsg1'), "차량번호를 정확히 입력하세요.")){
        	return false;
        }
        else{
            $('#bizFormMsg1').css('display','none');
            return true;
        }
    }
    
    
    function bizImgValidate(){
    	
    }
});







