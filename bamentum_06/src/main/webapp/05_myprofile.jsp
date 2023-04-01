<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.tscm.model.BmtBicDTO"%>
<%@ page import="com.tscm.model.BmtPostDTO"%>
<%@ page import="com.tscm.model.BmtUserDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="org.slf4j.Logger"%>
<%@ page import="org.slf4j.LoggerFactory"%>


<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/myprofile2.css">
    <link
        href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
        rel="stylesheet">
    <title>바멘텀 | 내 프로필</title>

</head>
<body>


	<%
		Logger LOG = LoggerFactory.getLogger(getClass());
		LOG.debug(" page Start : {} ", "05_myprofile.jsp");
		
		Date nowDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss"); 
		String strNowDate = sdf.format(nowDate);
		LOG.debug(" 날짜포맷 지정후 now {}, strNow {} ", nowDate, strNowDate);

		
		ArrayList<BmtBicDTO> listBic = (ArrayList)session.getAttribute("mp_bic_list");;
		
		if(listBic != null)
		{
			LOG.debug("05_myprofile.jsp - listPost size {} ", listBic.size());
			for(int i=0; i< listBic.size(); i++)
			{
				LOG.debug("05_myprofile.jsp - {} : {} : {} : {}", 
						listBic.get(i).getB_num(), listBic.get(i).getU_email(),
						listBic.get(i).getB_img(), listBic.get(i).getB_model());
			}
			
		}
		else {
			LOG.debug("05_myprofile.jsp - listBic null ");
		}

		ArrayList<BmtPostDTO> listPost = (ArrayList)session.getAttribute("mp_post_list");;
		
		if(listPost != null)
		{
			LOG.debug("05_myprofile.jsp - listPost size {} ", listPost.size());
			for(int i=0; i< listPost.size(); i++)
			{
				LOG.debug("05_myprofile.jsp - {} : {} : {} : {}", 
						listPost.get(i).getP_idx(), listPost.get(i).getU_email(),
						listPost.get(i).getP_content(), listPost.get(i).getP_date());
			}
			
		}
		else {
			LOG.debug("05_myprofile.jsp - listPost null ");
		}
		
		BmtUserDTO dtoUser = (BmtUserDTO)session.getAttribute("mp_user");;
		if(dtoUser != null)
		{
			LOG.debug("05_myprofile.jsp - dtoUser email {}, nick {} ", dtoUser.getU_profile(), dtoUser.getU_nick());
		}
		else
		{
			LOG.debug("05_myprofile.jsp - dtoUser null ");
		}
		
	%>    



    <!--헤더부분: 바멘텀 로고 등등-->
    <div class="page">
        <header>
            <img src="./img/로고_투명_흰색.png" class="Logo">
            <nav>
                <ul>
                    <li><a href="#" class="menuLink" style="width : 50px; align : center;">바멘텀</a></li>
                    <li><a href="#" class="menuLink" style="width : 60px; align : center;">내 프로필</a></li>
                    <li><a href="#" class="menuLink" style="width : 60px;">여긴 뭐야</a></li>
                    <li><a href="#" class="menuLink" style="width : 90px;">내 자전거 등록</a></li>

                </ul>

                <div class="search-box">
                    <button class="btn-search"><i class="fas fa-search"><img
                                src="./img/search_white(2).png" class="search_icon"
                                style="width : 40px; margin-top : 8px;"></i></button>

                    <input type="text" class="input-search" placeholder="검색어를 입력하세요!">
                </div>

                <img src="./img/profile_2.PNG" class="profile_circle">

            </nav>
        </header>
    </div>

    <div class="banner"
        style="display: flex; margin-top : 15px; margin-left : 400px; margin-bottom : -20px; height : 100px;">
        <img src="./img/배너4.jpg" style="border : 1px solid rgb(228, 107, 173); width : 700px;">
    </div>

    <section class = "profile_sector">
        <img class = "profile_pic" src=<%= dtoUser.getU_profile() %> >
        <p class = "my_name"> 이름 :<%= dtoUser.getU_nick()%></p>
        <p class = "my_name"> 이메일 :<%= dtoUser.getU_email() %></p>
        <p class = "my_name"> 가입날짜 :<%= dtoUser.getU_joindate() %></p>
        <p class = "my_introduce"><%= dtoUser.getU_info() %></p>
        <p class = "profile_bic_num">자전거 차대번호 : <%= listBic.get(0).getB_num() %> </p> 
    </section>



</body>

</html>