var charge_opt1 = 0;
var charge_opt2 = 0;
var charge_dis = 0;
var charge_add1=0;
var charge_add2=0;
var amount=0;

// 총 결제 금액 계산 기능
function calc(){
	amount=(charge_opt1+charge_opt2+charge_dis+charge_days+charge_add1+charge_add2)*10000;
	
	$('#amount').html(amount.toLocaleString()+"원");
	$('#amountVal').val(amount);
}

/* 차량 안내 */
$('#carGuide-ment').click(function(){
	$('#myModal1').css('display','block');
});


var modal1 = document.getElementById("myModal1");
var span1 = document.getElementById("modal-close1");

span1.onclick = function() {
	modal1.style.display = "none";
}

// 모달 영역 밖에 클릭했을때 모달 닫기
$("#myModal1").mouseenter(function(){
	window.onclick = function(event) {
		if (event.target == modal1) {
		   modal1.style.display = "none";
		}
	}
});

// 차량형태,적재크기 클릭시 css와 내용 변화 
$("#type1").click(function(){
    $(this).css('background','white');
    $("#size1").css('background','rgb(236, 240, 242)');
    $("#guide-content1").css('display','block');
    $("#guide-content2").css('display','none');
});
$("#size1").click(function(){
    $(this).css('background','white');
    $("#type1").css('background','rgb(236, 240, 242)');
    $("#guide-content1").css('display','none');
    $("#guide-content2").css('display','block');
});

/* 차량 옵션 select태그 클릭시 글자색 변화 */
function cl1(){
	$('#sl1').css('color','black');
    addCarInfo1();
}
function cl2(){
	$('#sl2').css('color','black');
    addCarInfo2();
}

/* 상하차 시간 태그 클릭시 글자색 변화 */
function cl3(){
	if($('#datepicker1').val()!=""){
		$('#sl3').css('color','black');		
	} else {
		alert("상차일부터 선택해주세요.");
		document.getElementById('sl3').selectedIndex = 0;
	}
}
function cl4(){
	if($('#datepicker2').val()!=""){
		$('#sl4').css('color','black');	
	} else {
		alert("하차일부터 선택해주세요.");
		document.getElementById('sl4').selectedIndex = 0;
	}
}

//차량옵션에 정보 입력
var carInfo = document.getElementById('carInfo');
function addCarInfo1(){
	if(sl1.value=="1"){
		charge_opt1 = 0;
	} else if(sl1.value=="1.4"){
		charge_opt1 = 1;
	} else if(sl1.value=="2.5"){
		charge_opt1 = 5;
	} else if(sl1.value=="3.5"){
		charge_opt1 = 6;
	} else {
		charge_opt1 = 8;
	}
	
	// 거리와 계산 연관관계
	if(charge_dis==0 && sl2.value==""){
		carInfo.innerHTML = sl1.value+"톤";
	} else {
		carInfo.innerHTML = sl1.value+"톤 / "+sl2.value;
		calc();
	}
}
function addCarInfo2(){
	if(sl2.value=="카고"){
		charge_opt2 = 0;
	} else {
		charge_opt2 = 2;
	}
	
	// 거리와 계산 연관관계
	if(charge_dis==0){		
		carInfo.innerHTML = sl1.value+"톤 / "+sl2.value;	
	} else {
		carInfo.innerHTML = sl1.value+"톤 / "+sl2.value;		
		console.log("옵션1(+) : " + charge_opt1);
		console.log("옵션2(+) : " + charge_opt2);
		calc();
	}
}


/* 이삿짐 선택 모달 */
//Get the modal
var modal2 = document.getElementById("myModal2");

//Get the button that opens the modal
var btn1 = document.getElementById("selectLoad-btn");

//Get the <span> element that closes the modal
var span2 = document.getElementById("modal-close2");

//When the user clicks the button, open the modal 
btn1.onclick = function() {
	modal2.style.display = "block";
}

