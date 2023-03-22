package com.tscm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.model.BmtUserDAO;
import com.tscm.model.BmtUserDTO;

public class LogInService implements Command {
	private static final Logger LOG = LoggerFactory.getLogger(LogInService.class); 
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		LOG.debug(" {} service - start ", "LogInService");
		String moveURL = null;
		
		try {
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
			moveURL = "login_success.jsp";
			
		} catch (Exception e) {
			e.printStackTrace();
			LOG.debug(" exception : {} ", e);
		}
		
		return moveURL;
	}

}
