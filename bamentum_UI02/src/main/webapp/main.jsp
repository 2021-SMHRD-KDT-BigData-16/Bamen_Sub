<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="description" content="text/html">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title  -->
<title>바멘텀</title>

<!-- Favicon  -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Core Style CSS -->
<link rel="stylesheet" href="css/core-style.css">
<link rel="stylesheet" href="style.css">

<!-- Responsive CSS -->
<link href="css/responsive.css" rel="stylesheet">

</head>

<body>
	<!-- Preloader -->
	<div id="preloader">
		<div class="showbox">
			<div class="loader">
				<svg class="circular" viewBox="25 25 50 50">
                    <circle class="path" cx="50" cy="50" r="20"
						fill="none" stroke-width="2" stroke-miterlimit="10" />
                </svg>
			</div>
		</div>
		<div class="questions-area text-center">
			<p>Did you know?</p>
			<ul>
				<li>The largest photography competition is 353,768 entries.</li>
				<li>Photography is the toughest profession in the world.</li>
				<li>The world’s largest photo album by dimensions was 13 ft
					11.5 in x 17 ft.</li>
				<li>The world’s largest photo mosaic featured 176,175 pictures.</li>
				<li>The world’s largest camera lens was a 5200mm lens attached
					to a canon.</li>
			</ul>
		</div>
	</div>

	<!-- Gradient Background Overlay -->
	<div class="gradient-background-overlay"></div>

	<!-- Header Area Start -->
	<header class="header-area bg-img"
		style="background-image: url(img/core-img/banner.jpg);">
		<div class="container-fluid h-100">
			<div class="row h-100 align-items-center">
				<div class="col-12 h-20">
					<div class="main-menu h-100">
						<nav class="navbar h-100 navbar-expand-lg">
							<!-- Logo Area  -->
							<a class="navbar-brand" href="index.html"><img
								src="img/core-img/bamentum.png" alt="Logo" width="100px"></a>

							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#studioMenu"
								aria-controls="studioMenu" aria-expanded="false"
								aria-label="Toggle navigation">
								<i class="fa fa-bars"></i> Menu
							</button>

							<div class="collapse navbar-collapse" id="studioMenu">
								<!-- Menu Area Start  -->
								<ul class="navbar-nav ml-auto">
									<li class="nav-item active"><a class="nav-link"
										href="index.html">메인홈<span class="sr-only">(current)</span></a>
									</li>
									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
										role="button" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">게시판</a>
										<div class="dropdown-menu" aria-labelledby="navbarDropdown">
											<a class="dropdown-item" href="index.html">자유게시판</a> <a
												class="dropdown-item" href="about-me.html">분실신고</a> <a
												class="dropdown-item" href="portfolio.html">추천명소</a> <a
												class="dropdown-item" href="blog.html">대리점정보</a> <a
												class="dropdown-item" href="contact.html">수리예약</a> <a
												class="dropdown-item" href="elements.html">이러쿵저러쿵</a>
										</div></li>
									<li class="nav-item"><a class="nav-link"
										href="about-me.html">위치조회</a></li>
									<li class="nav-item"><a class="nav-link"
										href="portfolio.html">내피드보기</a></li>
									<li class="nav-item"><a class="nav-link" href="blog.html">차대번호등록</a>
									</li>
									<li class="nav-item"><a class="nav-link"
										href="contact.html">회원정보</a></li>
								</ul>
								<!-- Search Form -->
								<div class="header-search-form ml-auto">
									<form action="#">
										<input type="search" class="form-control"
											placeholder="Input your keyword then press enter..."
											id="search" name="search"> <input class="d-none"
											type="submit" value="submit">
									</form>
								</div>
								<!-- Search btn -->
								<div id="searchbtn">
									<img src="img/core-img/search.png" alt="">
								</div>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- Header Area End -->

	<!-- Social Sidebar Area Start -->
	<div class="social-sidebar-area">
		<!-- Social Area -->
		<div class="social-info-area">
			<a href="#" data-toggle="tooltip" data-placement="right"
				title="Facebook"><i class="fa fa-facebook" aria-hidden="true"></i>
				<span>The sun</span></a> <a href="#" data-toggle="tooltip"
				data-placement="right" title="Twitter"><i class="fa fa-twitter"
				aria-hidden="true"></i> <span>covers</span></a> <a href="#"
				data-toggle="tooltip" data-placement="right" title="Pinterest"><i
				class="fa fa-pinterest" aria-hidden="true"></i> <span> The
					moon</span></a> <a href="#" data-toggle="tooltip" data-placement="right"
				title="Behance"><i class="fa fa-behance" aria-hidden="true"></i>
				<span>haha</span></a>
		</div>
	</div>
	<!-- Social Sidebar Area End -->

	<!-- Project Area Start -->
	<div class="gallery_area clearfix">
		<div class="container-fluid clearfix" align="center">
			<!-- Menu -->
			<div class="menu">
				<ul class="login">
					<li>
						<h5>로그인</h5>
					</li>
					<form action="LogInService" method="post">
						<li><input type="text" name="email" placeholder="Id를 입력하세요"></li>
						<li><input type="password" name="pw" placeholder="pw를 입력하세요"></li>
						<li><input type="submit" value="login" class="button fit"></li>
					</form>
				</ul>
				<br>
				<ul class="join">
					<li>
						<h5>회원가입</h5>
					</li>
					<form action="JoinService" method="post">
						<li><input type="text" name="email" placeholder="id를 입력하세요"></li>
						<li><input type="password" name="pw" placeholder="PW를 입력하세요"></li>
						<li><input type="text" name="binum" placeholder="차대번호를 입력하세요"></li>
						<li><input type="text" name="tel" placeholder="전화번호를 입력하세요"></li>
						<li><input type="submit" value="JoinUs" class="button fit"></li>
					</form>
				</ul>
			</div>
		</div>
	</div>
	<!-- Project Area End -->
	<section id="banner" class="major">
		<div class="inner">
			<header class="major">
				<%
				if (session.getAttribute("user") != null) {
				%>
				<h1>${user.email} 님 환영합니다.</h1>
				<%
				} else {
				%>				
				<%
				}
				%>
			</header>
		</div>
	</section>
	<!-- Footer Area Start -->
	<footer class="footer-area">
		<div class="container-fluid h-100">
			<div class="row h-100">
				<div class="col-12 h-100">
					<div
						class="footer-content h-100 d-md-flex align-items-center justify-content-between">
						<!-- Single Footer Content -->
						<div class="single-footer-content">
							<img src="img/core-img/map.png" alt=""> <a href="#">광주
								남구 송암로 80</a>
						</div>
						<!-- Single Footer Content -->
						<div class="single-footer-content">
							<img src="img/core-img/smartphone.png" alt=""> <a href="#">The
								momentum of your bicycle</a>
						</div>
						<!-- Single Footer Content -->
						<div class="single-footer-content">
							<img src="img/core-img/envelope-2.png" alt=""> <a href="#">해를품은
								달</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Area End -->

	<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
	<p>
		해품달 &copy;
		<script>
			document.write(new Date().getFullYear());
		</script>
		The moment of your bicycle
		<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->

		<!-- jQuery (Necessary for All JavaScript Plugins) -->
		<script src="js/jquery/jquery-2.2.4.min.js"></script>
		<!-- Popper js -->
		<script src="js/popper.min.js"></script>
		<!-- Bootstrap js -->
		<script src="js/bootstrap.min.js"></script>
		<!-- Plugins js -->
		<script src="js/plugins.js"></script>
		<!-- Active js -->
		<script src="js/active.js"></script>
</body>

</html>