//When the user clicks on <span> (x), close the modal
span2.onclick = function() {
	var s1 = $('.move-content1112');
    var s2 = $('.move-content1113');
    var userLoads = [];
    
    for(var i = 0; i<s1.length; i++){
        if($(s1[i]).html()>0){
            var title = $('.move-content112');
            userLoads.push($(title[i]).html()+'('+$(s1[i]).html()+')');
        }
    }

    for(var i = 0; i<s2.length; i++){
        if($(s2[i]).html()>0){
            var title = $('.move-content113');
            userLoads.push($(title[i]).val()+'('+$(s2[i]).html()+')');
        }
    }
    console.log(userLoads);

    var arrayString = userLoads.join(', ');
    $('#load-content-area').text(arrayString);
    
    modal2.style.display = "none";
	modal2.style.display = "none";
}

//모달 영역 밖에 클릭했을때 모달 닫기
// window 연결이 끊겨서 mouseenter로 연결하여 해결함
$("#myModal2").mouseenter(function(){
	window.onclick = function(event) {
		if (event.target == modal2) {
		   modal2.style.display = "none";
		}
	}
});


/* 가구, 가전, 기타 클릭시마다 borderline 변경 */
$('#funiture11').click(function(){
    $('#appliance11').css({
        'background':'rgb(236, 240, 242)',
        'border':'none',
        'border-bottom':'2px solid black'
    });
    $('#etc11').css({
        'background':'rgb(236, 240, 242)',
        'border':'none',
        'border-bottom':'2px solid black'
    });
    $(this).css({
        'border':'2px solid black',
        'border-bottom':'none',
        'background':'white'
    })
    $('#funiture22').css({
        'display':'block'
    });
    $('#appliance22').css({
        'display':'none'
    });
    $('#etc22').css({
        'display':'none'
    });
});

$('#appliance11').click(function(){
    $('#funiture11').css({
        'background':'rgb(236, 240, 242)',
        'border':'none',
        'border-bottom':'2px solid black'
    });
    $('#etc11').css({
        'background':'rgb(236, 240, 242)',
        'border':'none',
        'border-bottom':'2px solid black'
    });
    $(this).css({
        'border':'2px solid black',
        'border-bottom':'none',
        'background':'white'
    })
    $('#funiture22').css({
        'display':'none'
    });
    $('#appliance22').css({
        'display':'block'
    });
    $('#etc22').css({
        'display':'none'
    });
});

$('#etc11').click(function(){
    $('#appliance11').css({
        'background':'rgb(236, 240, 242)',
        'border':'none',
        'border-bottom':'2px solid black'
    });
    $('#funiture11').css({
        'background':'rgb(236, 240, 242)',
        'border':'none',
        'border-bottom':'2px solid black'
    });
    $(this).css({
        'border':'2px solid black',
        'border-bottom':'none',
        'background':'white'
    })
    $('#funiture22').css({
        'display':'none'
    });
    $('#appliance22').css({
        'display':'none'
    });
    $('#etc22').css({
        'display':'block'
    });
});

/* 모달 팝업 기타 내용 중 항목 추가 및 삭제 */
$(function(){
    $(document).on('click','#addList-btn',function(){
    	var src = "${pageContext.request.contextPath}";
        $('#div11')
        .append('<div class="move-content11"><div class="move-content111" style="margin-right: 6px; margin-top: 7px;"><div class="move-content1111 minus11"><img src="/yongdali/resources/images/reservation/iconfinder_minus_172505.png" alt="111" class="move-minus-img"></div><span class="move-content1113">0</span><div class="move-content1111 plus11"><img src="/yongdali/resources/images/reservation/add_plus-512.png" alt="" class="move-plus-img"></div>&nbsp;&nbsp;&nbsp;<div class="item1" style="cursor:pointer;"><img src="/yongdali/resources/images/reservation/x-mark.png" alt="" style="width: 15px; height: 15px; style="margin-bottom: 3px;""></div></div><div style="height: 35px;"><input class="move-content113" type="text" style="width: 120px; height: 25px; margin-top:5px; margin-left: 20px; font-size:9pt;"></div></div>');       
    });
    
    $(document).on('click','.item1',function(){
        $(this).parent().parent().remove();
    });
});

