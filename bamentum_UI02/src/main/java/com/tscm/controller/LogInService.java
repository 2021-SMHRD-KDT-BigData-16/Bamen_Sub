package com.tscm.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.model.BmtUserDAO;
import com.tscm.model.BmtUserDTO;

@WebServlet("/LogInService")
public class LogInService extends HttpServlet {
	private static final long serialVersionUID = 1L;
//	private static Logger LOG = LoggerFactory.getLogger(LogInService.class); 
	private static final Logger LOG = LoggerFactory.getLogger(LogInService.class); 

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		LOG.debug(" {} service - start ", "LogInService");
		// 1. 한글 인코딩 잡아주기
		// 2. 요청받은 데이터 꺼내오기(2개)
		// 3. 데이터들 하나로 묶어주기
		// 4. DAO 생성하기
		// 5. 로그인 기능 수행하기
		// 6. 로그인 성공한다면 session 로그인 정보를 저장.
		// 7. main.jsp로 redirect 방식으로 이동
		
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		LOG.debug(" email : {}, pw : {}", email, pw);
		
		BmtUserDTO dto = new BmtUserDTO();
		dto.setEmail(email);
		dto.setPw(pw);
		
		BmtUserDAO dao = new BmtUserDAO();
		
		// select * from web_member where email = ? and pw = ?
		BmtUserDTO retDto = dao.login(dto);
		
		if(retDto != null) {
			LOG.debug(" return email : {} ", retDto.getEmail());
			HttpSession session = request.getSession();
			session.setAttribute("user", retDto);
			
		}else {
			LOG.debug(" return retDto : {} ", retDto);
		}
		response.sendRedirect("main.jsp");
	}

}
