//
//// #adAdr_postcode 배송지 추가 우편번호
//// #adAdr_address 배송지 추가 주소
//// #adAdr_detail 배송지 추가 상세주소
//
//// #edAdr_postcode 배송지 수정 우편번호
//// #edAdr_address 배송지 수정 주소
//// #edAdr_detail 배송지 수정 상세주소
//
//// #adSearchAddr 배송지 추가 검색 모달
//
//// #edSearchAddr 배송지 수정 검색 모달
//
////data-toggle="modal" data-target="#addrEdit"

// 모달 배경화면 생성

$(document).ready(function() {
	$("#header1>.jumbotron").css("display","none");
});

var modalAd = document.getElementById("modalAd");
var modalEd = document.getElementById("modalEd");

// 우편번호 찾기 화면을 넣을 element
var element_layerAd = document.getElementById('layerAd');
var element_layerEd = document.getElementById('layerEd');

function closeDaumPostcodeAd() {
	// iframe을 넣은 element를 안보이게 한다.
	element_layerAd.style.display = 'none';
	modalAd.style.display = 'none';
	
}

function closeDaumPostcodeEd() {
	// iframe을 넣은 element를 안보이게 한다.
	element_layerEd.style.display = 'none';
	modalEd.style.display = 'none';
}

function adSearchAddr(){
	//모달 실행
	modalAd.style.display = "block";
	
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
             
             // 서울 지역 조건
             if(!addr.includes("서울")){
            	 alert("죄송합니다. 서울지역 한해서만 운영 가능합니다. 다시 입력해주세요.");
            	 modalAd.style.display = "none";
             }else{
            	 // 우편번호와 주소 정보를 해당 필드에 넣는다.
            	 document.getElementById("adAdr_address").value = addr;
            	 
            	// 모달 닫기
 				modalAd.style.display = "none";
 				
 				
            	 // 커서를 상세주소 필드로 이동한다.
            	 document.getElementById("adAdr_detail").focus();

            	 // iframe을 넣은 element를 안보이게 한다.
            	 // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
            	 element_layerAd.style.display = 'none';
             } 
         },
         width : '100%',
         height : '100%',
         maxSuggestItems : 5
     }).embed(element_layerAd);

     // iframe을 넣은 element를 보이게 한다.
     element_layerAd.style.display = 'block';

     // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
     initLayerPositionAd();
}

function edSearchAddr(){
	//모달 실행
	modalEd.style.display = "block";
	
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
			
			// 서울 지역 조건
			if(!addr.includes("서울")){
				alert("죄송합니다. 서울지역 한해서만 운영 가능합니다. 다시 입력해주세요.");
				modalEd.style.display = "none";
			}else{
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById("edAdr_address").value = addr;
				
				// 모달 닫기
				modalEd.style.display = "none";
				
				
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("edAdr_detail").focus();
				
				// iframe을 넣은 element를 안보이게 한다.
				// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
				element_layerEd.style.display = 'none';
			} 
		},
		width : '100%',
		height : '100%',
		maxSuggestItems : 5
	}).embed(element_layerEd);
	
	// iframe을 넣은 element를 보이게 한다.
	element_layerEd.style.display = 'block';
	
	// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
	initLayerPositionEd();
}

// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
function initLayerPositionAd(){
    var width = 400; //우편번호서비스가 들어갈 element의 width
    var height = 500; //우편번호서비스가 들어갈 element의 height
    var borderWidth = 5; //샘플에서 사용하는 border의 두께

    // 위에서 선언한 값들을 실제 element에 넣는다.
    element_layerAd.style.width = width + 'px';
    element_layerAd.style.height = height + 'px';
    element_layerAd.style.border = borderWidth + 'px solid';
    
    // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
    element_layerAd.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
    element_layerAd.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
}

function initLayerPositionEd(){
    var width = 400; //우편번호서비스가 들어갈 element의 width
    var height = 500; //우편번호서비스가 들어갈 element의 height
    var borderWidth = 5; //샘플에서 사용하는 border의 두께

    // 위에서 선언한 값들을 실제 element에 넣는다.
    element_layerEd.style.width = width + 'px';
    element_layerEd.style.height = height + 'px';
    element_layerEd.style.border = borderWidth + 'px solid';
    
    // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
    element_layerEd.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
    element_layerEd.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
}


//폰번호 숫자만 입력 & 하이픈(-)기호 자동 삽입
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





