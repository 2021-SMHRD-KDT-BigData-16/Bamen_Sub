<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored = "false" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.slf4j.Logger"%>
<%@ page import="org.slf4j.LoggerFactory"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title> 바멘텀 02 main </title>
	<meta charset="UTF-8" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body>

<!-- 
	<img alt="이미지가 없네요" src="./DATA/PostImage/img001.jpg">
 -->
	<img alt="이미지가 없네요" src="./DATA/PostImage/img001.jpg">
 
	<!-- 회원가입 전체 흐름
	
	1. main.jsp -> JoinService.java -> MemberDAO.java 
		-> memberMapper.xml -> OracleDB -> memberMapper.xml
		-> memberDAO.java -> JoinServive.java -> join_success.jsp
	-->


	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header" class="alt"> <a href="index.jsp" class="logo">
			<strong>해품달</strong> <span> 바멘텀 02 </span></a> 
			<nav>
			 	<c:if test="${empty user}">
					<a href="#menu">로그인</a>
				</c:if>

			 	<c:if test="${!empty user}">
					<a href="MyPage.do">개인페이지</a>
					<a href="PublicPage.do">공용페이지</a>
					<a href="update.jsp">개인정보수정</a>
					<a href="Logout.do">로그아웃</a>
				</c:if>
				
			</nav> 
		</header>

		<!-- Menu -->
		<nav id="menu">
		<ul class="links">
			<li><h5>로그인</h5></li>
				<form action="LogIn.do" method="post" >
					<li><input type="text" name="email" placeholder="Email을 입력하세요"></li>
					<li><input type="password" name="pw" placeholder="PW를 입력하세요"></li>
					<li><input type="submit" value="LogIn" class="button fit"></li>
				</form>
		</ul>
		<ul class="actions vertical">
			<li><h5>회원가입</h5></li>
			<form action = "Join.do" method = "post">
				<li><input type="text" name = "email" placeholder="Email을 입력하세요"></li>
				<li><input type="password" name = "pw" placeholder="PW를 입력하세요"></li>
				<li><input type="text" name = "u_name" placeholder="이름을 입력하세요"></li>
				<li><input type="text" name = "profileimg" placeholder="프로필사진 경로를 입력하세요"></li>
				<li><input type="text" name = "profiletext" placeholder="프로필을 입력하세요"></li>
				<li><input type="submit" value="JoinUs" class="button fit"></li>
			</form>
		</ul>
		</nav>
		<!-- Banner -->
		<section id="banner" class="major">
			<div class="inner">
				<header class="major">
					<%
						Logger LOG = LoggerFactory.getLogger(getClass());
						LOG.debug("session getAttribute user : {} ", session.getAttribute("user"));
					%>
					
					<%
						if(session.getAttribute("user") != null) 
						{
					%>
						<h1> ${user.email} 님 환영합니다. </h1>
					<% 
						}else{
					%>
						<h1> 로그인 해주세요. </h1>
					<% 
						}
					%>
				</header>
			</div>
		</section>
		
		<div class="inner">
		
			<section class="split">
				<section>
					<div class="contact-method">
						<span class="icon alt fa-envelope"></span>
						<h3>Email</h3>
						<a href="#"> ${user.email} </a>
						
						<!-- 로그인 한 사용자의 이메일을 출력하시오 -->
					</div>
				</section>
				<section>
					<div class="contact-method">
						<span class="icon alt fa-phone"></span>
						<h3>이름</h3>
						<span> ${user.u_name} </span>
						<!-- 로그인 한 사용자의 전화번호를 출력하시오 -->
					</div>
				</section>
				<section>
					<div class="contact-method">
						<span class="icon alt fa-home"></span>
						<h3>프로필사진</h3>
						<img alt="이미지가 없네요" src=${user.profileimg}>
						
						<span> ${user.profileimg} </span>
						<!-- 로그인 한 사용자의 집주소를 출력하시오 -->
					</div>
				</section>
				<section>
					<div class="contact-method">
						<span class="icon alt fa-home"></span>
						<h3>프로필</h3>
						<span> ${user.profiletext} </span>
						<!-- 로그인 한 사용자의 집주소를 출력하시오 -->
					</div>
				</section>
				
			</section>					
		</div>
		

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

