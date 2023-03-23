package com.tscm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.model.BmtPostDTO;
import com.tscm.model.BmtUserDAO;
import com.tscm.model.BmtUserDTO;

public class SelectMyPage implements Command {
	private static final Logger LOG = LoggerFactory.getLogger(SelectMyPage.class); 

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		LOG.debug(" {} service - start ", "SelectMyPage");
		String moveURL = null;
		try {
			request.setCharacterEncoding("UTF-8");
			BmtUserDAO dao = new BmtUserDAO();
			
			HttpSession session = request.getSession();
			BmtUserDTO retDto = (BmtUserDTO)session.getAttribute("user");
			String email = retDto.getEmail();
			
			LOG.debug(" email {}  ", email);
			List<BmtPostDTO> listDto = dao.selectMyPage(retDto);
			
			if(listDto != null)
			{
				LOG.debug("SelectMyPage - listDto size {}", listDto.size());
				request.setAttribute("listMyPage", listDto);
			}
			else {
				LOG.debug("SelectMyPage - listDto null");
			}
			
			moveURL = "select.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			LOG.debug(" exception : {} ", e);
			
		}
		
		return moveURL;
	}

}
