<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>

<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="AOS - Animate On Scroll library using CSS3">
    <meta name="keywords" content="AOS, animate on scroll, css3 scroll animations, simple scroll animations">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPage/userMyPage.css" />
    <link href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <title>용달이 | 계정 관리</title>
</head>
<body>
	<body>
	<script>
		$(document).ready(function() {
			$("#header1>.jumbotron").css("display","none");
		});
	</script>
	
	<!-- 점보트론 -->
	<div class="jumbotron" id="driverMyPjumbo">
		<div class="container">
			<div class="row">
				<div class="col-xs-9 col-md-9">
					<div class="h2 jal">
						어서오세요 ${loginUser.mName}님!
					</div>
					<br>
					<div class="row">
						<div class="col-xs-6 col-md-6">
							<div class="h4 na">E-mail</div>
							<div class="h3 jal lg mgt">${loginUser.mId}</div>
						</div>
						<div class="col-xs-6 col-md-6">
							<div class="h4 na">연락처</div>
							<div class="h3 jal lg mgt">
								${loginUser.phone}
								<div class="glyphicon glyphicon-pencil hvDr" data-toggle="modal" data-backdrop="static"
									data-target="#changePhone"></div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-md-6">
							<div class="hvDr">
								<span class="na h4" data-toggle="modal" data-backdrop="static" data-target="#changePwd">
									비밀번호 변경</span>
							</div>
						</div>
						<div class="col-xs-6 col-md-6">
							<div class="hvDr">
								<div class="chkBox">
			                        <span class="na h4"id='pushChk'>광고 수신 동의 &nbsp;
			                        <c:choose>
			                        	<c:when test="${loginUser.pushEnabled eq 'Y'}">
			                        		<img src="${contextPath}/resources/images/login&signUp/checked-circle.png" alt="동의" id="chkPolicy">
			                        	</c:when>
			                        	<c:otherwise>
			                        		<img src="${contextPath}/resources/images/login&signUp/unchecked-circle.png" alt="비동의" id="chkPolicy">
			                        	</c:otherwise>
			                        </c:choose>
			                        
			                        </span>
			                    </div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-3 col-md-3">
					<div class="img-circle text-center align-middle" id="pro_img"
						style="background-color: rgb(87, 187, 138);"><span class="jal" style="font-size: 3em; line-height:4em; color:white; font-weight: 600;"> ${loginUser.mName}
					</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 세미바 -->
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-md-12 h3">
				<a href="addrBook.myp"><span class="semibar_span">주소록</span></a>
				<a href="myRSV.myp"><span class="semibar_span">예약내역</span></a>
			</div>
		</div>
	</div>
