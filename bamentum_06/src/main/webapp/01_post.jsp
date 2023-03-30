<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.lang.Integer"%>

<%@ page import="com.tscm.model.BmtOnePostDTO"%>
<%@ page import="org.slf4j.LoggerFactory"%>
<%@ page import="org.slf4j.Logger"%>
<%@ page import="com.tscm.model.BmtPostDTO"%>
<%@ page import="com.tscm.model.BmtOnePostDTO"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>바멘텀 자유게시판</title>

<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"> </script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<style>
@import url("css/post.css");
@import url("css/myprofile.css");
</style>

</head>


<body>

	<%
	Logger LOG = LoggerFactory.getLogger(getClass());
	LOG.debug(" page Start : {} ", "01_post.jsp");

	ArrayList<BmtOnePostDTO> listDto = (ArrayList)session.getAttribute("postlist");
	
	
	if (listDto != null) {
		LOG.debug("post.jsp - listDto size {} ", listDto.size());
		for (int i = 0; i < listDto.size(); i++) {
			LOG.debug("post.jsp - {} : {} ", i, listDto.get(i).getP_content());
		}

	} else {
		LOG.debug("post.jsp - listDto null ");
	}
	%>



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


		<%
		for(int i=0; i< listDto.size(); i++) {
		%>


		<div class="postbox postbox<%=Integer.toString(i + 1)%>"
			id="post<%=Integer.toString(i + 1)%>">
			<a class="postbox_head" href="#"> <%=listDto.get(i).getU_nick()%>
			</a>
			<p class="postbox_neck"><%=listDto.get(i).getP_title()%></p>
            <p>  : <%=listDto.get(i).getP_date()%> 
            <p>  : <%=listDto.get(i).getRn()%> 
                 : <%=listDto.get(i).getP_idx()%> </p>
			<hr>
            

			<a href = "javascript:PostView('<%=listDto.get(i).getP_idx()%>')">
				<img alt="이미지가 없네요" height = 100px src= <%= listDto.get(i).getP_file() %> >
			</a>
			
			
			<p class="postbox_body"><%=listDto.get(i).getP_content()%></p>

			<button class="post_like">
				<a href="#">좋아요</a>
			</button>
			<button class="post_origin">
				<a href="javascript:onePost('<%=listDto.get(i).getP_idx()%>')">원문보기</a>
			</button>
			<input type="checkbox" class="more_button">
		</div>
		<!--공간나누는영역-->
		<div id="space"></div>


		<%
		}
		%>
		
	<div id = "post_more"></div>
		
		
	</section>
	
	<button id="btn_post_more"> 페이지 더보기 </button>
	
	<!-- 무한 스크롤 자바스크립트 -->
	<script type="text/javascript">
		let loading = false;
		let page_cnt = 1;
		let post_send = { "page_cnt" : page_cnt };
		
		// 무한스크롤 들어갈 자리
		
		$('#btn_post_more').click(function(){
			console.log("btnPost function");
			next_load();
			
		});
		
	    const next_load = function(){
			console.log("next_load function");
			
			$.ajax({
				type : "post",
				url : "more_page.do",
				data : post_send,
				async : false,
				dataType:"json",
				
				success : function(receive_data) {
					ajax_more_page_suc(receive_data)	},
				error : function(errorMsg) {
					console.log('error');
					console.log(errorMsg);
					
				}
			});
	    };
	    
	    
	    const ajax_more_page_suc = function(receive_data){
            console.log(`ajax_more_page_suc page_cnt : ` + page_cnt);
			console.log(receive_data);
			loading = true;
			
			let json = receive_data;
			console.log(json);
			
			let resultHTML = '';
			
			
		
			
	        for(let i = 0; i < json.length; i++){
	        	
				resultHTML += `
				
			        <div class = "postbox">
		            
					<a class="postbox_head" href="#"><h4 > ` + json[i].u_nick  + ` : ` + json[i].p_idx + ` </h4></a>
		            
		            <p class="postbox_neck">   ` + json[i].p_title + ` </p>
		            <p class="postbox_neck">   ` + json[i].p_date  + ` </p>
		            <hr>
					<a href = "javascript:PostView(' ` + json[i].p_idx  + ` ')">
		            
				    <p><img alt="이미지가 없네요" height = 100px src= ` + json[i].p_file + ` ></p>
					</a>
		            
					<p class="postbox_body">  ` + json[i].p_content + ` </p>
		            <button type="button" class="btn btn-outline-secondary">
		            <a href="javascript:onePost('`+ json[i].p_idx+`')">원문보기</a></button>
		            <button type="button" class="btn btn-outline-secondary">댓글달기</button>
		        </div>
		    	<div id="space"></div>
				`
	            
	            console.log(json[i]);
	            // console.log(resultHTML);
	            	            
	        };
	        
	        
	        $('#post_more').after(resultHTML);
			
			page_cnt = page_cnt + 1;
            console.log(`page_cnt : ` + page_cnt);
			
			loading = false;
		};
		
	
	</script>


	<!-- 스크립트 시간입니다 -->
	<script src="script.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js">
	</script>


	
	<!-- 페이지 이동 자바스크립트 -->
	<script type="text/javascript">
	function onePost(postid){
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




	<!-- 무한스크롤 자바스크립트 -->

	<script>	
	// 자바스크립트 배열변수 선언
   
    </script>


</body>
</html>