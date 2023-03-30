<%@page
	import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@page import="com.tscm.model.BmtCmtDtDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tscm.model.BmtCmtDTO"%>
<%@page import="com.tscm.model.BmtPostDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.tscm.model.BmtOnePostDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="org.slf4j.Logger"%>
<%@ page import="org.slf4j.LoggerFactory"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<style>
@import url("./css/postOrigin.css");
</style>

</head>

<body>
	<%
	request.setCharacterEncoding("UTF-8");
	BmtOnePostDTO retDto = (BmtOnePostDTO) session.getAttribute("post");

	System.out.print("03_onePost.jsp - p_idx: " + session.getAttribute("p_idx"));
	%>
	<%
	Logger LOG = LoggerFactory.getLogger(getClass());
	LOG.debug(" page Start : {} ", "01_post.jsp");

	ArrayList<BmtCmtDtDTO> clist = (ArrayList) session.getAttribute("cmtlist");

	if (clist != null) {
		LOG.debug("onePost.jsp - listDto size {} ", clist.size());
		for (int i = 0; i < clist.size(); i++) {
			LOG.debug("onePost.jsp - {} : {} ", i, clist.get(i).getC_content());
		}

	} else {
		LOG.debug("onePost.jsp - clDto null ");
	}
	%>


	<!--스크립트와 부트스트랩 src 불러오는 영역-->
	<script src="script.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

	<!--헤더부분: 바멘텀 로고 등등-->
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
					<li><a href="01_post.jsp" class="nav-link px-2 link-dark">피드보기</a></li>
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



	<!--포스트들이 들어가있는 영역-->
	<section class="post">
		<!--포스트1-->
		<div class="postbox postbox<%=retDto.getP_idx()%>"
			id="<%=retDto.getP_idx()%>">
			<a class="postbox_head" href="#">🍟</a><%=retDto.getU_nick()%>
			<p class="postbox_neck"><%=retDto.getP_title()%></p>
			<hr>
			<%=retDto.getP_date()%>
			<p class="postbox_body"><%=retDto.getP_content()%></p>
			<!--버튼영역-->
			<button class="post_like">
				<a href="#">좋아요</a>
			</button>

		</div>

		<!--공간나누는영역-->
		<div id="space"></div>



		<!--로그인 했을 때만댓글남기기-->




		<!-- <c:if test="${sessionScope.sessionID!=null}"></c:if> -->
		<div id="comment-count">
			댓글 <span id="count"><%=clist.size()%></span>
		</div>
		<form id="form-commentInfo">
			<input type="text" id="comment_input" placeholder="댓글을 입력해 주세요.">
			<button type="button" id="comment_submit">등록</button>


			<!-- <input type="button" value="등록"/>  -->
		</form>


		<!-- 댓글 나오는 목록 -->
		<div id=comments>
			<table border="1">
				<caption>
					<h2></h2>
				</caption>
				<tr>
					<td>작성자</td>
					<td>내용</td>
				</tr>
				<%
				for (BmtCmtDtDTO s : clist) {
				%>
			</table>
			<div>
				<span><%=s.getU_nick()%></span> 
				<span><%=s.getC_date()%></span> 
				<span
					id="cmtList"><%=s.getC_content()%></span>
				<%
				//ArrayList<Long> idxList = new ArrayList<Long>();
				//idxList.add(s.getC_idx());
				Long c_idx = s.getC_idx();

				System.out.print("댓글확인!!!!!!!!!!!" + c_idx);
				%>
				<span id="cList"></span>
				<button type="button" id="comment_delete">삭제하기</button>
				<span id="delete"><%=c_idx%></span>

			</div>
			<%
			}
			%>


		</div>



		<script src="https://code.jquery.com/jquery-3.6.4.min.js"
			integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
			crossorigin="anonymous">
			
		</script>



		<script type="text/javascript">
			//댓글 넣기!!!

			let post_comment;

			//댓글을 넣은 후 등록 버튼을 눌렀을 때 댓글정보를 가져와서 변수에 저장
			$('#comment_submit').click(function() {
				console.log("comment function")
				//input 가져오는 것을 위에 하면 아무것도 안가져오게 됨
				post_comment = $("#comment_input").val();
				cmt_create();
			});

			const cmt_create = function() {
				console.log("cmt_create function");
				console.log("입력한 댓글", post_comment);

				$.ajax({
					type : "post",
					url : "CmtInput.do",
					data : {
						"post_comment" : post_comment
					},
					dataType : "json",
					success : function(receive_data) {
						console.log(receive_data);
						//ajax_comment_suc(receive_data) 

						//댓글이 잘 저장되었을 때 페이지 reload
						if (receive_data.resCode === 1) {
							location.reload();
						}

					},
					error : function(erreMsg) {
						console.log('error');
						console.log(erreMsg);
						alert("서버가 원활하지 않습니다..");
					}
				});

			};

			const ajax_comment_suc = function(receive_data) {
				console.log('내가 쓴 글: ' + post_comment);
				console.log(receive_data);

				let json = receive_data;
				console.log(json);
			};

			// 댓글 삭제하기 !!!!!!!!!!!!!!!!!!!!!!!!!!!
			let c_idx;
			let idxList = [];
			idxList.push();

			$('#comment_delete').click(function() {
				c_idx = $("#delete").text();
				idxList = $("#cmtList").text();
				console.log("댓글번호!!!!", c_idx);
				console.log(idxList);
				cmt_delete();

			})

			const cmt_delete = function() {
				console.log("cmt_delete function");
				console.log("삭제할 댓글 번호", c_idx);

				$.ajax({
					type : "post",
					url : "CmtDelete.do",
					data : {
						"c_idx" : c_idx
					},
					dataType : "json",
					//댓글이 잘 삭제되었을 때 페이지 reload
					success : function(data) {
						location.reload();

					},
					error : function(erreMsg) {
						console.log('error');
						console.log(erreMsg);
						alert("서버가 원활하지 않습니다..");
					}
				})
			};
		</script>





	</section>
	<!--푸터영역-->
	<div id="foot" class="container">
		<footer
			class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
			<div class="col-md-4 d-flex align-items-center">
				<a href="/"
					class="mb-3 me-2 mb-md-0 text-muted text-decoration-none lh-1">
					<svg class="bi" width="30" height="24">
                    <use xlink:href="#bootstrap"></use>
                </svg>
				</a> <span class="mb-3 mb-md-0 text-muted">©2023 Bamentum, The
					sun covers the moon</span>
			</div>

			<ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
				<li class="ms-3"><a class="text-muted" href="#"><svg
							class="bi" width="24" height="24">
                        <use xlink:href="#twitter"></use>
                    </svg></a></li>
				<li class="ms-3"><a class="text-muted" href="#"><svg
							class="bi" width="24" height="24">
                        <use xlink:href="#instagram"></use>
                    </svg></a></li>
				<li class="ms-3"><a class="text-muted" href="#"><svg
							class="bi" width="24" height="24">
                        <use xlink:href="#facebook"></use>
                    </svg></a></li>
			</ul>
		</footer>
	</div>
	<!--푸터영역끝-->



	<!--섹션 끝-->

	<script>
		
	</script>


</body>
<!--바디끝-->








</html>