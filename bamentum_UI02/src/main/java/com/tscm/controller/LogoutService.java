package com.tscm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutService")
public class LogoutService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 로그아웃 요청시 session에 저장된 데이터 삭제!
		// 1. session 영역 생성
		// 2. session 에 들어 있는 "user" 정보 삭제!
		// 		- remove()
		//		- invalidate()
		// 3. redirect 로 main.jsp 이동
		System.out.println("LogoutService - service - start");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		session.invalidate();
		response.sendRedirect("main.jsp");
		
	}

}
