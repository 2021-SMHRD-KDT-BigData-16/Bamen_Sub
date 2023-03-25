<%@page import="com.tscm.model.BmtPostDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.tscm.model.BmtPtDetailDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="org.slf4j.Logger"%>
<%@ page import="org.slf4j.LoggerFactory"%>

!<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <style>
        @import url("./css/postOrigin.css");
    </style>

</head>

<body>
		<%
			request.setCharacterEncoding("UTF-8");
			BmtPostDTO retDto =(BmtPostDTO)session.getAttribute("post");
		%>


    <!--스크립트와 부트스트랩 src 불러오는 영역-->
    <script src="script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    <!--헤더부분: 바멘텀 로고 등등-->
    <header class="p-3 mb-3 border-bottom">
        <div class="container">
            <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
                    <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap">
                        <use xlink:href="#bootstrap"></use>
                    </svg>
                </a>

                <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                    <li><a href="#" class="nav-link px-2 link-dark">피드보기</a></li>
                    <li><a href="#" class="nav-link px-2 link-dark">프로필보기</a></li>
                    <li><a href="#" class="nav-link px-2 link-dark">바멘텀</a></li>
                </ul>

                <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
                    <input type="search" class="form-control" placeholder="Search..." aria-label="Search">
                </form>

                <div class="dropdown text-end">
                    <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown"
                        aria-expanded="false">
                        <img src="./img/icon/bicycle.svg" alt="mdo" width="32" height="32" class="rounded-circle">
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
   


    <!--포스트들이 들어가있는 영역-->
 <section class="post">
        <!--포스트1-->
        <div class="postbox postbox<%=retDto.getPostId()%>" id="<%=retDto.getPostId()%>">
            <a class="postbox_head" href="#">🍟</a><%=retDto.getEmail()%>
            <p class="postbox_neck"><%=retDto.getTitle()%></p>
            <hr>

            <p class="postbox_body"><%=retDto.getP_content()%></p>
            <!--버튼영역-->
            <button class="post_like"><a href="#">좋아요</a></button>
                      
            </div>

            <!--공간나누는영역-->
            <div id="space"></div>

           
           
           
           
           
           
           
           
           
           
            <!--댓글남기기-->        
            
       
        <body>
            <div id="form-commentInfo">
                <div id="comment-count">댓글 <span id="count">0</span></div>
                <input id="comment-input" placeholder="댓글을 입력해 주세요.">
                <button id="submit">등록</button>
            </div>
            <div id=comments>
        
            </div>
            <script src="./script/comment.js"></script>
        </body>
        

   


    </section>
    <!--섹션 끝-->

    <script>


    </script>


</body>
<!--바디끝-->




<!--푸터영역-->
<div id="foot" class="container">
    <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
        <div class="col-md-4 d-flex align-items-center">
            <a href="/" class="mb-3 me-2 mb-md-0 text-muted text-decoration-none lh-1">
                <svg class="bi" width="30" height="24">
                    <use xlink:href="#bootstrap"></use>
                </svg>
            </a>
            <span class="mb-3 mb-md-0 text-muted">©2023 Bamentum, The sun covers the moon</span>
        </div>

        <ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
            <li class="ms-3"><a class="text-muted" href="#"><svg class="bi" width="24" height="24">
                        <use xlink:href="#twitter"></use>
                    </svg></a></li>
            <li class="ms-3"><a class="text-muted" href="#"><svg class="bi" width="24" height="24">
                        <use xlink:href="#instagram"></use>
                    </svg></a></li>
            <li class="ms-3"><a class="text-muted" href="#"><svg class="bi" width="24" height="24">
                        <use xlink:href="#facebook"></use>
                    </svg></a></li>
        </ul>
    </footer>
</div>
<!--푸터영역끝-->





</body>

</html>