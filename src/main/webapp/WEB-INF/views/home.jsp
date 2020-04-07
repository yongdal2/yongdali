<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>

    <div style="display: flex; margin-left: 400px; margin-top:300px">
        <div OnClick="location.href ='pjy.ydl'" style="width: 100px; height: 100px; background: lightcoral; cursor: pointer; border-radius: 10px; margin-right: 20px;">
            박정연
        </div>
        <div OnClick="location.href ='ssh.ydl'" style="width: 100px; height: 100px; background: lightblue; cursor: pointer; border-radius: 10px; margin-right: 20px;">
            손신혜
        </div>
        <div OnClick="location.href ='njh.ydl'" style="width: 100px; height: 100px; background: lightpink; cursor: pointer; border-radius: 10px; margin-right: 20px;">
            남지훈
        </div>
        <div OnClick="location.href ='cjy.ydl'" style="width: 100px; height: 100px; background: green; cursor: pointer; border-radius: 10px; margin-right: 20px; color: white;">
            최진영
        </div>
        <div OnClick="location.href ='lth.ydl'" style="width: 100px; height: 100px; background: lightslategrey; cursor: pointer; border-radius: 10px; margin-right: 20px; color: white;">
            이탐희
        </div>
        <div OnClick="location.href ='jwt.ydl'" style="width: 100px; height: 100px; background: lightgreen; cursor: pointer; border-radius: 10px; margin-right: 20px;">
            장원태
        </div>
<!--         <div OnClick="location.href ='error.ydl'" style="width: 100px; height: 100px; background: lightgreen; cursor: pointer; border-radius: 10px; margin-right: 20px;">
            에러페이지
        </div> -->
    </div>
</body>
</html>
