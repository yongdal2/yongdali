/* input 태그 클릭시 효과 */
$('.form-control').each(function () {
	floatedLabel($(this));
});

$('.form-control').on('input', function () {
	floatedLabel($(this));
});

function floatedLabel(input) {
	var $field = input.closest('.form-group');
	if (input.val()) {
		$field.addClass('input-not-empty');
	} else {
		$field.removeClass('input-not-empty');
	}
}

/* select 태그 선택시 효과 */
function cl1(){
    document.getElementById('sl1').style.color='black';
}
function cl2(){
    document.getElementById('sl2').style.color='black';
}


/* 출발지 주소 검색 후 위경도 변환 */

// 모달 배경화면 생성
var modal = document.getElementById("myModal11");

// 주소-좌표 변환 객체를 생성
var geocoder = new daum.maps.services.Geocoder();

// 우편번호 찾기 화면을 넣을 element
var element_layer = document.getElementById('layer');

// 주소창 닫기
function closeDaumPostcode() {
    // iframe을 넣은 element를 안보이게 한다.
    element_layer.style.display = 'none';
    modal.style.display = "none";
}

//출발지 위도 경도 변수
var startLat = 0;
var startLong = 0;

//도착치 위도 경도 변수
var endLat = 0;
var endLong = 0;

// 출발지 주소 검색 후 위경도 변환
function searchStartAddr() {
	modal.style.display = "block";
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
				modal.style.display = "none";
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
						
					}
				});
				
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById("startAddr").value = addr;
				
				// 클래스 이름 추가
				document.getElementById("form-group1").classList.add("input-not-empty");
				
				// 모달 닫기
				modal.style.display = "none";
				
				// iframe을 넣은 element를 안보이게 한다.
				// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
				element_layer.style.display = 'none';
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
	modal.style.display = "block";
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
				modal.style.display = "none";
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
					}
				});
				
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById("endAddr").value = addr;
				
				// 클래스 이름 추가
				document.getElementById("form-group2").classList.add("input-not-empty");
				
				// 모달 닫기
				modal.style.display = "none";
				
				// iframe을 넣은 element를 안보이게 한다.
				// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
				element_layer.style.display = 'none';
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




// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
function initLayerPosition(){
    var width = 330; //우편번호서비스가 들어갈 element의 width
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

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}




/* 요금 미리 알아보기 */
$('#sl2').change(function(){
	preChargeFunc();
})
$('#sl1').change(function(){
	preChargeFunc();
})

function preChargeFunc(){
	
	if(startLat == 0){
		alert("출발지 주소 입력해주세요.");
		document.getElementById("slDiv1").classList.remove("input-not-empty");
		$("#sl1").val("").css("color","rgba(255,255,255,0)");
		document.getElementById("slDiv2").classList.remove("input-not-empty");
		$("#sl2").val("").css("color","rgba(255,255,255,0)");
	} else {
		if(endLat == 0){
			alert("도착지 주소 입력해주세요.");
			document.getElementById("slDiv1").classList.remove("input-not-empty");
			$("#sl1").val("").css("color","rgba(255,255,255,0)");
			document.getElementById("slDiv2").classList.remove("input-not-empty");
			$("#sl2").val("").css("color","rgba(255,255,255,0)");
		} else {
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
			console.log("계산 거리 : "+d+" km");
			
			var distanceCharge = 0;
			var carSize = parseInt($("#sl1").val());
			var carOpt = parseInt($("#sl2").val());
			var preCharge = 0;
			var preChargediv = $("#preCharge");
			
			var stAddr = $("#startAddr").val();
			var edAddr = $("#endAddr").val();
			
			if(d < 10){
				distanceCharge=4;
			} else if(d < 20){
				distanceCharge=6;
			} else if(d < 30){
				distanceCharge=7;
			} else if(d < 50) {
				distanceCharge=8;
			}
			
			if(isNaN(carOpt)){
				preChargediv.html(0);
			} else{		
				preCharge = (distanceCharge + carSize + carOpt)*10000;
				preChargediv.html(preCharge.toLocaleString());
			}
			
		}
	}
	
	
	
	
	
}
