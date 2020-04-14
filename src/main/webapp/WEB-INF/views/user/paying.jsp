<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>용달이 | 예약하기</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body style=" background: rgb(87,187,138);">

<form id="payForm" action="pay.do" method="post">
	<input name="capacity1" type="hidden" value="${capacity1}">
	<input name="type" type="hidden" value="${r.type}">
	<input name="startAddr" type="hidden" value="${r.startAddr}">
	<input name="endAddr" type="hidden" value="${r.endAddr}">
	<input name="distance" type="hidden" value="${r.distance}">
	<input name="startName" type="hidden" value="${r.startName}">
	<input name="endName" type="hidden" value="${r.endName}">
	<input name="startPhone" type="hidden" value="${r.startPhone}">
	<input name="endPhone" type="hidden" value="${r.endPhone}">
	<input name="rightLoad" type="hidden" value="${r.rightLoad}">
	<input name="rightUnload" type="hidden" value="${r.rightUnload}">
	<input name="startDate1" type="hidden" value="${stDate}">
	<input name="startTime" type="hidden" value="${r.startTime}">
	<input name="endDate1" type="hidden" value="${edDate}">
	<input name="endTime" type="hidden" value="${r.endTime}">
	<input name="helpLoad" type="hidden" value="${r.helpLoad}">
	<input name="helpUnload" type="hidden" value="${r.helpUnload}">
	<input name="luggage" type="hidden" value="${r.luggage}">
	<input name="msg" type="hidden" value="${r.msg}">
	<input id="amt" name="amount" type="hidden" value="${r.amount}">
	<input id="payYN" name="payYN" type="hidden">
</form>
	
	<script>
     $(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp43236861'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        var payYN="N";
        var amount = parseInt($('#amt').val());
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '예약페이지',
            amount : amount
        }, function(rsp) {
            if ( rsp.success ) {
                var msg = '결제가 완료되었습니다.';
                payYN="Y";
            } else {
                var msg = '결제에 실패하였습니다.';
            }
            $('#payYN').val(payYN);
            alert(msg);
            $('#payForm').submit();
        });
    });
	</script>
</body>
</html>