/* 수량 증감 */
$(function(){
    $(document).on('click','.plus11',function(){
        var sp = parseInt($(this).parent().children('span').html());
        $(this).parent().children('span').html(sp+1);
    });
});
$(function(){
    $(document).on('click','.minus11',function(){
        var sp = parseInt($(this).parent().children('span').html());
        $(this).parent().children('span').html(sp-1);
        if(sp-1 < 0){
            alert('수량이 0보다 작을 수 없습니다. 다시 입력해주세요.');
            $(this).parent().children('span').html(0);
        }
    });
});


/* 유저가 선택한 짐들 div에 담기 */
$(function(){
    $(document).on('click','#loadBtn',function(){
        var s1 = $('.move-content1112');
        var s2 = $('.move-content1113');
        var userLoads = [];
        
        for(var i = 0; i<s1.length; i++){
            if($(s1[i]).html()>0){
                var title = $('.move-content112');
                userLoads.push($(title[i]).html()+'('+$(s1[i]).html()+')');
            }
        }

        for(var i = 0; i<s2.length; i++){
            if($(s2[i]).html()>0){
                var title = $('.move-content113');
                userLoads.push($(title[i]).val()+'('+$(s2[i]).html()+')');
            }
        }
        console.log(userLoads);

        var arrayString = userLoads.join(', ');
        $('#load-content-area').text(arrayString);
        
        modal2.style.display = "none";
    });
});


/* 출발지,도착지 주소 검색 후 위경도 변환 */

//모달 배경화면 생성
var modal34 = document.getElementById("myModal34");

//주소-좌표 변환 객체를 생성
var geocoder = new daum.maps.services.Geocoder();

//우편번호 찾기 화면을 넣을 element
var element_layer = document.getElementById('layer');

//주소창 닫기
function closeDaumPostcode() {
	// iframe을 넣은 element를 안보이게 한다.
	element_layer.style.display = 'none';
	modal34.style.display = "none";
}

//출발지 위도 경도 변수
var startLat = 0;
var startLong = 0;

//도착치 위도 경도 변수
var endLat = 0;
var endLong = 0;

//출발지 주소 검색 후 위경도 변환
function searchStartAddr() {
	modal34.style.display = "block";
 new daum.Postcode({
     oncomplete: function(data) {
         // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

         // 각 주소의 노출 규칙에 따라 주소를 조합한다.
         // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
         var addr = ''; // 주소 변수

         //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
         if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
             addr = data.roadAddress;
         } else { // 사용자가 지번 주소를 선택했을 경우(J)
             addr = data.jibunAddress;
         }
         
         /* 서울 지역 조건 */
         if(!addr.includes("서울")){
				alert("죄송합니다.\n서울지역 한해서만 운영 가능합니다.\n다시 입력해주세요.");
				modal34.style.display = "none";
			} else {
				// 주소로 상세 정보를 검색
				geocoder.addressSearch(addr, function(results, status) {
					// 정상적으로 검색이 완료됐으면
					if (status === daum.maps.services.Status.OK) {
						
						var result = results[0]; //첫번째 결과의 값을 활용
						startLat = result.x;
						startLong = result.y;
						console.log("출발지 위도 : " + startLat);
						console.log("출발지 경도 : " + startLong);
						preChargeFunc();
					}
				});
				
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById("startAddr").value = addr;
				
				// iframe을 넣은 element를 안보이게 한다.
				// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
				element_layer.style.display = 'none';
				
				// 모달 닫기
				modal34.style.display = "none";
				document.getElementById("startDetailAddr").focus();
			}
     },
     width : '100%',
     height : '100%',
     maxSuggestItems : 5
 }).embed(element_layer);

 // iframe을 넣은 element를 보이게 한다.
 element_layer.style.display = 'block';

 // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
 initLayerPosition();
}

