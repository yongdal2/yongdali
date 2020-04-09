<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <link rel="stylesheet" href="${contextPath }/resources/css/admin/Admin_Chat.css">
</head>
<body>
    <div class="container">
      <div class="row">
        <nav class="menu">
          <ul class="items">
            <li class="item">
              <img src="${contextPath}/resources/images/ydl_logo/ydl_ic_gr(70X70).png" style="width:50px; height:50px;">
            </li>
            <li class="item">
                <svg class="bi bi-chat-dots" width="44px" height="44px" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="color:rgb(87, 187, 138)">
                    <path fill-rule="evenodd" d="M2.678 11.894a1 1 0 01.287.801 10.97 10.97 0 01-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 01.71-.074A8.06 8.06 0 008 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 01-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 00.244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 01-2.347-.306c-.52.263-1.639.742-3.468 1.105z" clip-rule="evenodd"/>
                    <path d="M5 8a1 1 0 11-2 0 1 1 0 012 0zm4 0a1 1 0 11-2 0 1 1 0 012 0zm4 0a1 1 0 11-2 0 1 1 0 012 0z"/>
                  </svg>
            </li>

          </ul>
        </nav>
  
        <section class="discussions">
          <div class="discussion search">
            <div class="searchbar">
              <svg class="bi bi-search" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M10.442 10.442a1 1 0 011.415 0l3.85 3.85a1 1 0 01-1.414 1.415l-3.85-3.85a1 1 0 010-1.415z" clip-rule="evenodd"/>
                <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 100-11 5.5 5.5 0 000 11zM13 6.5a6.5 6.5 0 11-13 0 6.5 6.5 0 0113 0z" clip-rule="evenodd"/>
              </svg>
              <input type="text" placeholder="Search..."></input>
            </div>
          </div>
          <div class="discussion message-active">
            <div class="photo" style="background-image: url(https://image.noelshack.com/fichiers/2017/38/2/1505775062-1505606859-portrait-1961529-960-720.jpg);">
              <div class="online"></div>
            </div>
            <div class="desc-contact">
              <p class="name">유승제</p>
              <!-- 마지막 메시지 -->
              <p class="message">마지막 메시지</p>
            </div>
          </div>
  
          <div class="discussion">
            <div class="photo" style="background-image: url(http://e0.365dm.com/16/08/16-9/20/theirry-henry-sky-sports-pundit_3766131.jpg?20161212144602);">
              <div class="online"></div>
            </div>
            <div class="desc-contact">
                <p class="name">유승제</p>
                <p class="message">어쩌고 저쩌고 저쩌고</p>
            </div>
          </div>
  
          <div class="discussion">
            <div class="photo" style="background-image: url(https://tinyclipart.com/resource/man/man-5.jpg);">
            </div>
            <div class="desc-contact">
                <p class="name">유승제</p>
                <p class="message">어쩌고 저쩌고 저쩌고</p>
            </div>
          </div>
  
          <div class="discussion">
            <div class="photo" style="background-image: url(http://thomasdaubenton.xyz/portfolio/images/photo.jpg);">
              <div class="online"></div>
            </div>
            <div class="desc-contact">
                <p class="name">유승제</p>
                <p class="message">어쩌고 저쩌고 저쩌고</p>
            </div>
          </div>
  
          <div class="discussion">
            <div class="photo" style="background-image: url(http://www.boutique-uns.com/uns/185-home_01grid/polo-femme.jpg);">
            </div>
            <div class="desc-contact">
                <p class="name">유승제</p>
                <p class="message">어쩌고 저쩌고 저쩌고</p>
            </div>
          </div>
  
          <div class="discussion">
            <div class="photo" style="background-image: url(https://images.pexels.com/photos/979602/pexels-photo-979602.jpeg?auto=compress&cs=tinysrgb&h=350);">
            </div>
            <div class="desc-contact">
                <p class="name">유승제</p>
                <p class="message">어쩌고 저쩌고 저쩌고</p>
            </div>
          </div>
  
          <div class="discussion">
            <div class="photo" style="background-image: url(http://static.jbcgroup.com/news/pictures/cc70ae498569ecc11eaeff09224d4ba5.jpg);">
              <div class="online"></div>
            </div>
            <div class="desc-contact">
                <p class="name">유승제</p>
                <p class="message">어쩌고 저쩌고 저쩌고</p>
            </div>
          </div>
        </section>

        <section class="chat">
          <div class="header-chat">
            <img src="${contextPath }/resources/images/ydl_logo/ydl_ic_gr(70X70).png" style="width:50px; height:50px;">
            <p class="name">유승제</p>
          </div>
          <div class="messages-chat">
            <div class="message">
              <div class="photo" style="background-image: url(https://image.noelshack.com/fichiers/2017/38/2/1505775062-1505606859-portrait-1961529-960-720.jpg);">
                <div class="online"></div>
              </div>
              <p class="text"> 안녕하세요 </p>
            </div>
            <p class="time"> 14:58PM Today</p>
            <div class="message text-only">
              <div class="response">
                <p class="text"> 용달이입니다.</p>
              </div>
            </div>
            <p class="response-time time"> 15:04PM Today</p>
            <div class="message">
              <div class="photo" style="background-image: url(https://image.noelshack.com/fichiers/2017/38/2/1505775062-1505606859-portrait-1961529-960-720.jpg);">
                <div class="online"></div>
              </div>
              <p class="text"> 마지막 메시지</p>
            </div>
            <p class="time"> 15:09PM Today</p>
          </div>
          <div class="footer-chat">
            <input type="text" class="write-message" placeholder="Type your message here"></input>
            <button class="sendBtn" type="submit">
              <svg class="bi bi-cursor" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M14.082 2.182a.5.5 0 01.103.557L8.528 15.467a.5.5 0 01-.917-.007L5.57 10.694.803 8.652a.5.5 0 01-.006-.916l12.728-5.657a.5.5 0 01.556.103zM2.25 8.184l3.897 1.67a.5.5 0 01.262.263l1.67 3.897L12.743 3.52 2.25 8.184z" clip-rule="evenodd"/>
              </svg>
            </button>
            
          </div>
        </section>
      </div>
    </div>
  </body>
</html>