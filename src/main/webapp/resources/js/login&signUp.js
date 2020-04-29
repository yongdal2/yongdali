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
	});
	
//	$(".logout").click(function(){
//		location.href="logout1.me";
//		history.go();
//	});
	
	$(".driverPage").click(function(){
		location.href="driverMain.ydl"
	});
	
	$(".userPage").click(function(){
		location.href="home.do"
	});
	
	$(".adminPage").click(function(){
		location.href="adminHome.ydl"
	});
	
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
    // 간편로그인 여부 판단
    
    
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
    
    // 용달이 시작하기(간편로그인 회원 약관동의)
    $('#easyEcsAgree').click(function(){
    	$('#pushEnabledForm').attr('action','setPushEnabled.me');
    	if($('.chkPolicy:eq(1)').attr('checked') == "checked" && $('.chkPolicy:eq(2)').attr('checked') == "checked"){
    		$('#pushEnabledForm').trigger('submit');
    	}else {
    		alert("필수 약관에 동의해야합니다.")
    	}
    })
    
    // 용달이 회원가입 버튼
    $('#yongdaliSignUp').click(function(){
    	$('#pushEnabledForm').attr('action','signUpView.me');
    	if($('.chkPolicy:eq(1)').attr('checked') == "checked" && $('.chkPolicy:eq(2)').attr('checked') == "checked"){
    		$('#pushEnabledForm').trigger('submit');
    	}else {
    		alert("필수 약관에 동의해야합니다.")
    	}
    })
    
    /* 페이스북(FB) 아이디로 회원가입 */
    // 페이스북 회원가입 버튼
    $('#fbSignUp').click(function(){
    	$('#pushEnabledForm').attr('action','signUpView.me');
    	if($('.chkPolicy:eq(1)').attr('checked') == "checked" && $('.chkPolicy:eq(2)').attr('checked') == "checked"){
//    		$('#pushEnabledForm').trigger('submit');
    		fbSignUp();
    	}else {
    		alert("필수 약관에 동의해야합니다.")
    	}
    })
    
	
	// 2. SDK 로드 후 초기화(함수 실행)
	window.fbAsyncInit = function() {
	  FB.init({
	    appId      : '2281323032164175',
	    cookie     : true, 	
	    xfbml      : true,
	    version    : 'v6.0'
	  });
	  	// 3. 페이스북 로그인
		fbSignUp = function(){
			FB.login(function(res){
				console.log("login : ", res);
				
				// 4. 로그인(커넥션) 상태 확인
				if(res.status === 'connected'){
					console.log("connected");
					
					// 5. 회원정보 호출 API
					FB.api('/me',{fields: 'email,name'} ,function(resp){
						let pushEnabled = $('input[name=pushEnabled]').val();
					    let email = resp.email;
					    let name = resp.name;
					    
					    let servletUrl = "signUpView.me?pushEnabled=" + pushEnabled;
					    servletUrl += "&email=" + email;
					    servletUrl += "&name=" + name;
					    servletUrl += "&signupType=페이스북";
					    
					    console.log(servletUrl);
					   	
					   	$.ajax({
					   		url : "fbSignUpAjax.me",
					   		type : "post",
					   		data : { email : email, name : name},
					   		success : function(value){
					   			console.log(value);
					   			if(value == 'facebook'){
					   				alert("페이스북 간편 가입 회원입니다. 페이스북으로 로그인하세요.");
					   			}
					   			else if(value == 'naver'){
					   				alert("네이버 간편 가입 회원입니다. 네이버로 로그인하세요.");
					   			}
					   			else if(value =='kakao'){
					   				alert("카카오 간편 가입 회원입니다. 카카오로 로그인하세요.");
					   			}
					   			else if(value =='yongdali'){
					   				alert("용달이 회원입니다. 용달이로 로그인하세요.");
					   			}else{
					   				location.href=servletUrl;
					   			}
					   		}, error : function(){
					       		var msg = "페이스북 간편 회원가입 중 에러 발생!";
					       		location.href="error.ydl?msg="+msg;
					   		}
					   	})
					});
				}
			},{scope:'email'});
		}
	};
	// 1. 비동기화방식으로 SDK 불러오기
	(function(d, s, id){		
	   var js, fjs = d.getElementsByTagName(s)[0];
	   if (d.getElementById(id)) {return;}
	   js = d.createElement(s); js.id = id;
	   js.src = "https://connect.facebook.net/en_US/sdk.js";
	   fjs.parentNode.insertBefore(js, fjs);
	 }(document, 'script', 'facebook-jssdk'));
	/* /페이스북(FB) 아이디로 회원가입 */
           
    /* 카카오 아이디로 회원가입 */
    // 카카오 회원가입 버튼
    $('#kakaoSignUp').click(function(){
    	$('#pushEnabledForm').attr('action','signUpView.me');
    	if($('.chkPolicy:eq(1)').attr('checked') == "checked" && $('.chkPolicy:eq(2)').attr('checked') == "checked"){
    		kakaoSignUp();
    	}else {
    		alert("필수 약관에 동의해야합니다.")
    	}
    })
    
    kakaoSignUp = function(){
    	// 1. SDK 초기화
        Kakao.init('c2902431456434e92f377bfc927e6e09');
    	
    	// 2. 카카오 로그인
        Kakao.Auth.login({ 
            success: function() { 
                  // 3. 사용자 정보 추출 (사용자 API)
                  Kakao.API.request({ 
                	    /* scope: 'email', */
                        url: '/v2/user/me', 
                        success: function(res) {  
    						  console.log("회원정보 호출 API");
    						  
    						  let pushEnabled = $('input[name=pushEnabled]').val();
                              let email = res.kakao_account.email;
                              let name = res.properties.nickname;
                              
                              let servletUrl = "signUpView.me?pushEnabled=" + pushEnabled;
	      					  servletUrl += "&email=" + email;
	      					  servletUrl += "&name=" + name;
	      					  servletUrl += "&signupType=카카오";
	      					   
	      					  console.log(servletUrl);
                            	  
                              $.ajax({
  						   		url : "kakaoSignUpAjax.me",
  						   		type : "post",
  						   		data : { email : email, name : name},
  						   		success : function(value){
  						   			console.log(value);
  						   			if(value == 'facebook'){
  						   				alert("페이스북 간편 가입 회원입니다. 페이스북으로 로그인하세요.");
  						   			}
  						   			else if(value == 'naver'){
  						   				alert("네이버 간편 가입 회원입니다. 네이버로 로그인하세요.");
  						   			}
  						   			else if(value =='kakao'){
  						   				alert("카카오 간편 가입 회원입니다. 카카오로 로그인하세요.");
  						   			}
  						   			else if(value =='yongdali'){
  						   				alert("용달이 회원입니다. 용달이로 로그인하세요.");
  						   			}else{
//  						   				location.href="signUpView.me?pushEnabled=" + $('input[name=pushEnabled]').val();
  						   				location.href=servletUrl;
  						   			}
  						   		}, error : function(){
  					        		var msg = "페이스북 간편 로그 중 에러 발생!";
  					        		location.href="error.ydl?msg="+msg;
  						   		}
  						   	})
                       }, 
                       fail: function(error) { 
                             console.log(JSON.stringify(error)); 
                       } 
                   }); 
          }, 
          fail: function(err) { 
                console.log(JSON.stringify(err)); 
          } 
        });
    }
    
    /* 네이버 아이디로 회원가입 */
    // 네이버 회원가입 버튼 TODO
    $('#naverSignUp').click(function(){
    	$('#pushEnabledForm').attr('action','easySignUpView.me');
    	if($('.chkPolicy:eq(1)').attr('checked') == "checked" && $('.chkPolicy:eq(2)').attr('checked') == "checked"){
    		let apiURL = $('#apiURL').val();
    		console.log(apiURL);
    		
    		// 1. 이렇게 호출할 경우 이상없이 호출됨
//    		location.href=apiURL;
    		
    		// 2. ajax에서 url 호출할 경우 cross-origin 에러 발생했었으나 servelet에 @CrossOrigin 어노테이션 사용으로 오류제거함
    		// 3. 오류는 뜨지 않으나 여전히 url이 호출되지 않음(logger 안뜸)
    		$.ajax({
    			url : $('#apiURL').val(),
    			type : "get",
    			dataType: 'jsonp',
    			jsonpCallback: "myCallback",
    			success: callBack('myCallback'),
    			error : function(request,status,error){
    				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    				var msg = "네이버 간편 회원가입 중 오류 발생";
    				location.href="error.ydl?msg="+msg;
    			}
    		});
//    			async:false,
    			function callBack(value){
		   			console.log(value);
		   			if(value == 'facebook'){
		   				alert("페이스북 간편 가입 회원입니다. 페이스북으로 로그인하세요.");
		   			}
		   			else if(value == 'naver'){
		   				alert("네이버 간편 가입 회원입니다. 네이버로 로그인하세요.");
		   			}
		   			else if(value =='kakao'){
		   				alert("카카오 간편 가입 회원입니다. 카카오로 로그인하세요.");
		   			}
		   			else if(value =='yongdali'){
		   				alert("용달이 회원입니다. 용달이로 로그인하세요.");
		   			}
		   			else if(value =='unknown'){
		   				alert("unknown");
		   			}
		   			else{
						let pushEnabled = $('input[name=pushEnabled]').val();
	                    let email = "test@naver.com"
	                    let name = "tester"
	                     
	                    let servletUrl = "signUpView.me?pushEnabled=" + pushEnabled;
	                    servletUrl += "&email=" + email;
	                    servletUrl += "&name=" + name;
	                    servletUrl += "&signupType=네이버";
	  					  
	  					location.href=servletUrl;
		   			}
    			};
    		
    	}else {
    		alert("필수 약관에 동의해야합니다.")
    	}
    });

        
    /*-- 비밀번호 찾기 ----------------------------------------------*/
    // 이메일 체크(중복 및 유효성 검사)
    $("#findPwd_email").focusout(function(){
    	if(findPwd_emailValidate() == true){
    		findPwd_emailChk();
    	}
    })
    
    // 비밀번호 찾기_인증번호 전송 & 재전송
    $('#btn_findPwd_VeriCode, #btn_findPwd_resend').click(function(){
    	let emailVal = $("#findPwd_email").val();  
    	
    	if(findPwd_emailValidate() == true){
    		if(findPwd_emailChk() == true){
    			$.ajax({
        			url : "findPwdVeriCode.me",
        			type : "post",
        			data : {email : emailVal},
        			success : function(ranNum){
        				console.log(ranNum);
        				console.log('Raejin0!234');
        				alert("입력하신 이메일로 인증번호를 전송하였습니다.")
        		    	$('#btn_findPwd_VeriCode').hide();
        		    	$('#btn_findPwd_verify, #btn_findPwd_resend').show();
        		    	
        		        // 인증번호 '확인' 
        		        $('#btn_findPwd_verify').click(function(){
        		        	let inputVeriCode = $('input[name=inputVeriCode]').val();
        		        	
        		        	if(ranNum == inputVeriCode){
        		        		$('input[name=isVerified]').val('Y');
        		    			$('#verifyWrap, #veriMsg').hide();
        		    			$('.successMsgBox').show();
        		        	}else{
        		        		displayErrorMsg($("#veriMsg"), '인증번호를 확인하세요.');
        		        	}	
        		        })
        			}, 
        			error : function(){
                		var msg = "인증번호 전송 중 오류 발생";
                    	location.href="error.ydl?msg="+msg;
                	}
        		});
    		}
    	} 
    })
    
    // '비밀번호 찾기' 버튼 클릭 시 '전체 유효성 검사' 후 submit
    $('#btn_submit_findPwdForm').click(function(){
    	// 기본 정보 에러메시지 노출용
    	if(findPwd_emailValidate() == true){
    		findPwd_emailChk();
    	};
    	
    	if($('input[name=isVerified]').val() == 'N'){
    		displayErrorMsg($("#veriMsg"), '이메일을 인증하세요.');
    	}
    	
    	if(pwdValidate() == true){
    		pwdChkValidate();
    	};
    	
    	if(findPwd_emailValidate() == true && findPwd_emailChk() == true && $('input[name=isVerified]').val() == 'Y'
    		&& pwdValidate() == true && pwdChkValidate() == true){
    		$('#findPwdForm').trigger('submit');
    		alert("비밀번호를 재설정합니다.");
    	};
    });
    
    // 비밀번호 찾기_이메일 존재 유무 및 가입타입 확인
    function findPwd_emailChk(){
    	var result = false;
    	$.ajax({
    		url : "findPwd_emailChk.me",
        	type : "get",
        	data : { mId : $('#findPwd_email').val() },
        	async : false,
        	success : function(value){
        		if(value == "exist" ){
        			$("#emailMsg").css("display","none");
        			result = true; 
        		}else if(value == "naver"){
        			displayErrorMsg($("#emailMsg"), "간편 가입 회원입니다. 네이버로 로그인하세요.");
        			result = false; 
        		}else if(value == "facebook"){
        			displayErrorMsg($("#emailMsg"), "간편 가입 회원입니다. 페이스북으로 로그인하세요.");
        			result = false; 
        		}else if(value == "kakao"){
        			displayErrorMsg($("#emailMsg"), "간편 가입 회원입니다. 카카오로 로그인하세요.");
        			result = false; 
        		}else{
        			displayErrorMsg($("#emailMsg"), '등록되지 않은 아이디입니다.');
        			result = false; 
        		}
        	}
        	, error : function(){
        		var msg = "비밀번호 찾기 이메일 존재 유무 및 가입타입 확인 중 에러 발생";
        		location.href="error.ydl?msg="+msg;
        	}
        })
    	return result;
    }
    
    // 비밀번호 찾기_비밀번호 유효성 검사
    function findPwd_emailValidate(){ 
        let emailVal = $("#findPwd_email").val();  
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
    
    // 인증번호 전송 & 재전송
    $('#btn_sendVeriCode, #btn_resend').click(function(){
    	let emailVal = $("#email").val();  
    	
    	if(emailValidate() == true){
    		if(emailDupChk() == true){
    			$.ajax({
        			url : "sendVeriCode.me",
        			type : "post",
        			data : {email : emailVal},
        			success : function(ranNum){
        				console.log(ranNum);
        				console.log('Raejin0!234');
        				alert("입력하신 이메일로 인증번호를 전송하였습니다.")
        		    	$('#btn_sendVeriCode').hide();
        		    	$('#btn_verify, #btn_resend').show();
        		    	
        		        // 인증번호 '확인' 
        		        $('#btn_verify').click(function(){
        		        	let inputVeriCode = $('input[name=inputVeriCode]').val();
        		        	
        		        	if(ranNum == inputVeriCode){
        		        		$('input[name=isVerified]').val('Y');
        		    			$('#verifyWrap, #veriMsg').hide();
        		    			$('.successMsgBox').show();
        		        	}else{
        		        		displayErrorMsg($("#veriMsg"), '인증번호를 확인하세요.');
        		        	}	
        		        })
        			}, 
        			error : function(){
                		var msg = "인증번호 전송 중 오류 발생";
                    	location.href="error.ydl?msg="+msg;
                	}
        		});
    		}
    	} 
    })
    
    // 비밀번호 입력 시 유효성 검사
    $('#signUpPwd').focusout(function(){
    	pwdValidate();
    })
    
    // 비밀번호 확인 시 유효성 검사
    $('#signUpPwdChk').focusout(function(){
    	pwdChkValidate();
    })
    
    // 이름 유효성검사
    $('input[name=mName]').focusout(function(){
    	nameValidate();
    })

    // 휴대폰 번호 유효성검사
    $('input[name=phone]').focusout(function(){
    	phoneValidate();
    })
    
//    // '가입하기' 버튼 클릭 시 '전체 유효성 검사' 후 submit
//    $('#btn_submit_signUpForm').click(function(){
//    	// 기본 정보 에러메시지 노출용
//    	if(emailValidate() == true){
//    		emailDupChk();
//    	};
//    	
//    	if(pwdValidate() == true){
//    		pwdChkValidate();
//    	};
//    	
//    	if($('input[name=isVerified]').val() == 'N'){
//    		displayErrorMsg($("#veriMsg"), '이메일을 인증하세요.');
//    	}
//    	
//    	nameValidate();
//    	phoneValidate();
//    	
//    	if($('input[name=mSort]').val() == '일반'){
//        	// 기본 정보 전체 유효성 검사 후 제출용
//        	if(emailValidate() == true && emailDupChk() == true && $('input[name=isVerified]').val() == 'Y'
//        		&& pwdValidate() == true && pwdChkValidate() == true 
//        		&& nameValidate() == true && phoneValidate() == true){
//        		$('#signUpForm').trigger('submit');
//        		alert("용달이에 오신 것을 환영합니다~!");
//        	};
//        	
//        // 사업자(기사) 회원가입	
//    	}else{
//        	// 사업자 정보 에러메시지 노출용
//    		if(carCapacityValidate() == true){
//    			if(carTypeValidate() == true){
//    				carNoValidate();
//    			}
//    		}
//    		
//    		regImgValidate();
//    		
//    		// 사업자 정보 포함 전체 유효성 검사 후 제출용
//        	if(emailValidate() == true && emailDupChk() == true && $('input[name=isVerified]').val() == 'Y'
//        		&& pwdValidate() == true && pwdChkValidate() == true 
//        		&& nameValidate() == true && phoneValidate() == true
//        		&& carInfoValidate() == true && regImgValidate() == true){
//        		$('#signUpForm').trigger('submit');
//        		alert("용달이에 오신 것을 환영합니다~!");
//        	};
//    	}
//    });
    
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
    	var result = false;
    	$.ajax({
        	url : "emailDup.me",
        	type : "get",
        	data : { mId : $('#email').val() },
        	async : false,
        	success : function(value){
        		if(value == "exist" ){
        			displayErrorMsg($("#emailMsg"), '이미 사용중이거나 탈퇴한 아이디입니다.');
        			result = false; 
        		}else if(value == "naver"){
        			displayErrorMsg($("#emailMsg"), "네이버로 이미 가입 또는 탈퇴한 아이디입니다.");
        			result = false; 
        		}
        		else{
        			$("#emailMsg").css("display","none");
        			result = true;
        		}
        	}
        	, error : function(){
        		var msg = "이메일 중복검사중 에러 발생";
        		location.href="error.ydl?msg="+msg;
        	}
        })
    	return result;
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
        if($('input[name=mName]').val() == ""){
            displayErrorMsg($('#nameMsg'), "이름을 입력하세요.(한글 두자 이상)");
            return false;
        }
        // 이름 정규표현식
        else if(!chk(/[가-힣]{2,}/, $('input[name=mName]').val(), $('#nameMsg'), "한글 두자 이상 입력하세요.")){
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
    $("input[name=mName]").keyup(function(event){ 
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[^ㄱ-힣]/gi,''));                
        } 
    });
    
    // 인증번호 숫자만 입력
    $("input[name=inputVeriCode]").keyup(function(event){ 
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[^0-9]/gi,''));                
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
        else if($("input[name=phone]").val().length < 11){
            phone += number.substr(0, 3);
            phone += "-";
            phone += number.substr(3, 3);
            phone += "-";
            phone += number.substr(6);
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
            $('#div_carInfoMsg').css("display","none");
            $('input[name=mSort]').val('일반');
        }
    });

    // 차량번호 한글, 숫자만 입력
    $("input[name=carNo]").keyup(function(event){ 
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[^ㄱ-힣0-9]/gi,''));  
//            $(this).val(inputVal.replace(/^[0-9]{2,3}[ㄱ-힣]{,1}[0-9]/gi,''));  
        } 
    });
    
    // 톤수 유효성(미입력) 검사
    $('select[name=capcity]').focusout(function(){
    	carCapacityValidate();
    })
    
    // 차종 유효성(미입력) 검사
    $('select[name=type]').focusout(function(){    	
    	carTypeValidate();    	
    })
    
    // 차량번호 유효성검사
    $('input[name=carNo]').focusout(function(){
    	carNoValidate();
    })
    
    
    // 파일 업로드
    $('#idImgUpload').click(function(){
    	$('input[name=inputFile_idImg]').trigger('click');
    })
    
    $('#regCardImgUpload').click(function(){
    	$('input[name=inputFile_regCardImg]').trigger('click');
    })

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
        // 톤수 미선택
        if($('select[name=capacity]').val() == ""){
            displayErrorMsg($('#div_carInfoMsg'), "톤수를 선택하세요.");
            return false;
        }
        // 차종 미선택
        else if($('select[name=type]').val() == ""){
            displayErrorMsg($('#div_carInfoMsg'), "차종을 선택하세요.");
            return false;
        }
        // 차량번호 미입력
        else if($('input[name=carNo]').val() == ""){
            displayErrorMsg($('#div_carInfoMsg'), "차량번호를 입력하세요.");
            return false;
        }
        // 차량번호 정규표현식
        // [가-힣0-9]{7,} TODO
        else if(!chk(/^[0-9]{2,3}[ㄱ-힣]{1}[0-9]{4}$/, $('input[name=carNo]').val(), $('#div_carInfoMsg'), "차량번호를 정확히 입력하세요.")){
        	return false;
        }
        else{
            $('#div_carInfoMsg').css('display','none');
            return true;
        }
    }
    
    // 톤수 미선택
    function carCapacityValidate(){
        if($('select[name=capcity]').val() == ""){
            displayErrorMsg($('#div_carInfoMsg'), "톤수를 선택하세요.");
            return false;
        }
        else{
            $('#div_carInfoMsg').css('display','none');
            return true;
        }
    }
    
    // 차종 미선택
    function carTypeValidate(){
    	if($('select[name=type]').val() == ""){
            displayErrorMsg($('#div_carInfoMsg'), "차종을 선택하세요.");
            return false;
        }
    	else{
            $('#div_carInfoMsg').css('display','none');
            return true;
        }
    }
    
    function carNoValidate(){
    	// 차량번호 미입력
    	if($('input[name=carNo]').val() == ""){
            displayErrorMsg($('#div_carInfoMsg'), "차량번호를 입력하세요.");
            return false;
        }
        // 차량번호 정규표현식
    	//[가-힣0-9]{7,}
        else if(!chk(/^[0-9]{2,3}[ㄱ-힣]{1}[0-9]{4}$/, $('input[name=carNo]').val(), $('#div_carInfoMsg'), "차량번호를 정확히 입력하세요.")){
        	return false;
        }
    	else{
            $('#div_carInfoMsg').css('display','none');
            return true;
        }
    }
    
    function regImgValidate(){
    	// 증명사진 누락
    	if($('#img_id').attr('src') == '/yongdali/resources/images/login&signUp/imgUploadIcon.png'){
    		displayErrorMsg($('#div_regImgMsg'), "증명사진을 삽입하세요.");
    		return false;
    	}
    	// 자동차등록증 누락
    	else if($('#img_regCard').attr('src') == '/yongdali/resources/images/login&signUp/imgUploadIcon.png'){
    		displayErrorMsg($('#div_regImgMsg'), "차량등록증 사진을 삽입하세요.");
    		return false;
    	}else{
    		$('#div_regImgMsg').css('display','none');
    		return true;
    	}
    	
    	
    }
    
    // '가입하기' 버튼 클릭 시 '전체 유효성 검사' 후 submit
    $('#btn_submit_signUpForm').click(function(){
//    	if($('#isEasyAcsSignUp').val() == true){
    	if($('#isEasyAcsSignUp').val()){
    		if($('input[name=mSort]').val() == '일반'){
            	if( phoneValidate() == true){
            		$('#signUpForm').trigger('submit');
            		alert("용달이에 오신 것을 환영합니다~!");
            	};
            	
            // 사업자(기사) 회원가입	
        	}else{
            	// 사업자 정보 에러메시지 노출용
        		if(carCapacityValidate() == true){
        			if(carTypeValidate() == true){
        				carNoValidate();
        			}
        		}
        		
        		regImgValidate();
        		
        		// 사업자 정보 포함 전체 유효성 검사 후 제출용
            	if(emailValidate() == true && emailDupChk() == true && $('input[name=isVerified]').val() == 'Y'
            		&& pwdValidate() == true && pwdChkValidate() == true 
            		&& nameValidate() == true && phoneValidate() == true
            		&& carInfoValidate() == true && regImgValidate() == true){
            		$('#signUpForm').trigger('submit');
            		alert("용달이에 오신 것을 환영합니다~!");
            	};
        	}
    	}else{
    		// 기본 정보 에러메시지 노출용
        	if(emailValidate() == true){
        		emailDupChk();
        	};
        	
        	if(pwdValidate() == true){
        		pwdChkValidate();
        	};
        	
        	if($('input[name=isVerified]').val() == 'N'){
        		displayErrorMsg($("#veriMsg"), '이메일을 인증하세요.');
        	}
        	
        	nameValidate();
        	phoneValidate();
        	
        	if($('input[name=mSort]').val() == '일반'){
            	// 기본 정보 전체 유효성 검사 후 제출용
            	if(emailValidate() == true && emailDupChk() == true && $('input[name=isVerified]').val() == 'Y'
            		&& pwdValidate() == true && pwdChkValidate() == true 
            		&& nameValidate() == true && phoneValidate() == true){
            		$('#signUpForm').trigger('submit');
            		alert("용달이에 오신 것을 환영합니다~!");
            	};
            	
            // 사업자(기사) 회원가입	
        	}else{
            	// 사업자 정보 에러메시지 노출용
        		if(carCapacityValidate() == true){
        			if(carTypeValidate() == true){
        				carNoValidate();
        			}
        		}
        		
        		regImgValidate();
        		
        		// 사업자 정보 포함 전체 유효성 검사 후 제출용
            	if(emailValidate() == true && emailDupChk() == true && $('input[name=isVerified]').val() == 'Y'
            		&& pwdValidate() == true && pwdChkValidate() == true 
            		&& nameValidate() == true && phoneValidate() == true
            		&& carInfoValidate() == true && regImgValidate() == true){
            		$('#signUpForm').trigger('submit');
            		alert("용달이에 오신 것을 환영합니다~!");
            	};
        	}
    	}
    });
    
    // 채팅창 열기용_탐희
    $(".chatPage").click(function(){
        window.open('adminChat.ch','_blank');
     })
});

function loadImg(value, num){
	// 입력된 파일의 존재유무 확인
	if(value.files && value.files[0]){
		
		// 이미지 파일인지 체크
		if ( !(/image/i).test(value.files[0].type ) ){
			alert("이미지 파일을 선택하세요!");
			return false;
		}
		
		var reader = new FileReader();
		reader.onload = function(e){
			switch(num){
			case 1 : $('#img_id').attr('src', e.target.result) 
								 .css({'height': '100%', 'width': '100%', 'padding':'unset'});
			 	  	 $('#div_regImgMsg').css('display','none');
					 break;
			case 2 : $('#img_regCard').attr('src', e.target.result)
									  .css({'height': '100%', 'width': '100%', 'padding':'unset'});
					 $('#div_regImgMsg').css('display','none');
					 break;
			}
		}
		reader.readAsDataURL(value.files[0]);
	}else{
		alert('이미지 미리보기 실패! 브라우저를 업그레이드하세요~');
	}
}