//도착지 주소 검색 후 위경도 변환
function searchEndAddr() {
	modal34.style.display = "block";
	new daum.Postcode({
		oncomplete: function(data) {
			// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			
			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			
			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}
			
			/* 서울 지역 조건 */
			if(!addr.includes("서울")){
				alert("죄송합니다.\n서울지역 한해서만 운영 가능합니다.\n다시 입력해주세요.");
				modal34.style.display = "none";
			} else {
				
				// 주소로 상세 정보를 검색
				geocoder.addressSearch(addr, function(results, status) {
					// 정상적으로 검색이 완료됐으면
					if (status === daum.maps.services.Status.OK) {
						
						var result = results[0]; //첫번째 결과의 값을 활용
						endLat = result.x;
						endLong = result.y;
						console.log("도착지 위도 : " + endLat);
						console.log("도착지 경도 : " + endLong);
						preChargeFunc();
					}
				});
				
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById("endAddr").value = addr;
				
				// iframe을 넣은 element를 안보이게 한다.
				// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
				element_layer.style.display = 'none';
				
				// 모달 닫기
				modal34.style.display = "none";
				document.getElementById("endDetailAddr").focus();
				
			}
		},
		width : '100%',
		height : '100%',
		maxSuggestItems : 5
	}).embed(element_layer);
	
	// iframe을 넣은 element를 보이게 한다.
	element_layer.style.display = 'block';
	// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
	initLayerPosition();
}

//브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
//resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
//직접 element_layer의 top,left값을 수정해 주시면 됩니다.
function initLayerPosition(){
 var width = 450; //우편번호서비스가 들어갈 element의 width
 var height = 400; //우편번호서비스가 들어갈 element의 height
 var borderWidth = 6; //샘플에서 사용하는 border의 두께

 // 위에서 선언한 값들을 실제 element에 넣는다.
 element_layer.style.width = width + 'px';
 element_layer.style.height = height + 'px';
 element_layer.style.border = borderWidth + 'px solid';
 
 // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
 element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
 element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
}

//모달 영역 밖에 클릭했을때 모달 닫기
$("#myModal34").mouseenter(function(){
	window.onclick = function(event) {
		if (event.target == modal34) {
		   modal34.style.display = "none";
		}
	}
});


/* 출발지에서 도착지까지의 거리 계산 */
function preChargeFunc(){
	if(endLat!=0 && startLat!=0){
		function deg2rad(deg) {
			return deg * (Math.PI/180)
		}
		var R = 6371; // Radius of the earth in km
		var dLat = deg2rad(endLat-startLat);  // deg2rad below
		var dLon = deg2rad(endLong-startLong);
		var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(startLat)) * Math.cos(deg2rad(endLat)) * Math.sin(dLon/2) * Math.sin(dLon/2);
		var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
		var d1 = R * c; // Distance in km
		var d = d1.toFixed(2);
		
		console.log("계산 거리 : " + d + " km");
		
		if(d < 10){
			charge_dis=4;
		} else if(d < 20){
			charge_dis=6;
		} else if(d < 30){
			charge_dis=7;
		} else if(d < 50){
			charge_dis=8;
		}
		
		var distance = document.getElementById("distance");
		
		distance.innerHTML = d + " km";
		$("#distanceVal").val(d);
		console.log("거리에 따른 비용 : " + charge_dis);
		calc();
	}
}

// 최신 사용한 주소록 알아내기 위한 변수 선언
var stANo = "";
var edANo = "";

// 출발지 주소록에 선택한 주소값들 해당 input에 담기
function addStAddrList(){
	stANo = $('input[name="startAddrList"]:checked').closest("div").find('.stANo').val();
	var stAName = $('input[name="startAddrList"]:checked').closest("div").find('.stAName').val();
	var stAddr1 = $('input[name="startAddrList"]:checked').closest("div").find('.stAddr1').val();
	var stAddr2 = $('input[name="startAddrList"]:checked').closest("div").find('.stAddr2').val();
	var stAPhone = $('input[name="startAddrList"]:checked').closest("div").find('.stAPhone').val();
	startLat = $('input[name="startAddrList"]:checked').closest("div").find('.stLat').val();
	startLong = $('input[name="startAddrList"]:checked').closest("div").find('.stLong').val();
	
	console.log(startLat);
	console.log(startLong);
	
	$('#startName').val(stAName);
	$('#startPhone').val(stAPhone);
	$('#startAddr').val(stAddr1);
	$('#startDetailAddr').val(stAddr2);
	$('#myModal6').css('display','none');
}

