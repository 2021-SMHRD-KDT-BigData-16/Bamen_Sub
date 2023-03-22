package com.tscm.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.model.BmtUserDAO;
import com.tscm.model.BmtUserDTO;

@WebServlet("/JoinService")
public class JoinService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger LOG = LoggerFactory.getLogger(JoinService.class); 

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LOG.debug(" {} service - start ", "JoinService");
		
		// 1. 한글 인코딩 잡아주기.
		// 2. 요청받은 데이터들을 꺼내오기.
		// 3. 요청받은 데이터들을 하나의 자료형으로 묶어주기.
		// 4. 회원가입 기능 수행하기.
		// 		-> 데이터베이스 연결과 관련된 기능 쓰겠다.
		
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String u_name = request.getParameter("u_name");
		String profileimg = request.getParameter("profileimg");
		String profiletext = request.getParameter("profiletext");
		LOG.debug("email : {}, pw : {}, u_name : {}, profileimg : {} profiletext : {}", 
				email, pw, u_name, profileimg, profiletext);
		
		BmtUserDTO dto = new BmtUserDTO(email, pw, u_name, profileimg, profiletext);
		
		BmtUserDAO dao = new BmtUserDAO();
		int cnt = dao.join(dto);
		
		LOG.debug("join return cnt : {} ", cnt);
		if(cnt > 0) {
			// 5. 회원 가입 성공했다면 join_success.jsp로 forward 방식으로이동
			// 	-> request scope 영역에 회원 가입한 email을 저장해서 이동.
			request.setAttribute("email", email);
			RequestDispatcher rd =  request.getRequestDispatcher("join_success.jsp");
			rd.forward(request, response);
			
		}else {
			// 6. 회원 가입 실패 했다면 main.jsp로 redirect 방식으로 이동.
			response.sendRedirect("main.jsp");
		}
		
	}

}
