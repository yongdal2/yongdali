$(document).ready(function(){
    /*-- 로그인 ----------------------------------------------*/
    $('#loginForm').submit(function(){
        
    	var result = false;
    	result = loginValidate();

    	
        
        return true;
    })

    // 이메일 유효성 검사
    function loginValidate(){ 
        let emailVal = $("input[name=loginEmail]").val();  
        let idDup = 0;

        // 이메일 미입력
        if ($("input[name=loginEmail]").val() == "" ){
            displayErrorMsg($("#emailMsg"), '이메일을 입력하세요.');
            return false;
        }
        else{
            $("#emailMsg").css("display","none");
            return true;
        }

    }


    /*-- 회원가입 ----------------------------------------------*/
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

    // 엔터 클릭 시 submit 막기
    $('form input').keydown(function(e) {
        if (e.keyCode == 13) {
            return false;
        }
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

    // onsubmit 전체 유효성 검사
    $("#sigInForm").submit(function(){
        emailValidate();
        verifyValidate();
        pwdValidate();
        nameValidate();
        phoneValidate();

        if($('.bizForm').css('display') == 'block'){
            bizFormValidate();
        }
        
        return false;
    })

    // 이메일 유효성 검사
    function emailValidate(){ 
        let emailVal = $("input[name=email]").val();  
        let idDup = 0;

        // 이메일 중복 체크용 ajax
        /* $.ajax({
            url : "/final/idDup.me",
            type : "get",
            data : {
                email : $("input[name=email]").val()
            },
            success : function(result){
                console.log(result);
                idDup = result;
            },
            error : function(){
                alert("아이디 중복 체크 실패!");
            }
        }) */

        // 이메일 미입력
        if (emailVal == "" ){
            displayErrorMsg($("#emailMsg"), '이메일을 입력하세요.');
            // return false;
        }
        // 이메일 정규표현식
        else if(!chk(/^[\a-z0-9_-]{5,20}@[\a-zA-Z]+(\.[\a-zA-Z]+){1,2}$/, emailVal, $("#emailMsg"), "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.")){
            // return false;
        }
        // TODO 이메일 중복 체크
        else if(idDup > 0){
            displayErrorMsg($("#emailMsg"), '이미 사용중이거나 탈퇴한 아이디입니다.');
            // return false;    
        }else{
            $("#emailMsg").css("display","none");
        }

    }

    // 인증번호 유효성 검사
    function verifyValidate(){
        let veriNo = $("input[name=verify]").val();  

        // 인증번호 미입력
        if(veriNo == ""){
            displayErrorMsg($('#veriMsg'), "인증번호를 입력하세요.")
            // return false
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
        let pwdVal = $("input[name=pwd]").val();
        let pwdChkVal = $("input[name=pwdChk]").val()

        // 비밀번호 미입력
        if(pwdVal == ""){
            displayErrorMsg($('#pwdMsg'), "비밀번호를 입력하세요.")
            // return false;
        }

        // 비밀번호 정규표현식 
        else if(!chk(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*]).{8,16}$/, pwdVal, $("#pwdMsg"), "8~16자 영문 대 소문자, 숫자, 특수문자(#?!@$%^&*)를 사용하세요.")){
            // (?=            -->  positive lookahed(전방 탐색) : Matches a group after 'the main expression' without including it in the result
            //                          TODO what is the main expression? 
            // .*?            -->  non-greedy : will search for a match using as few characters as possible
            // (?=.*?[A-Z])   -->  A-Z 중 하나 이상
            // .              -->  wildcard : Matches any character cept line breaks
            // {8,20}         -->  8자 이상 20자 이하
        }    

        // 비밀번호 확인 미입력
        else if(pwdChkVal == ""){
            displayErrorMsg($('#pwdMsg'), "비밀번호를 확인하세요.")
            // return false;
        }

        // 비밀번호 불일치 
        else if(pwdVal != pwdChkVal){
            displayErrorMsg($('#pwdMsg'), "비밀번호가 일치하지 않습니다.")
            // return false;
        }else{
            $("#pwdMsg").css("display","none");
        }
        // return true;
    }

    // 이름 유효성 검사
    function nameValidate(){
        // 이름 미입력
        if($('input[name=name]').val() == ""){
            displayErrorMsg($('#nameMsg'), "이름을 입력하세요.(한글 두자 이상)")
        }
        // 이름 정규표현식
        else if(!chk(/[가-힣]{2,}/, $('input[name=name]').val(), $('#nameMsg'), "한글 두자 이상 입력하세요.")){

        }else{
            $('#nameMsg').css('display','none');
        }
    }

    //  휴대폰번호 유효성 검사
    function phoneValidate(){
        // 폰번호 미입력
        if($('input[name=phone]').val() == ""){
            displayErrorMsg($('#phoneMsg'), "휴대폰 번호를 입력하세요.")
        }else{
            $('#phoneMsg').css('display','none');
        }
    }

    // 사업자 정보 유효성 검사
    function bizFormValidate(){
        // 톤수 미입력
        if($('select[name=carCapcity]').val() == ""){
            displayErrorMsg($('#bizFormMsg1'), "톤수를 선택하세요.");
        }
        // 차종 미입력
        else if($('select[name=carType]').val() == ""){
            displayErrorMsg($('#bizFormMsg1'), "차종을 선택하세요.");
        }
        // 차량번호 미입력
        else if($('input[name=carNo]').val() == ""){
            displayErrorMsg($('#bizFormMsg1'), "차량번호를 입력하세요.");
        }
        // 차량번호 정규표현식
        else if(!chk(/[가-힣0-9]{7,}/, $('input[name=carNo]').val(), $('#bizFormMsg1'), "차량번호를 정확히 입력하세요.")){
        }
        else{
            $('#bizFormMsg1').css('display','none');
        }
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
    $("input[type=password]").keyup(function(event){ 
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[^a-zA-Z0-9#?!@$%^&*]/gi,''));
        }
    });

    // 비밀번호 확인
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
        } else if($("input[name=phone]").val().length < 7){
            phone += number.substr(0, 3);
            phone += "-";
            phone += number.substr(3);
        } else if($("input[name=phone]").val().length < 7){
            phone += number.substr(0, 3);
            phone += "-";
            phone += number.substr(3, 3);
            phone += "-";
            phone += number.substr(6);
        } else{
            phone += number.substr(0, 3);
            phone += "-";
            phone += number.substr(3, 4);
            phone += "-";
            phone += number.substr(7);
        }
        $("input[name=phone]").val(phone);
    });

    // 사업자 또는 일반회원으로 가입하기
    $('#slecBiz').click(function(){
        if($('#slecBiz img').attr('alt') == '더하기'){
            $('#slecBiz img').attr('src', 'resources/images/login&signUp/round-substract.svg').attr('alt','빼기');            
            $('#slecBiz div').text('일반회원으로 가입하기');
            $('.bizForm').show();
        }else{
                $('#slecBiz img').attr('src', 'resources/images/login&signUp/round-add.svg').attr('alt','더하기');
                $('#slecBiz div').text('사업자(기사)로 가입하기');
                $('.bizForm').hide();
                $('#bizFormMsg1').css("display","none");
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
        $(this).css('background-color','rgb(236, 240, 242)');
        $('.cCvWPY').css('background-color','white');
 
        $('.fGXWzu').css('display','none');
        $('.ezDdUH').css({'display':'flex'});
    })

    $('.cCvWPY').click(function(){
        $(this).css('background-color','rgb(236, 240, 242)');
        $('.dpmSTb').css('background-color','white');
        $('.ezDdUH').css('display','none');
        $('.fGXWzu').css('display','block');
    })

    /*-- 약관 ----------------------------------------------*/
    // 약관동의
    $('#chkAll').click(function(){
        if($(this).attr('src') == 'resources/images/login&signUp/unchecked-circle.png') {
            $('.chkPolicy').attr('src','resources/images/login&signUp/checked-circle.png');
        } else{
            $('.chkPolicy').attr('src','resources/images/login&signUp/unchecked-circle.png');
        }
    });

    $('.chkPolicy:eq(1)').click(function(){
        if($(this).attr('src') == 'resources/images/login&signUp/unchecked-circle.png') {
            $(this).attr('src','resources/images/login&signUp/checked-circle.png');
        } else{
            $(this).attr('src','resources/images/login&signUp/unchecked-circle.png');
        }
    });

    $('.chkPolicy:eq(2)').click(function(){
        if($(this).attr('src') == 'resources/images/login&signUp/unchecked-circle.png') {
            $(this).attr('src','resources/images/login&signUp/checked-circle.png');
        } else{
            $(this).attr('src','resources/images/login&signUp/unchecked-circle.png');
        }
    });

    $('.chkPolicy:eq(3)').click(function(){
        if($(this).attr('src') == 'resources/images/login&signUp/unchecked-circle.png') {
            $(this).attr('src','resources/images/login&signUp/checked-circle.png');
        } else{
            $(this).attr('src','resources/images/login&signUp/unchecked-circle.png');
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

});