// 도착지 주소록에 선택한 주소값들 해당 input에 담기, 출발지에서 도착지까지 거리 계산 그리고 거리에 따른 견적
function addEdAddrList(){
	
	if(startLat != 0){
		edANo = $('input[name="endAddrList"]:checked').closest("div").find('.edANo').val();
		var edAName = $('input[name="endAddrList"]:checked').closest("div").find('.edAName').val();
		var edAddr1 = $('input[name="endAddrList"]:checked').closest("div").find('.edAddr1').val();
		var edAddr2 = $('input[name="endAddrList"]:checked').closest("div").find('.edAddr2').val();
		var edAPhone = $('input[name="endAddrList"]:checked').closest("div").find('.edAPhone').val();
		endLat = $('input[name="endAddrList"]:checked').closest("div").find('.edLat').val();
		endLong = $('input[name="endAddrList"]:checked').closest("div").find('.edLong').val();
		
		console.log(endLat);
		console.log(endLong);
		
		$('#endName').val(edAName);
		$('#endPhone').val(edAPhone);
		$('#endAddr').val(edAddr1);
		$('#endDetailAddr').val(edAddr2);
		$('#myModal7').css('display','none');
		
		// 출발지에서 도착지까지 거리 계산 그리고 거리에 따른 견적 기능
		preChargeFunc();
		
	} else {
		alert("출발지 주소를 입력해주세요.");
		$('#myModal7').css('display','none');
	}
}

// 출발지 주소록 버튼 클릭시 주소 추가
$("#stALBtn").click(function(){
	addStAddrList();
});

// 도착지 주소록 버튼 클릭시 주소 추가
$("#edALBtn").click(function(){
	addEdAddrList();
});

// 해당 영역 밖에 클릭하면 출발지&도착지 주소록 닫기
var modal6 = document.getElementById("myModal6");
$("#myModal6").mouseenter(function(){
	window.onclick = function(event) {
		if (event.target == modal6) {
			// 선택한 주소 지우기
			$('input[name="startAddrList"]:checked').prop('checked', false);
			modal6.style.display = "none";
		}
	}
});
var modal7 = document.getElementById("myModal7");
$("#myModal7").mouseenter(function(){
	window.onclick = function(event) {
		if (event.target == modal7) {
			// 선택한 주소 지우기
			$('input[name="endAddrList"]:checked').prop('checked', false);
			modal7.style.display = "none";
		}
	}
});


// x 버튼 눌렀을때 모달6,7 닫기
$('#modal-close6').click(function(){
	$('input[name="startAddrList"]:checked').prop('checked', false);
	modal7.style.display = "none";
});

$('#modal-close7').click(function(){
	$('input[name="endAddrList"]:checked').prop('checked', false);
	modal7.style.display = "none";
});


/* 연락처 자릿수 자동 설정 */
function inputPhoneNumber(obj) {
    var number = obj.value.replace(/[^0-9]/g, "");
    var phone = "";

    if(number.length < 4) {
        return number;
    } else if(number.length < 7) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3);
    } else if(number.length < 11) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 3);
        phone += "-";
        phone += number.substr(6);
    } else {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 4);
        phone += "-";
        phone += number.substr(7);
    }
    obj.value = phone;
}


/* 날짜 설정 */
/* 상차 날짜  */
var startDateStr;
var endDateStr;
var days;
var addDate;
var stDate;
var edDate;

// 하차 예약시 기간에 따른 비용
var charge_days=0;

// 바로 상차 선택시, 상차 날짜 변수에 현재날짜 담기
$('#checkLoad1').click(function(){
	if($(this).is(":checked")){
		var startYear = new Date().getFullYear();
		var startMonth = new Date().getMonth()+1;
		var startDay = new Date().getDate();
		var addStartDay = startDay+1;
		startDateStr = startYear+"-"+startMonth+"-"+startDay;
		stDate = new Date(startDateStr);
		addDate = startYear+"년 "+startMonth+"월 "+addStartDay+"일";
		console.log("바로 상차 선택날짜로부터 1일후 하차예약 가능날짜 : "+addDate);
		$('#datepicker2').datepicker('option','minDate',addDate);
		$(this).val("바로 상차");
		if($('#datepicker2').val()!=""){
			days = Math.round((edDate.getTime()-stDate.getTime())/1000/60/60/24);
			
			if(days != 0){
				console.log("시작날짜로와 종료날짜 사이 일수 : " + days);
				charge_days = 6*days;
				console.log(days+"*60,000원 = " + charge_days);
				$('#btwDay').html(days+"일");
				$('#book-YN').html("O");
				calc();
			}
		}
	} else {
		// 바로 상차 클릭 해제시, 하차 예약 날짜값 있으면 초기화
		if($('#datepicker2').val()!=""){			
			$('#datepicker2').datepicker('setDate',null);
			document.getElementById('sl4').selectedIndex = 0;
			document.getElementById('sl4').style.color="#8e8e8e";
		}
	}
});


