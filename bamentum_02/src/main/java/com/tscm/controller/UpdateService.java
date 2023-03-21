package com.tscm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tscm.model.MemberDAO;
import com.tscm.model.MemberDTO;

@WebServlet("/UpdateService")
public class UpdateService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("UpdateService - service - start");
		
		// 1. 인코딩 작업
		// 2. 수정하고자 넘겨준 데이터 꺼내오기
		// 		+) 수정하고자 하는 회원의 email 필요!
		// 3. 데이터 MemberDTO 형태로 묶어주기
		// 4. DAO로 접근할수 있는 메소드 사용 (DAO -> update())
		// 5. main.jsp로 이동.
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		MemberDTO retDto = (MemberDTO)session.getAttribute("user");
		String email = retDto.getEmail();
		
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");
		System.out.printf("email : %s, pw : %s, tel : %s, add : %s %n", email, pw, tel, address);
		
		MemberDTO dto = new MemberDTO(email, pw, tel, address);
		MemberDAO dao = new MemberDAO();
		int iRet = dao.update(dto);
		if(iRet > 0) {
			System.out.printf("update success iRet : %d %n", iRet);
			retDto = dao.login(dto);
			if(retDto != null) {
				System.out.printf("ret email : %s %n", retDto.getEmail());
				session.setAttribute("user", retDto);
			}			
			
		} else {
			System.out.printf("update fail iRet : %d %n", iRet);
		}
		
		response.sendRedirect("main.jsp");
	}

}
