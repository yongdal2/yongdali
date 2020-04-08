<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div style="display: flex; margin-left: 400px; margin-top:300px">
        <div OnClick="location.href ='uNoticeMain.no'" style="width: 100px; height: 100px; background: lightcoral; cursor: pointer; border-radius: 10px; margin-right: 20px;">
              고객센터 메인페이지(공지사항)
        </div>
        <div OnClick="location.href ='uFaqView.fa'" style="width: 100px; height: 100px; background: lightblue; cursor: pointer; border-radius: 10px; margin-right: 20px;">
              자주묻는질문
        </div>
        <div OnClick="location.href ='dNoticeMain.no'" style="width: 100px; height: 100px; background: lightpink; cursor: pointer; border-radius: 10px; margin-right: 20px;">
              고객센터 드라이버 메인페이지(공지사항)
        </div>
    </div>
    
</body>
</html>