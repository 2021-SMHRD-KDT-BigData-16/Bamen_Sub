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
import com.tscm.model.BmtPtDetailDTO;
import com.tscm.model.BmtUserDAO;


public class selectOrigin implements Command {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String moveURL=null;
		
		try {
			request.setCharacterEncoding("UTF-8");
			long postid = Long.parseLong(request.getParameter("postid"));
			BmtPtDetailDTO dto = new BmtPtDetailDTO(postid, "","","","","");
			BmtUserDAO dao = new BmtUserDAO();
			BmtPtDetailDTO retDto = dao.selectPostDetail(dto);
			
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
