<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/myprofile.css">
    <link
        href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
        rel="stylesheet">
    <title>바멘텀 | 내 프로필</title>
</head>


<style>
    .edit_btn {
        width: 60px;
        height: 40px;
        margin-left: 1250px;
        margin-top: -50px;
        border: 1px solid gray;
    }
</style>
<div class="page">
    <header id="nav_bar">

        <a href="#"><img src="./img/bg-img/로고_투명_흰색.png" width="80px"
                class="Logo"></a>
        <nav>
            <ul>
                <li><a href="01_post.jsp" class="menuLink" style="width : 50px; align : center;">바멘텀</a></li>
                    <li><a href="05_myprofile.jsp" class="menuLink" style="width : 60px; align : center;">내 프로필</a></li>
                    <li><a href="#" class="menuLink" style="width : 60px;">팔로잉보기</a></li>
                    <li><a href="04_bic_num.jsp" class="menuLink" style="width : 90px;">내 자전거 등록</a></li>
            </ul>

        </nav>
        <div class="nav_others">
            <input class="search_win" type="search" placeholder="검색하기!">
            <input class="submit_btn" type="submit" value="검색">

            <a href="#" class="bic_icon"><img class="bic_icon"
                    src="./img/bg-img/bicycle.svg"></a>
    </header>


</div>

<body>



    <!-- 프로필 사진 / 이름(닉네임) 표시 -->
    <div class="profile_elements">
        <img class="profile_pic" src="./img/bg-img/person-circle.svg">
        <h3 class="profile_name">김연우</h3>


    </div>

    <!-- 정보 수정 버튼 -->
    <input class="edit_btn" type="submit" value="수정">


    <!-- 차대번호 표시 -->
    <h2 class="bic_num_letter">차대번호 : </h2>
    <h3 class="bic_num">dshblkjsdbfdhs</h3>

    <!-- 게시물 / 팔로워 / 팔로잉 수 표시 -->
    <div class="postn_fol">
        <span>게시물</span> <span style="font-weight: 700;">50</span> <span style="margin-left : 100px;">팔로워</span> <span
            style="font-weight: 700;">250</span> <span style="margin-left : 100px;">팔로잉</span> <span
            style="font-weight: 700;">274</span>
    </div>



    <!-- 내가 쓴 글 표시 -->

    <div class="my_write">
        <p class="write_content">내가 쓴 글입니다.</p>
    </div>

    <div class="my_write">
        <p class="write_content">내가 쓴 글입니다.</p>
    </div>

    <div class="my_write">
        <p class="write_content">내가 쓴 글입니다.</p>
    </div>

    <div class="my_write">
        <p class="write_content">내가 쓴 글입니다.</p>
    </div>

    <div class="ad">

    </div>


    <footer style="border : 1px solid red;">
        <div style="width : 100%; height : 50px; color : black; border : 1px solid gray;">
            바멘텀
        </div>
    </footer>




</body>



</html>