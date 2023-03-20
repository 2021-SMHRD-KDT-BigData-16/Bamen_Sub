<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored = "false" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.slf4j.Logger"%>
<%@ page import="org.slf4j.LoggerFactory"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title> 바멘텀 01 main </title>
	<meta charset="UTF-8" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body>

<!-- 
	<img alt="이미지가 없네요" src="./DATA/PostImage/img001.jpg">
 -->
 
	<!-- 회원가입 전체 흐름
	
	1. main.jsp -> JoinService.java -> MemberDAO.java 
		-> memberMapper.xml -> OracleDB -> memberMapper.xml
		-> memberDAO.java -> JoinServive.java -> join_success.jsp
	-->


	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header" class="alt"> <a href="index.jsp" class="logo">
			<strong>해품달</strong> <span> 바멘텀 01 </span></a> 
			<nav>
				<a href="#menu">로그인</a> <!-- 로그인 후 Logout.jsp로 이동할 수 있는'로그아웃'링크와 '개인정보수정'링크를 출력하시오. -->
			</nav> 
		</header>

		<!-- Menu -->
		<nav id="menu">
		<ul class="links">
			<li><h5>로그인</h5></li>
			<form>
				<li><input type="text" placeholder="Email을 입력하세요"></li>
				<li><input type="password" placeholder="PW를 입력하세요"></li>
				<li><input type="submit" value="LogIn" class="button fit"></li>
			</form>
		</ul>
		<ul class="actions vertical">
			<li><h5>회원가입</h5></li>
			<form action = "JoinService" method = "post">
				<li><input type="text" name = "email" placeholder="Email을 입력하세요"></li>
				<li><input type="password" name = "pw" placeholder="PW를 입력하세요"></li>
				<li><input type="text" name = "tel" placeholder="전화번호를 입력하세요"></li>
				<li><input type="text" name = "address" placeholder="집주소를 입력하세요"></li>
				<li><input type="submit" value="JoinUs" class="button fit"></li>
			</form>
		</ul>
		</nav>
		<!-- Banner -->
		<section id="banner" class="major">
		<div class="inner">
			<header class="major">
				<h1>로그인 한 세션아이디를 출력해주세요</h1>
				<%
					Logger LOG = LoggerFactory.getLogger(getClass());
					//LOG.debug("email : {}, pw : {}, tel : {}, add : {} ");
					LOG.debug("session getAttribute user : {} ", session.getAttribute("user"));
				
					if(session.getAttribute("user") != null) 
					{
						
					} else {
						
					}
				%>
				
				<!-- 로그인 후 로그인 한 사용자의 세션아이디로 바꾸시오.
										 ex)smart님 환영합니다 --> 
			</header>
		</div>
		</section>

	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>

</body>
</html>

