package com.tscm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.model.BmtUserDTO;
import com.tscm.model.BmtUserDAO;

public class UpdateService implements Command {
	private static final Logger LOG = LoggerFactory.getLogger(UpdateService.class);
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		LOG.debug(" {} service - start ", "UpdateService");
		String moveURL = null;
		
		try {
			request.setCharacterEncoding("UTF-8");
			
			HttpSession session = request.getSession();
			BmtUserDTO retDto = (BmtUserDTO)session.getAttribute("user");
			String email = retDto.getEmail();
			
			String pw = request.getParameter("pw");
			String u_name = request.getParameter("u_name");
			String profileimg = request.getParameter("profileimg");
			String profiletext = request.getParameter("profiletext");
			
			LOG.debug(" email : {}, pw : {}, u_name : {}, pf_img : {} pf_text : {} ", email, pw, u_name, profileimg, profiletext);
			
			BmtUserDTO dto = new BmtUserDTO(email, pw, u_name, profileimg, profiletext);
			BmtUserDAO dao = new BmtUserDAO();
			int iRet = dao.update(dto);
			if(iRet > 0) {
				LOG.debug("update success iRet : {}", iRet);
				retDto = dao.login(dto);
				if(retDto != null) {
					System.out.printf("ret email : %s %n", retDto.getEmail());
					LOG.debug("ret email : {}", retDto.getEmail());
					session.setAttribute("user", retDto);
				}			
				
			} else {
				LOG.debug(" update Fail iRet: {} ", iRet);
			}

			moveURL = "main.jsp";
			
		} catch (Exception e) {
			e.printStackTrace();
			LOG.debug(" exception : {} ", e);
		}
		return moveURL;
	}


}
