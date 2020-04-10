<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>용달이 | 예약하기</title>
    <!-- CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"/>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/paying.css"/>
    
</head>
<body style="background: rgb(87,187,138); font-family: 'yg-jalnan';">
	<div class="spinner11">
	    <div class="double-bounce11 bounce11"><span class="bounce-span">뜰까?</span></div>
	    <div class="double-bounce22 bounce11"><span class="bounce-span">뜬다!</span></div>
	</div>
	
	<script>
<%--     $(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp43236861'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        var payYN = "N";
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '<%=title%>',
            amount : <%=totalPrice%>,
            buyer_email : '<%=email%>',
            buyer_name : '<%=name%>',
            buyer_tel : '<%=phone%>'
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if ( rsp.success ) {
                var msg = '결제가 완료되었습니다.';
                payYN = "Y";
            } else {
                var msg = '결제에 실패하였습니다.';
            }
            alert(msg);
            location.href='/zzzzzzzzzzz/paySuccess?payYN='+payYN;
        });
    }); --%>
	</script>
</body>
</html>