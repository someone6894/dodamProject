<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>네이버 로그인</title>
<meta charset="UTF-8">
</head>
<body>





	<%
	String clientId = "AduTCD8bUxGEHPze8Xdy";//애플리케이션 클라이언트 아이디값";
	String redirectURI = URLEncoder.encode("http://www.dodam.com/login", "UTF-8");
	SecureRandom random = new SecureRandom();
	String state = new BigInteger(130, random).toString();
	String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	apiURL += "&amp;client_id=" + clientId;
	apiURL += "&amp;redirect_uri=" + redirectURI;
	apiURL += "&amp;state=" + state;
	session.setAttribute("state", state);
	%>
	<a href="<%=apiURL%>"><img height="50"
		src="http://static.nid.naver.com/oauth/small_g_in.PNG" /></a>


</body>
</html>