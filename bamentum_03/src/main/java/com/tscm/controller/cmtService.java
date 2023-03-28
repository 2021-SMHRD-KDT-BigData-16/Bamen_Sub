package com.tscm.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tscm.model.BmtCmtDAO;
import com.tscm.model.BmtCmtDTO;


public class cmtService implements Command {
	
	
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String moveURL = null;
		try {			
			request.setCharacterEncoding("UTF-8");				
			
			Long p_idx = (long)Integer.parseInt(request.getParameter("postId"));
			String c_content = request.getParameter("content");			
			String u_email = request.getParameter("contentName");			
			BmtCmtDTO dto = new BmtCmtDTO(0, 0, c_content, "", u_email);			
			BmtCmtDAO dao = new BmtCmtDAO();			
			int cnt = dao.cmtInsert(dto);
			if(cnt>0) {
				request.setAttribute("c_content",c_content);
				
			}
			
		}		
		
	catch(Exception e) {
		e.printStackTrace();
		
	}
	return moveURL;
	}

}
