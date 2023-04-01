<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.tscm.model.BmtFollowDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="org.slf4j.Logger"%>
<%@ page import="org.slf4j.LoggerFactory"%>

<!doctype html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

  <!-- google icon -->
  <link
    href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
    rel="stylesheet">

  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <style>
      @import url("./css/post.css");
      @import url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Noto+Serif+KR&display=swap');
      @import url("./css/following.css");
      @import url("./css/feed.css");
    </style>
  </head> 
</head>

<body>
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

<!-- 팔로워 검색 기능 -->
        <form action="FollowInsert.do" method="post" class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
          <input type="search" name = "following" value="" class="form-control" type="submit"class="button fit" placeholder="Search..." aria-label="Search">
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
		<%
		Logger LOG = LoggerFactory.getLogger(getClass());
		LOG.debug(" page Start : {} ", "followPage.jsp");
		
		Date nowDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss"); 
		String strNowDate = sdf.format(nowDate);
		LOG.debug(" 날짜포맷 지정후 now {}, strNow {} ", nowDate, strNowDate);
		
		
		ArrayList<BmtFollowDTO> dtoList = (ArrayList)session.getAttribute("fw_dtoList");
		
		if(dtoList != null)
		{
			LOG.debug("04_0_FwTest.jsp - listDto size {} ", dtoList.size());
			for(int i=0; i< dtoList.size(); i++)
			{
				LOG.debug("04_0_FwTest.jsp - {} : {} : {} : {}", 
						dtoList.get(i).getF_date(), dtoList.get(i).getFollower(),
						dtoList.get(i).getFollowing(), dtoList.get(i).getF_date());
			}
			
		}
		else {
			LOG.debug("FollowselectALL.jsp - listDto null ");
		}
		
	%>
  <section> 
    <div class="main_feed">
      <div class="left_feed">
        <div class="feed_box">
          <h5>내 팔로잉 친구들</h5>
   		<% if(dtoList  != null){
		for(int i=0; i<dtoList.size(); i++){%>
           <div class="feed_name">
            	<div class="profile_box">
             		<img class="profile_img"
                src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMDA4MjdfMzAg%2FMDAxNTk4NDU3NDU4Mjcy.oZk9CRCShiM981IUje3RImvoxIS3Q3KP4tKxjUQE4Gwg.6_K-4eSzkMoOC6QUPBCxyd3QAVAIqKcDkxwYcIrblTEg.PNG.vosne-romanee%2F%25BD%25BA%25C5%25A9%25B8%25B0%25BC%25A6_2020-08-27_%25BF%25C0%25C0%25FC_12.37.48.png&type=sc960_832">
   				</div>
            <form action="FollowDelect.do" method="post"> 
	            <div class="feed_name_txt">
	              <strong style="font-weight: bolder;"><input type = "text" name = "following" value = "<%=dtoList.get(i).getFollowing()%>"></strong>
	            </div>
	            <a class="link_txt"><input type="submit" value="팔로우 삭제" class="button fit"></a>
            </form>
           </div>
         <div class="space"></div>
         
        <%}
}%>	 	
<!--  
		 <div class="feed_name">
            <div class="profile_box">
              <img class="profile_img"
                src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMDA4MjdfMzAg%2FMDAxNTk4NDU3NDU4Mjcy.oZk9CRCShiM981IUje3RImvoxIS3Q3KP4tKxjUQE4Gwg.6_K-4eSzkMoOC6QUPBCxyd3QAVAIqKcDkxwYcIrblTEg.PNG.vosne-romanee%2F%25BD%25BA%25C5%25A9%25B8%25B0%25BC%25A6_2020-08-27_%25BF%25C0%25C0%25FC_12.37.48.png&type=sc960_832">
            </div>
            <div class="feed_name_txt">
              <strong> miyeon0602 </strong>
              <p class="nick">연이</p>
              <p class=" introduce">알톤 하이브리드 ・ 3년차</p>
            </div>
            <a class="link_txt">언팔로우</a>
          </div>
         	<div class="space"></div>
-->
		</div>
	   </div>
	  </div>
     </div>
 </section> 

</body>
</html>