// 하차 예약시 날짜 선택시 변수에 담기
function setEndDate(){
	console.log($('#datepicker1').val());
	console.log($('#checkLoad1').val());
	
	// 바로상차 체크유무와 상차 날짜 값이 없을경우 alert실행 
	if($('#datepicker1').val()=="" && $('#checkLoad1').prop("checked")==false){
		alert("상차 날짜 먼저 입력해주세요.");
		$('#datepicker2').datepicker('setDate',null);
		$('#datepicker2').datepicker('destroy');
	} else {
		var endYMD = $('#datepicker2').val();
		endDateStr = endYMD.substr(0,4)+"-"+endYMD.substr(6,2)+"-"+endYMD.substr(10,2);
		stDate = new Date(startDateStr);
		edDate = new Date(endDateStr);
		days = Math.round((edDate.getTime()-stDate.getTime())/1000/60/60/24);
		console.log("시작날짜로와 종료날짜 사이 일수 : " + days);
		charge_days = 6*days;
		console.log(days+"*60,000원 = " + charge_days);
		$('#btwDay').html(days+"일");
		$('#book-YN').html("O");
		calc();
	}
}


// 이전 날짜 disabled 적용
function noBefore(date){
	if (date < new Date())
		return [false];
	return [true];
}


// 상차 예약 클릭시 달력 표시 - 상차 선택에 따라 하차 가능일 조건 삽입
$('#datepicker1').datepicker({
	dateFormat:'yy년 mm월 dd일',
	changeMonth: true,
	changeYear: true,
	yearRange: 'c-99:c+99',
	maxDate: '+1y',
	onSelect: function(selectedDate){	// 상차 날짜선택시 적용

		var startYMD = $('#datepicker1').val();
		startDateStr = startYMD.substr(0,4)+"-"+startYMD.substr(6,2)+"-"+startYMD.substr(10,2);
		console.log(startDateStr);
		var addDay = parseInt(selectedDate.substr(10,2)) + 2;
		addDate = selectedDate.substr(0,10) + addDay + "일";
		$('#datepicker2').datepicker('option','minDate',addDate);
		
		// 하차예약날짜값이 있는 상태에서 상차 날짜 예약시 하차예약날짜값 초기화
		if($('#datepicker2').val()!=""){
			$('#datepicker2').datepicker('setDate',null);
			document.getElementById('sl4').selectedIndex = 0;
			document.getElementById('sl4').style.color="#8e8e8e";
		}
	},
	beforeShowDay: noBefore
});

// 하차 예약 클릭시 달력 표시
$('#datepicker2').datepicker({
	dateFormat:'yy년 mm월 dd일',
	changeMonth: true,
	changeYear: true,
	yearRange: 'c-99:c+99',
	maxDate: '+1y',
	onSelect: function(){

		
	},
	beforeShowDay: noBefore
});

// 하차 날짜 예약 클릭시 주의 사항 전달
$('#datepicker2').click(function(){
	if($('#datepicker1').val()!="" || $('#checkLoad1').prop('checked')==true){
		$('#caution-div1').css('display','none');
		$('#caution-div2').css('display','block');
		
	}
});

/* 바로 상차 시 날짜시간 무효 */
$("#checkLoad1").click(function(){
	if($(this).prop("checked") == true) {
		$("#datepicker1").attr('disabled','disabled').css('background','#F8F8F8');
		$("#sl3").attr('disabled','disabled').css('background','#F8F8F8');
		$('#datepicker1').datepicker('setDate',null);
		document.getElementById('sl3').selectedIndex = 0;
		document.getElementById('sl3').style.color="#8e8e8e";
		
	} else if($(this).prop("checked") == false) {    	  
		$("#datepicker1").attr('disabled',false).css('background','white').val("");
		$("#sl3").attr('disabled',false).css('background','white').val("");
	}
});