</body>
		<!-- 사진 변경 -->
	<div class="modal fade" id="changePhoto" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<div class="row noto center-block"
						style="text-align: left; border: 1px solid #dedede; border-radius: 16px; padding: 15px; background: #fff; width: 100%; max-width: 560px;">
						<div class="col-md-12 fw6"
							style="padding: 0; font-size: 20px; line-height: 29px; font-weight: 300;">
							프로필사진 변경
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="col-md-12"
							style="padding: 0; margin-top: 16px; font-size: 13px; line-height: 24px;">
							변경할 이미지파일을 첨부해 주세요</div>
						<div class="col-md-12" style="padding: 0; margin-top: 10px;">
							<label for="nowPassword" style="display: none;"></label> <input
								type="file" class="form-control" id="newImg"
								style="width: 100%; height: 46px;"">
						</div>
						<div class="col-md-12 text-center" style="margin-top: 23px;">
							<button type="button" class="btn btn-sm" style="color: gray;"
								data-dismiss="modal">취소</button>
							&nbsp; &nbsp;
							<button type="submit" class="btn btn-sm btn_ydl"
								data-dismiss="modal">수정하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 핸드폰 번호 수정 모달 -->
	<div class="modal fade" id="changePhone" role="dialog">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-body">
					<form id="updatePhone">
						<div class="row noto center-block text-left"
							style="border: 1px solid #dedede; border-radius: 16px; padding: 15px; background: #fff; width: 100%; max-width: 560px;">
							<div class="col-md-12 fw6"
								style="padding: 0; font-size: 20px; line-height: 29px; font-weight: 300;">
								전화번호 변경
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>
							<div class="col-md-12"
								style="padding: 0; margin-top: 16px; font-size: 13px; line-height: 24px;">
								새로운 번호를 입력해주세요.</div>
						<div class="col-md-12" style="padding: 0; margin-top: 10px;">
							<input type="text" class="form-control" id="newPhoneNum"
								name="uPhone" style="width: 100%; height: 46px;" maxlength="13"
								placeholder="${ loginUser.phone }"
								onkeyup="inputPhoneNumber(this);">
						</div>
						<div class="col-md-12 text-center" style="margin-top: 23px;">
								<button type="reset" class="btn btn-sm" style="color: gray;"
									data-dismiss="modal">취소</button>
								&nbsp; &nbsp;
								<button type="submit" class="btn btn-sm btn_ydl"
									data-dismiss="modal" id="nPhoneBtn">수정하기</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	
	var checked = '/yongdali/resources/images/login&signUp/checked-circle.png';
    var unchecked = '/yongdali/resources/images/login&signUp/unchecked-circle.png';
    
	 $('#pushChk').click(function(){  
		 	if($('#chkPolicy').attr('src') == unchecked) {
		 		var agree = conrfirm('광고수신 동')
	            $('#chkPolicy').attr('src',checked).attr('checked',true);
	            $('input[name=pushEnabled]').val('Y') ;
	            
	        } else{
	            $('#chkPolicy').attr('src',unchecked).attr('checked',false);
	            $('input[name=pushEnabled]').val('N');
	        }
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
	
		$("#nPhoneBtn").on("click",function(){
			$("#updatePhone").attr("action","uPhone.myp").submit();
		});
	</script>
	
	<!-- 비밀번호 변경 모달 -->
	<div class="modal fade" id="changePwd" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<br>
				<div class="modal-body noto">
					<div class="row"
						style="text-align: left; margin: 0; border: 1px solid #dedede; border-radius: 16px; padding: 23px; background: #fff; width: 100%; max-width: 560px;">
						<div class="col-md-12 fw6"
							style="padding: 0; font-size: 20px; line-height: 29px; font-weight: 300;">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							비밀번호 변경
						</div>
						<div class="col-md-12"
							style="padding: 0; margin-top: 16px; font-size: 16px; line-height: 24px;">
							기존 비밀번호</div>
						<div class="col-md-12" style="padding: 0; margin-top: 10px;">
							<label for="nowPassword" style="display: none;"></label> <input
								type="password" class="form-control noto" id="nowPassword"
								style="width: 100%; height: 46px;">
						</div>
						<div class="col-md-12"
							style="padding: 0; margin-top: 15px; font-size: 16px; line-height: 24px;">
							새 비밀번호</div>
						<div class="col-md-12"
							style="padding: 0; margin-top: 5px; font-size: 14px; color: #525252; line-height: 20px;">
							8~16자 영문 대 소문자, 숫자, 특수문자(#?!@$%^&*)를 사용하세요.</div>
						<div class="col-md-12" style="padding: 0; margin-top: 10px;">
							<label for="newPassword" style="display: none;"></label> <input
								type="password" class="form-control noto" id="newPassword"
								style="width: 100%; height: 46px; color: #525252;">
						</div>
						<div class="col-md-12"
							style="padding: 0; margin-top: 15px; font-size: 16px; line-height: 24px;">
							새 비밀번호 확인</div>
						<div class="col-md-12" style="padding: 0; margin-top: 10px;">
							<label for="newPasswordCheck" style="display: none;"></label> <input
								type="password" class="form-control noto" id="newPasswordCheck"
								style="width: 100%; height: 46px; color: #525252;">
						</div>
						<div class="col-sm-12" id="pwCheckText"
							style="padding: 0; margin-top: 5px; display: none;"></div>
						<div class="col-md-12 text-right">
							<button type="button" class="btn btn-lg"
								data-dismiss="modal"
								style="margin: 20px 10px 0px 10px; color: gray;">취소</button>
							<button type="submit" class="btn btn-lg btn_ydl"
								data-dismiss="modal" style="margin: 20px 10px 0px 10px;">수정하기</button>
						</div>
					</div>
				</div>
				<br>
			</div>
		</div>
	</div>


</html>