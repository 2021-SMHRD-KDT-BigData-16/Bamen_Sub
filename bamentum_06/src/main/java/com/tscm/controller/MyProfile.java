package com.tscm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.model.BmtBicDTO;
import com.tscm.model.BmtMyPfDAO;
import com.tscm.model.BmtUserDTO;

public class MyProfile implements Command {
	private static final Logger LOG = LoggerFactory.getLogger(MyProfile.class);

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String moveURL = null;
		try {
			LOG.debug(" {} Class Start ", "MyProfile");

			request.setCharacterEncoding("UTF-8");
			
			HttpSession session = request.getSession();
			String u_email=(String)session.getAttribute("email");
			
			LOG.debug(" {} u_email {} ", "MyProfile", u_email);
			
			BmtMyPfDAO dao = new BmtMyPfDAO();
			BmtUserDTO dtoUser = new BmtUserDTO();
			BmtBicDTO dtoBic = new BmtBicDTO();
			
			dao.select_user(dtoUser);
			dao.select_bic_list(dtoUser);
/*
			LOG.debug(" bic_num ins return cnt : {} ", cnt);
			if (cnt > 0) {
				request.setAttribute("u_email", u_email);
				moveURL = "01_post.jsp";

			} else {
				moveURL = "04_bic_num.jsp";
			}
*/			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			LOG.debug(" exception : {} ", e);
		}
		return moveURL;
	}

}
