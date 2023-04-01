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


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Follow Create</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<style>
div {
	width: 400px;
	margin-top: 10px;
}
</style>
</head>
<body>

	<%
		Logger LOG = LoggerFactory.getLogger(getClass());
		LOG.debug(" page Start : {} ", "followPage.jsp");
		
		Date nowDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss"); 
		String strNowDate = sdf.format(nowDate);
		LOG.debug(" 날짜포맷 지정후 now {}, strNow {} ", nowDate, strNowDate);
		
		
		ArrayList<BmtFollowDTO> dtoList = (ArrayList)session.getAttribute("dtoList");
		
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
 	  <h1 align="center"> 팔로우 입력하기  </h1>

        <div class="container-sm">

        
			<form action="FollowInsert.do" method="post" >
				<li>로그인한 이메일<input type="text" name="follower" value="Mi_yeon0602@bamentum.com"></li>
				<li>팔로우할 이메일<input type="text" name="following" value="Sangjae0604@bamentum.com"></li>
				<li><input type="submit" value="FollowInsert" class="button fit"></li>
			</form>
        </div>

		<form action="FollowselectAll.do" method="post" >
			<li>팔로우검색<input type="text" name="follower" value="Mi_yeon0602@bamentum.com"></li>
			<li><input type="submit" value="팔로우 조회하기" class="button fit"></li>
		</form>
		
            <button type="button" class="btn btn-outline-secondary">피드로 이동</button>
		
		
	<%        
		if(dtoList  != null)
		{
			for(int i=0; i<dtoList.size(); i++){%>
			
		        <div class="container-sm">
		            <table>
		            	<tr>
		            		<form action="FollowDelect.do"method="post"> 
							<a> 팔로우 해제 </a>
							<li><input type = "text" name = "follower" value = "<%=dtoList.get(i).getFollower()%>"><%=dtoList.get(i).getFollower()%></li>
							<li><input type = "text" name = "following" value = "<%=dtoList.get(i).getFollowing()%>"><%=dtoList.get(i).getFollowing()%></li>
							<li><input type="submit" value="팔로우 삭제" class="button fit"></li>
							</form>
		           	 	</tr>
		            </table>
		        </div>

	<%			
			}
		}
	%>
	
	<button type="button" class="btn btn-outline-secondary">피드로 이동</button>
</body>
</html>