/* 바로 하차 시 날짜시간 무효 */
$("#checkLoad2").click(function(){
	if($(this).prop("checked") == true) {
		$("#datepicker2").attr('disabled','disabled').css('background','#F8F8F8');
		$("#sl4").attr('disabled','disabled').css('background','#F8F8F8');
		$('#datepicker2').datepicker('setDate',null);
		document.getElementById('sl4').selectedIndex = 0;
		document.getElementById('sl4').style.color="#8e8e8e";
		$('#caution-div1').css('display','block');
		$('#caution-div2').css('display','none');
		$('#book-YN').html("X");
		$('#btwDay').html("X");
		$('#days').val("0");
		charge_days = 0;
		calc();
	} else if($(this).prop("checked") == false) {    	  
		$("#datepicker2").attr('disabled',false).css('background','white');
		$("#sl4").attr('disabled',false).css('background','white');
		$('#book-YN').html("");
		$('#btwDay').html("");
		$('#days').val("0");
	}
});

// '도움 필요하지 않아요' 클릭시
$('#helpUnload-ch').click(function(){
	$('#helpLoad').text("고객님이 직접 상차");
	$('#helpUnload').text("고객님이 직접 하차");
	$('#helpLoadVal').val("고객님이 직접 상차");
	$('#helpUnloadVal').val("고객님이 직접 하차");
	charge_add1 = 0;
	charge_add2 = 0;
});

// '도움 필요해요' 클릭시 전에 클릭했던 정보 삭제
$('#helpLoad-ch').click(function(){
	$('#myModal5').css('display','block');
	$('#checkHelp1').prop('checked',false);
	$('#checkHelp2').prop('checked',false);
	$('#checkHelp3').prop('checked',false);
	$('#checkHelp4').prop('checked',false);
	$('#checkHelp5').prop('checked',false);
	$('#checkHelp6').prop('checked',false);
	$('#checkHelp1').val("");
	$('#checkHelp2').val("");
	$('#helpCharge1').html("+ 0원");
	$('#helpCharge2').html("+ 0원");
	charge_add1 = 0;
	charge_add2 = 0;
});


// 상차만 선택
$('#checkHelp1').click(function(){
	$('#modal51').css('display','block');
	$('#modal5').css('display','none');
});
// 하차만 선택시
$('#checkHelp2').click(function(){
	$('#modal52').css('display','block');
	$('#modal5').css('display','none');
});

// 상차 : 기사님과 함께 or 단독 선택
$('#checkHelp3').click(function(){
	$('#modal51').css('display','none');
	$('#modal5').css('display','block');
	$('#checkHelp1').val("기사님과 함께 상차");
	$('#helpCharge1').html("+10,000원");
	$('#checkHelp1').prop('checked',true);
	charge_add1 = 1;
});
$('#checkHelp4').click(function(){
	$('#modal51').css('display','none');
	$('#modal5').css('display','block');
	$('#checkHelp1').val("기사님 단독 상차");
	$('#helpCharge1').html("+20,000원");
	$('#checkHelp1').prop('checked',true);
	charge_add1 = 2;
});
// 하차 : 기사님과 함께 or 단독 선택
$('#checkHelp5').click(function(){
	$('#modal52').css('display','none');
	$('#modal5').css('display','block');
	$('#checkHelp2').val("기사님과 함께 하차");
	$('#helpCharge2').html("+10,000원");
	$('#checkHelp2').prop('checked',true);
	charge_add2 = 1;
});
$('#checkHelp6').click(function(){
	$('#modal52').css('display','none');
	$('#modal5').css('display','block');
	$('#checkHelp2').val("기사님 단독 하차");
	$('#helpCharge2').html("+20,000원");
	$('#checkHelp2').prop('checked',true);
	charge_add2 = 2;
});


