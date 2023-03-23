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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<style>
  @import url("css/myprofile.css"); 
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
	



    <script src="script.js"></script>
    <script src = "https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    <header class="p-3 mb-3 border-bottom">
        <div class="container">
          <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
              <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
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
              <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                <img src="./img/icon/bicycle.svg" alt="mdo" width="32" height="32" class="rounded-circle">
              </a>
              <ul class="dropdown-menu text-small">
                <li><a class="dropdown-item" href="#">회원정보변경</a></li>
                <li><a class="dropdown-item" href="#">설정변경</a></li>
                <li><a class="dropdown-item" href="#">내프로필보기</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">로그아웃</a></li>
              </ul>
            </div>
          </div>
        </div>
      </header>

      <body>
        <div class="alert alert-light container0" role="alert">
            <a href="">글을 써보세요!</a>
          </div>
        <div class="ratio ratio-16x9">
        
            
				<%
//					for(int i=0; i< listDto.size(); i++) {
					for(int i=0; i<3; i++) {
				%>
		            <div class="alert alert-success container<%=Integer.toString(i+1)%>">
						<h4 class="alert-heading"><%= listDto.get(i).getU_name() %> </h4>
		                <p class="mb-1"><%=listDto.get(i).getTitle() %></p>
		                <p class="content_hidden"><%= listDto.get(i).getP_content() %></p>
		                
					<!-- 
						<p> <img alt="이미지가 없네요" src= < %= listDto.get(i).getImgPath() %> > </p>
					 -->
			            <input type="checkbox" class="more_button">
		            </div>
    			<% 	
					}
				%>
         
        </div>
      </body>
      
      <div id="foot" class="container">
        <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
          <div class="col-md-4 d-flex align-items-center">
            <a href="/" class="mb-3 me-2 mb-md-0 text-muted text-decoration-none lh-1">
              <svg class="bi" width="30" height="24"><use xlink:href="#bootstrap"></use></svg>
            </a>
            <span class="mb-3 mb-md-0 text-muted">©2023 Bamentum, The sun covers the moon</span>
          </div>
      
          <ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
            <li class="ms-3"><a class="text-muted" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#twitter"></use></svg></a></li>
            <li class="ms-3"><a class="text-muted" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#instagram"></use></svg></a></li>
            <li class="ms-3"><a class="text-muted" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#facebook"></use></svg></a></li>
          </ul>
        </footer>
      </div>
   

</body>
</html>