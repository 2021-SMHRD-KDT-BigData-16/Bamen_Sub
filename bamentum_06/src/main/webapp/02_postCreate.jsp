<%@page import="com.tscm.model.BmtPostDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>바멘텀 | 글 작성"</title>


<link rel="stylesheet" href="./css/postCreate.css">


</head>

<body>
	<!-- Header -->
	<div>

		<body>
			<div class="page">
				<header>
					<img src=".img/로고_투명_흰색.png" class="Logo">
					<nav>
						<ul>
						<li><a href="01_post.jsp" class="menuLink" style="width : 50px; align : center;">바멘텀</a></li>
                    <li><a href="05_myprofile.jsp" class="menuLink" style="width : 60px; align : center;">내 프로필</a></li>
                    <li><a href="#" class="menuLink" style="width : 60px;">팔로잉보기</a></li>
                    <li><a href="04_bic_num.jsp" class="menuLink" style="width : 90px;">내 자전거 등록</a></li>

						</ul>

						<div class="search-box">
				<button type="button" class="btn-search" id="search_btn">
						<i class="fas fa-search"><img src="./img/search_white(2).png"
							class="search_icon" style="width: 40px; margin-top: 8px;"></i>
					</button>
					<input type="text" id="input_search" class="input-search" placeholder="검색어를 입력하세요!">


				</div>

						<img src=".img/person-circle.svg" class="profile_circle">

					</nav>
				</header>
			</div>
		</body>
	</div>
	<%

	%>

	
			
		<form action="PostCreate.do" method="post">
			<input type="text" name="p_title" class="input_title" placeholder="제목을 입력하세요!"> 
			<input type="text" name="p_content" class="input_content" placeholder="당신의 생각을 적어주세요">
			<input type="submit" value="글올리기" class="p_create">
		</form>
			





</body>

<!-- 페이지 이동 자바스크립트 -->
<script type="text/javascript">
	function PostCreate(postid) {
		console.log(postid);
		let f = document.createElement('form');

		let obj;
		obj = document.createElement('input');
		obj.setAttribute('type', 'hidden');
		obj.setAttribute('name', 'postid');
		obj.setAttribute('value', postid);

		f.appendChild(obj);
		f.setAttribute('method', 'post');
		f.setAttribute('action', 'onePost.do');
		document.body.appendChild(f);
		f.submit();
	}
</script>





</html>