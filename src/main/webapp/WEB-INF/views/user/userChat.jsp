<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- font 잘난체 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <!-- JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
	type="text/javascript"></script>
    <!-- CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <link rel="stylesheet" href="${contextPath}/resources/css/User_Chat.css">

</head>
<body>
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <div class="userInfo">
                <img src="${contextPath }/resources/images/ydl_logo/ydl_ic_gr(70X70).png" alt="">
                <div>
                    <h2>용달이</h2>
                    <h3>Live Chat</h3>
                </div>
            </div>
        </div>
    </nav>
    <div class="contentArea container-fluid">
        <div class="row">
            <div class="chat col-xs-12">
                <ul id="chat">
                    <li class="you">
                        <div class="entete">
                            <span class="status green"></span>
                            <h2>용달이</h2>
                            <h3>10:12AM, Today</h3>
                        </div>
                        <div class="message">
                            안녕하세요 용달이입니다. 무엇을 도와드릴까요?
                        </div>
                    </li>
                    <li class="me">
                        <div class="entete">
                            <h3>10:12AM, Today</h3>
                            <h2>유승제</h2>
                            <span class="status blue"></span>
                        </div>
                        <div class="message">
                            예약 어떻게 하나요?
                        </div>
                    </li>
                    <li class="you">
                        <div class="entete">
                            <span class="status green"></span>
                            <h2>용달이</h2>
                            <h3>10:12AM, Today</h3>
                        </div>
                        <div class="message">
                            자세한 내용은 '이용안내'를 참고 부탁드립니다.
                        </div>
                    </li>
                    <li class="me">
                        <div class="entete">
                            <h3>10:12AM, Today</h3>
                            <h2>유승제</h2>
                            <span class="status blue"></span>
                        </div>
                        <div class="message">
                            감사합니다.
                        </div>
                    </li>
                    <li class="you">
                        <div class="entete">
                            <span class="status green"></span>
                            <h2>용달이</h2>
                            <h3>10:12AM, Today</h3>
                        </div>
                        <div class="message">
                            즐거운 하루 되세염
                        </div>
                    </li>
                    <li class="me">
                        <div class="entete">
                            <h3>10:12AM, Today</h3>
                            <h2>유승제</h2>
                            <span class="status blue"></span>
                        </div>
                        <div class="message">
                            ㅂㅂ
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <form action="">
        <div class="container">
            <div class="footer row">
                <div class="col-xs-10 col-lg-11">
                    <textarea placeholder="궁금하신 점이 무엇인가요?"></textarea>
                </div>
                <div class="col-xs-2 col-lg-1">
                    <button class="sendBtn" type="submit"><img src="${contextPath }/resources/images/chat/send.png"></button>
                </div>
            </div>
        </div>
    </form>
</body>
</html>