// 상하차 선택하기 혹은 닫기
$('#checkHelp-btn').click(function(){
	
	// 상차 하차 선택하면
	if(!$('#checkHelp1').val()=="" || !$('#checkHelp2').val()==""){
		
		// 상차 하차 값이 모두 들어있을 경우
		if(!$('#checkHelp1').val()=="" && !$('#checkHelp2').val()==""){
			$('#myModal5').css('display','none');
			$('#helpLoad').html($('#checkHelp1').val());
			$('#helpUnload').html($('#checkHelp2').val());
			$('#helpLoadVal').val($('#checkHelp1').val());
			$('#helpUnloadVal').val($('#checkHelp2').val());
			calc();
		
		// 상하차 값중 하나만 들어있을 경우
		} else {
			
			// 상차 값이 있을경우
			if(!$('#checkHelp1').val()==""){
				$('#myModal5').css('display','none');
				$('#helpLoad').html($('#checkHelp1').val());
				$('#helpUnload').html("고객님이 직접 하차");
				$('#helpLoadVal').val($('#checkHelp1').val());
				$('#helpUnloadVal').val("고객님이 직접 하차");
				calc();
				
			// 하차 값이 있을 경우
			} else {				
				$('#myModal5').css('display','none');
				$('#helpLoad').html("고객님이 직접 상차");
				$('#helpUnload').html($('#checkHelp2').val());
				$('#helpLoadVal').val("고객님이 직접 하차");
				$('#helpUnloadVal').val($('#checkHelp2').val());
				calc();
			}
		}
		
	// 상하차 선택하지 않으면
	} else {
		alert("상차 혹은 하차 둘중 하나를 필히 선택해주세요.");
	}
});


// 상하차 도움 선택 모달 닫고난후 결과값 담기
var span3 = document.getElementById("modal-close3");
span3.onclick = function() {
	console.log($('#checkHelp1').val());
	console.log($('#checkHelp2').val());
	
	if(!$('#checkHelp1').val()=="" || !$('#checkHelp2').val()==""){
		$('#myModal5').css('display','none');
		$('#helpLoad').html($('#checkHelp1').val());
		$('#helpUnload').html($('#checkHelp2').val());
	} else {
		alert("상차 혹은 하차 둘중 하나를 필히 선택해주세요.");
	}
}

// 모달 상차 하차 각각 닫기 버튼 클릭
var span4 = document.getElementById("modal-close4");
span4.onclick = function() {
	$('#modal51').css('display','none');
	$('#modal5').css('display','block');
	$('#checkHelp1').prop('checked',false);
}
var span5 = document.getElementById("modal-close5");
span5.onclick = function() {
	$('#modal52').css('display','none');
	$('#modal5').css('display','block');
	$('#checkHelp2').prop('checked',false);
}


// 출발지 주소록
$('#stAddrList').click(function(){
	$('#myModal6').css('display','block');
});

// 출발지 주소록 모달 닫기
var span6 = document.getElementById("modal-close6");
span6.onclick = function() {
	$('#myModal6').css('display','none');
}


// 도착지 주소록
$('#edAddrList').click(function(){
	$('#myModal7').css('display','block');
});

// 도착지 주소록 모달 닫기
var span7 = document.getElementById("modal-close7");
span7.onclick = function() {
	$('#myModal7').css('display','none');
}


//출발지와 도착지 각각의 주소 붙여 input hidden에다가 담기
function addAddr(){
	var stAddr1 = $('#startAddr').val();
	var stAddr2 = $('#startDetailAddr').val();
	var edAddr1 = $('#endAddr').val();
	var edAddr2 = $('#endDetailAddr').val();
	$('#addStAddr').val(stAddr1+","+stAddr2);
	$('#addEdAddr').val(edAddr1+","+edAddr2);
}


// 예약하기 버튼 & 상하차 날짜 입력하지 않으면 return false 조건 적용
$('#revForm').submit(function(){
console.log($('#datepicker1').val());
	// 바로 상차를 입력했거나 상차 날짜 입력되었거나
	if($('#checkLoad1').is(":checked") || $('#datepicker1').val()!=""){
		// 바로 상차를 입력했거나 하차 날짜 입력되었거나
		if($('#checkLoad2').is(":checked") || $('#datepicker2').val()!=""){			
			if(confirm("결제 진행하시겠습니까?")){
				addAddr();
				return;
			} else {
				return false;
			}
		} else {			
			alert("하차 날짜를 지정해주세요.");
			return false;
		}
	} else {		
		alert("상차 날짜를 지정해주세요.");
		return false;
	}
});



