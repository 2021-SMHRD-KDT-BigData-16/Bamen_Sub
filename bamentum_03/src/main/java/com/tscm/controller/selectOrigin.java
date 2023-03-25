package com.tscm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.logging.Log;

import com.tscm.model.BmtPostDTO;
import com.tscm.model.BmtUserDAO;


public class selectOrigin implements Command {
	
	String moveURL=null;

	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
			long postid = Long.parseLong(request.getParameter("postid"));
			BmtPostDTO dto = new BmtPostDTO(postid, 0, "", "", "", "");
			BmtUserDAO dao = new BmtUserDAO();
			BmtPostDTO retDto = dao.selectOrigin(dto);
			
			if(retDto != null) {
				HttpSession session = request.getSession();
				session.setAttribute("post", retDto);
				moveURL="postOrigin.jsp";
			}
			
		}		
		
	catch(Exception e) {
		e.printStackTrace();
		
	}
	return moveURL;
}
}
