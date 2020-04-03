

/* 차량 안내 */
$('#carGuide-ment').click(function(){
	$('#myModal1').css('display','block');
});


/* preEstimate Contents*/
// 필요한 변수들
var sl1 = document.getElementById('sl1');
var sl2 = document.getElementById('sl2');
var precharge_opt1 = 0;
var precharge_opt2 = 0;





/* select 태그 선택시 효과 적용 */
function cl1(){
    document.getElementById('sl1').style.color='black';
    addCarInfo1();
}
function cl2(){
    document.getElementById('sl2').style.color='black';
    addCarInfo2();
}
function cl3(){
    document.getElementById('sl3').style.color='black';
}
function cl4(){
    document.getElementById('sl4').style.color='black';
}



//차량옵션에 정보 입력
var carInfo = document.getElementById('carInfo');
function addCarInfo1(){
	carInfo.innerHTML = sl1.value;	
}
function addCarInfo2(){
	carInfo.innerHTML = sl1.value+" / "+sl2.value;
	
	if(sl1.value=="1톤"){
		precharge_opt1 = 0;
	} else if(sl1.value=="1.4톤"){
		precharge_opt1 = 1;
	} else if(sl1.value=="2.5톤"){
		precharge_opt1 = 4;
	} else if(sl1.value=="3.5톤"){
		precharge_opt1 = 6;
	} else {
		precharge_opt1 = 8;
	}
	
	if(sl2.value=="카고"){
		precharge_opt2 = 0;
	} else {
		precharge_opt2 = 2;
	}
	
	console.log("옵션1(+) : " + precharge_opt1);
	console.log("옵션2(+) : " + precharge_opt2);
}



/* 이삿짐 선택 모달 */
//Get the modal
var modal = document.getElementById("myModal11");

//Get the button that opens the modal
var btn1 = document.getElementById("myBtn11");

//Get the <span> element that closes the modal
var span1 = document.getElementsByClassName("close11")[0];

//When the user clicks the button, open the modal 
btn1.onclick = function() {
	modal.style.display = "block";
}

//When the user clicks on <span> (x), close the modal
span1.onclick = function() {
	modal.style.display = "none";
}

//When the user clicks anywhere outside of the modal, close it
// window 연결이 끊겨서 mouseenter로 연결하여 해결함
$("#myModal11").mouseenter(function(){
	window.onclick = function(event) {
		if (event.target == modal) {
		   modal.style.display = "none";
		}
	}
})
//$("#myModal11").click(function(){
//	$(this).css("display","none")
//})


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
        
        modal.style.display = "none";
    });
});







/* 출발지,도착지 주소 검색 후 위경도 변환 */

//모달 배경화면 생성
var modal2 = document.getElementById("myModal12");

//주소-좌표 변환 객체를 생성
var geocoder = new daum.maps.services.Geocoder();

//우편번호 찾기 화면을 넣을 element
var element_layer = document.getElementById('layer');

//주소창 닫기
function closeDaumPostcode() {
	// iframe을 넣은 element를 안보이게 한다.
	element_layer.style.display = 'none';
	modal2.style.display = "none";
}

//출발지 위도 경도 변수
var startLat = 0;
var startLong = 0;

//도착치 위도 경도 변수
var endLat = 0;
var endLong = 0;

//출발지 주소 검색 후 위경도 변환
function searchStartAddr() {
	modal2.style.display = "block";
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
				alert("죄송합니다. 서울지역 한해서만 운영 가능합니다. 다시 입력해주세요.");
				modal2.style.display = "none";
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
				modal2.style.display = "none";
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
	modal2.style.display = "block";
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
				alert("죄송합니다. 서울지역 한해서만 운영 가능합니다. 다시 입력해주세요.");
				modal2.style.display = "none";
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
				modal2.style.display = "none";
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

//window 클릭시 modal3 닫기
$("#myModal12").mouseenter(function(){
	window.onclick = function(event) {
		if (event.target == modal2) {
		   modal2.style.display = "none";
		}
	}
});

//비용 관련 변수
var distanceCharge = 0;
var carSize = parseInt($("#sl1").val());
var carOpt = parseInt($("#sl2").val());

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
		var d = d1.toFixed(1);
		
		console.log("계산 거리 : " + d + " km");
		
		if(d < 10){
			distanceCharge=4;
		} else if(d < 20){
			distanceCharge=6;
		} else if(d < 30){
			distanceCharge=7;
		} else if(d < 50) {
			distanceCharge=8;
		}
		
		var distanceCharge = document.getElementById("distanceCharge");
		
		distanceCharge.innerHTML = d + "km";
	}
}



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


/* 시간 설정 */
// 이전 날짜 disabled 적용
function noBefore(date){
	if (date < new Date())
		return [false];
	return [true];
}
$('#datepicker1').datepicker({
	dateFormat:'yy년 mm월 dd일',
	changeMonth: true,
	changeYear: true,
	yearRange: 'c-99:c+99',
	maxDate: '+1y',
	beforeShowDay: noBefore
});
$('#datepicker2').datepicker({
	dateFormat:'yy년 mm월 dd일',
	changeMonth: true,
	changeYear: true,
	yearRange: 'c-99:c+99',
	maxDate: '+1y',
	beforeShowDay: noBefore
});




/* 바로 상하차 시 날짜시간 무효 */
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
$("#checkLoad2").click(function(){
	if($(this).prop("checked") == true) {
		$("#datepicker2").attr('disabled','disabled').css('background','#F8F8F8');
		$("#sl4").attr('disabled','disabled').css('background','#F8F8F8');
		$('#datepicker2').datepicker('setDate',null);
		document.getElementById('sl4').selectedIndex = 0;
		document.getElementById('sl4').style.color="#8e8e8e";
	} else if($(this).prop("checked") == false) {    	  
		$("#datepicker2").attr('disabled',false).css('background','white');
		$("#sl4").attr('disabled',false).css('background','white');
	}
});

































/* 상하차 도움 */
var modal3 = document.getElementById("myModal13");
var span2 = document.getElementById("modal-close2");

span2.onclick = function(){
	modal3.style.display="none";
}
// 상차 도움
function helpLoad(){
	modal3.style.display="block";
}

// 상차 도움 필요없음
$("#help2").click(function(){
	$("#helpLoad").html($("#help2").val());
});

// 하차 도움 필요없음
$("#help4").click(function(){
	$("#helpUnload").html($("#help4").val());
});


// window 클릭시 modal3 닫기
$("#myModal13").mouseenter(function(){
	window.onclick = function(event) {
		if (event.target == modal3) {
		   modal3.style.display = "none";
		}
	}
});



/* 상하차 도움 */
var modal4 = document.getElementById("myModal14");
var span3 = document.getElementById("modal-close3");

span3.onclick = function(){
	modal4.style.display="none";
}
// 상차 도움
function helpUnload(){
	modal4.style.display="block";
}


// window 클릭시 modal3 닫기
$("#myModal14").mouseenter(function(){
	window.onclick = function(event) {
		if (event.target == modal4) {
			modal4.style.display = "none";
		}
	}
});




















