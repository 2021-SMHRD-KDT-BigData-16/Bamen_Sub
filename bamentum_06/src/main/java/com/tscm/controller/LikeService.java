package com.tscm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tscm.model.BmtUserDTO;



public class LikeService implements Command {
	
	

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		BmtUserDTO user = (BmtUserDTO)session.getAttribute("user");
		
		
		
				
		
		return null;
	}

}
