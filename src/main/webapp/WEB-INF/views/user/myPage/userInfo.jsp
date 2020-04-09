<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

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
	<c:import url="../../common/nav.jsp"/>
<body>
	<div class="container">
		<div class="row">
			<div class="h2 jal">
				계정 관리
				<hr>
			</div>
			<div class="row na">
                <div class="col-xs-1 col-md-3"></div>
				<div class="col-xs-10 col-md-6"
					style="margin: 0; border: 1px solid #dedede; border-radius: 16px; padding: 23px; background: #fff;">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="panel-title" style="padding-left: 10px;">
								<div class="h2" style="color: gray;">
									<span class="glyphicon glyphicon-user"
										style="text-align: right;"></span> &nbsp;회원 정보 <a href="#">
									</a>
								</div>
							</div>
						</div>
						<div class="panel-body" style="padding-left: 30px;">
							<p class="h4">
								E-mail
								<br>
								<span class="h2">solg@gma.com</span>
							</p>
							<hr>
							<p class="h4">
								이름
								<br>
								<span class="h2">도로리</span>
							</p>
							<hr>
							<p class="h4">
								연락처
								<br>
								<span class="h2">010-1111-1111
									<button class="btn glyphicon glyphicon-pencil bgNo"
										data-toggle="modal" data-target="#changePhone"></button>
								</span>
							</p>
							<hr>
                            <div class="row text-center" style="padding-left: -30px;">
                                <button type="button" class="btn btn-lg btn-default"
                                    data-toggle="modal" data-target="#changePwd">비밀번호 변경</button>
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
						<div class="row noto"
							style="text-align: left; margin: 0; border: 1px solid #dedede; border-radius: 16px; padding: 15px; background: #fff; width: 100%; max-width: 560px;">
							<div class="col-md-12 fw6"
								style="padding: 0; font-size: 20px; line-height: 29px; font-weight: 300;">
								전화번호 변경 <button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>
							<div class="col-md-12"
								style="padding: 0; margin-top: 16px; font-size: 13px; line-height: 24px;">
								'-' 를 제외한 번호를 입력해주세요.</div>
							<div class="col-md-12" style="padding: 0; margin-top: 10px;">
								<label for="nowPassword" style="display: none;"></label> <input
									type="tel" class="form-control" id="newPhoneNum"
									style="width: 100%; height: 46px;" maxlength="11" placeholder="01012345678">
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
								8~16자 이내의 영문, 숫자, 기호를 포함한 문자열</div>
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
								<button type="button" button type="button" class="btn btn-lg"
									data-dismiss="modal" style="margin: 20px 10px 0px 10px; color: gray;">취소</button>
								<button type="submit" class="btn btn-lg btn_ydl"
									data-dismiss="modal" style="margin: 20px 10px 0px 10px;">수정하기</button>
							</div>
						</div>
					</div>
					<br>
				</div>
			</div>
		</div>
	</div>
</body>

	<c:import url="../../common/footer.jsp"/>

</html>