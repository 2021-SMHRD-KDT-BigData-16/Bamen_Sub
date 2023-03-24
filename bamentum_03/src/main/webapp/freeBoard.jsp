<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored = "false" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tscm.model.BmtPtDetailDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="org.slf4j.Logger"%>
<%@ page import="org.slf4j.LoggerFactory"%>
    
<!DOCTYPE html>
<html>


	<head>
	
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title> 바멘텀 자유게시판 </title>
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	
	    <style>
	        div{
	            width: 400px; 
	            margin-top : 10px;
	        }
	
	    </style>
	</head>
	<body>
	
		<%
			Logger LOG = LoggerFactory.getLogger(getClass());
			LOG.debug(" page Start : {} ", "freeBoard.jsp");
			
			List<BmtPtDetailDTO> listDto = (List)request.getAttribute("listPage");;
			
			if(listDto != null)
			{
				LOG.debug("freeBoard.jsp - listDto size {} ", listDto.size());
				for(int i=0; i< listDto.size(); i++)
				{
					LOG.debug("freeBoard.jsp - {} : {} ", 
							i, listDto.get(i).getP_content());
				}
				
			}
			else {
				LOG.debug("freeBoard.jsp - listDto null ");
			}
		
		%>
	
	    <h1 align="center"> 자유게시판  </h1>
	    <div class="container-sm">
	
	
	        
	        <h4 >김연우</h4>
	        <p>"저는 감자튀김에 밀크쉐이크를 찍어먹지 않는 맛알못입니다"</p>
	        <hr>
	        <p >"저는 감자튀김에 밀크쉐이크를 찍어먹지 않는 맛알못입니다저는 감자튀김에 밀크쉐이크를 찍어먹지 않는 맛알못입니다저는 감자튀김에 밀크쉐이크를 찍어먹지 않는 맛알못입니다"</p>
	        
	        
	            
			<%
				for(int i=0; i< listDto.size(); i++) {
			%>
	            <div class="alert alert-success container<%=Integer.toString(i+1)%>">
					<h4 class="alert-heading"><%= listDto.get(i).getU_name() %> </h4>
	                <p class="mb-1"><%=listDto.get(i).getTitle() %></p>
	                <p class="content_hidden"><%= listDto.get(i).getP_content() %></p>
	                
				<!-- 
					<p> <img alt="이미지가 없네요" src= < %= listDto.get(i).getImgPath() %> > </p>
				 -->
	            </div>
	  		<% 	
				}
			%>
	        
	    </div>
	
	</body>
	
</html>