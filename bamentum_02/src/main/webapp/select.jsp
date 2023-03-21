<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored = "false" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tscm.model.BmtPostDTO"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Forty by HTML5 UP</title>
		<meta charset="UTF-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="assets/css/main.css" />
		
	</head>
	<style>
	
	</style>
	<body style="text-align: center;">
	
	<%
		// request 에 있는 list 데이터 꺼내오기
		
		ArrayList<BmtPostDTO> listDto = (ArrayList)request.getAttribute("listMyPage");;
		
		if(listDto != null)
		{
			System.out.printf("select.jsp - listDto size %d %n", listDto.size());
			for(int i=0; i< listDto.size(); i++)
			{
				System.out.printf("select.jsp - %d : %s %n", 
						i, listDto.get(i).getP_content());
			}
			
		}
		else {
			System.out.printf("select.jsp - listDto null %n");
		}
	
	%>
	
	
	
		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Menu -->
					<nav id="Update">	
						<table>
							<caption><h2>회원관리페이지</h2></caption>
							<tr>
								<td>Email</td>
								<td>image</td>
								<td>image</td>
								<td>content</td>							
							</tr>
							<!-- 2.모든 회원의 이메일(email),전화번호(tel),주소(address)를 출력하시오. -->
							<%							
								for(BmtPostDTO dto : listDto) { 
							%>
							
								<tr>
									<td><%= dto.getEmail() %></td>
									<td><%= dto.getImgPath() %></td>
									<td> <img alt="이미지가 없네요" src= <%= dto.getImgPath() %> > </td>
									<td><%= dto.getP_content() %></td>
								</tr>
							
							
							<% 	
								}
							%>
							
							
						</table>
					</nav>		
					<a href="main.jsp" class="button next scrolly">되돌아가기</a>	
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

