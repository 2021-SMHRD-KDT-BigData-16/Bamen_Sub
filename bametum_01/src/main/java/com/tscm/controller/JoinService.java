package com.tscm.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.model.MemberDAO;
import com.tscm.model.MemberDTO;

public class JoinService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger LOG = LoggerFactory.getLogger(JoinService.class); 

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LOG.debug("JoinService - service - start");
		
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");
		
		System.out.printf("email : %s, pw : %s, tel : %s, add : %s %n", email, pw, tel, address);
		LOG.debug("email : {}, pw : {}, tel : {}, add : {} ", email, pw, tel, address);
		
		MemberDTO dto = new MemberDTO(email, pw, tel, address);
		MemberDAO dao = new MemberDAO();
		int cnt = dao.join(dto);
		
		if(cnt > 0) {
			LOG.debug("dao.join success cnt : {}", cnt);
			request.setAttribute("email", email);
			RequestDispatcher rd =  request.getRequestDispatcher("join_success.jsp");
			rd.forward(request, response);
			
		}else {
			LOG.debug("dao.join fail cnt : {}", cnt);
			response.sendRedirect("main.jsp");
		}
		
	}

}
