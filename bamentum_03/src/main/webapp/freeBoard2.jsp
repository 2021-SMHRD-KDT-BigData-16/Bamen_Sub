<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.tscm.model.BmtPtDetailDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="org.slf4j.Logger"%>
<%@ page import="org.slf4j.LoggerFactory"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>바멘텀 자유게시판</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<style>
	@import url("css/post.css");
	@import url("css/myprofile.css");
</style>

</head>


<body>
	<!--스크립트와 부트스트랩 src 불러오는 영역-->
	<script src="script.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js">
	</script>

	<header class="p-3 mb-3 border-bottom">
		<div class="container">
			<div
				class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
				<a href="/"
					class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
					<svg class="bi me-2" width="40" height="32" role="img"
						aria-label="Bootstrap">
                        <use xlink:href="#bootstrap"></use>
                    </svg>
				</a>

				<ul
					class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
					<li><a href="#" class="nav-link px-2 link-dark">피드보기</a></li>
					<li><a href="#" class="nav-link px-2 link-dark">프로필보기</a></li>
					<li><a href="#" class="nav-link px-2 link-dark">바멘텀</a></li>

				</ul>


				<form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
					<input type="search" class="form-control" placeholder="Search..."
						aria-label="Search">
				</form>

				<div class="dropdown text-end">
					<a href="#"
						class="d-block link-dark text-decoration-none dropdown-toggle"
						data-bs-toggle="dropdown" aria-expanded="false"> <img
						src="./img/icon/bicycle.svg" alt="mdo" width="32" height="32"
						class="rounded-circle">
					</a>
					<ul class="dropdown-menu text-small">
						<li><a class="dropdown-item" href="#">회원정보변경</a></li>
						<li><a class="dropdown-item" href="#">설정변경</a></li>
						<li><a class="dropdown-item" href="#">내프로필보기</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>
						<li><a class="dropdown-item" href="#">로그아웃</a></li>
					</ul>
				</div>
			</div>
		</div>
	</header>


	<!--글쓰는 회색박스 영역-->
	<div class="alert alert-light do_write" role="alert">
		<a href="postCreate.html"><img src="img/icon/pencil-square.svg"></a>
		글을 써보세요!
	</div>

	<!--포스트들이 들어가있는 영역-->
	<section class="post">
		<!--포스트1-->
		<div class="postbox postbox1" id="post1">
			<a class="postbox_head" href="#">🍟</a>김연우
			<p class="postbox_neck">"저는</p>
			<hr>
			<p class="postbox_body">낄낄</p>
			
			<button class="post_like">
				<a href="#">좋아요</a>
			</button>
			<button class="post_origin">
				<a href="#">원문보기</a>
			</button>
			<input type="checkbox" class="more_button">
		</div>
		<!--공간나누는영역-->
		<div id="space"></div>

		<!--포스트2-->
		<div class="postbox postbox2" id="post2">
			<a class="postbox_head" href="#">🍔</a>안미연
			<p class="postbox_neck">"연우랑 상재가 너무 밥을 안먹어서 걱정이에요"</p>
			<hr>
			<p class="postbox_body">Whenever you need to, be sure to use
				margin utilities to keep things nice and tidy.</p>
			<!--버튼영역-->
			<button class="post_like">
				<a href="#">좋아요</a>
			</button>
			<button class="post_origin">
				<a href="#">원문보기</a>
			</button>
			<input type="checkbox" class="more_button">
		</div>
		<!--공간나누는영역-->
		<div id="space"></div>


	</section>
	<!--섹션 끝-->

	<script>
    // 스크롤 script시작
//	window.onscroll = function() {myFunction()};
//	
//	function myFunction() {
//	    if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
//	        document.getElementById("myP").className = "test";
//	    } else {
//	        document.getElementById("myP").className = "";
//	    }
//	}  
//    
    
    var count = 3;
	window.onscroll = function() {scrollInfinite()};
	
	function scrollInfinite()
	{
	    if ((window.innerHeight + window.scrollY) >= (document.body.offsetHeight*0.8)) {
	        setTimeout(
	        		
			function () {
	        			
			var addContent1 = document.createElement("div");
			addContent1.classList.add(`postbox`);
			addContent1.classList.add(`postbox${count}`)
			addContent1.innerHTML += `<a class="postbox_head" href="#">🍟</a>김연우
				    <p class="postbox_neck">"저는 감자튀김에 밀크쉐이크를 찍어먹지 않는 맛알못입니다"</p>
				    <hr>`
				            
				            addContent1.innerHTML += `<p class="postbox_body">Whenever you ne <br> <br><br> <br><br> <br><br> <br><br> <br><br> <br> <br> <br>
				        <br> <br> <br>ed to, be sure to use margin utilities to keep things nice and tidy.</p>
				    <!--버튼영역-->
				    <button class="post_like"><a href="#">좋아요</a></button>
				    <button class="post_origin"><a href="#">원문보기</a></button>
				    <input type="checkbox" class="more_button">`
				            document.querySelector('section').appendChild(addContent1);
				            count = count+1;
				            var addContent2 = document.createElement("div");
				            addContent2.classList.add(`space`);
				            document.querySelector('section').appendChild(addContent2);
			}, 100)
	    }
		
	}
    // 스크롤 script끝 

    </script>
</body>
</html>