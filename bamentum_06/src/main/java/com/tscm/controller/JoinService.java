package com.tscm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.model.BmtUserDAO;
import com.tscm.model.BmtUserDTO;

public class JoinService implements Command {
	private static final Logger LOG = LoggerFactory.getLogger(JoinService.class);

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		LOG.debug(" {} service - start ", "JoinService");

		String moveURL = null;
		try {
			request.setCharacterEncoding("UTF-8");
			String email = request.getParameter("email");
			String pw = request.getParameter("pw");
			String u_nick = request.getParameter("u_nick");
			String u_profile = request.getParameter("u_profile");
			String u_info = request.getParameter("u_info");
			LOG.debug("email : {}, pw : {}, u_name : {}, profileimg : {} profiletext : {}", email, pw, u_nick,
					u_profile, u_info);

			BmtUserDTO dto = new BmtUserDTO();
			dto.setU_email(email);
			dto.setU_pw(pw);
			dto.setU_nick(u_nick);
			dto.setU_profile(u_profile);
			dto.setU_info(u_info);

			BmtUserDAO dao = new BmtUserDAO();
			int cnt = dao.join(dto);

			LOG.debug("join return cnt : {} ", cnt);
			if (cnt > 0) {
				request.setAttribute("email", email);
				moveURL = "join_success.jsp";

			} else {
				moveURL = "main.jsp";
			}

		} catch (Exception e) {
			e.printStackTrace();
			LOG.debug(" exception : {} ", e);
		}

		return moveURL;
	}

}
