package com.tscm.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.logging.Log;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.model.BmtPostDTO;
import com.tscm.model.BmtCmtDtDTO;
import com.tscm.model.BmtOnePostDTO;
import com.tscm.model.BmtUserDAO;


public class SelectPostOne implements Command {
	private static final Logger LOG = LoggerFactory.getLogger(SelectPostOne.class); 
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String moveURL=null;
		
	
		try {
			request.setCharacterEncoding("UTF-8");
			
			long postid = Long.parseLong(request.getParameter("postid"));
			
			BmtOnePostDTO dto = new BmtOnePostDTO();
			dto.setP_idx(postid);
			BmtUserDAO dao = new BmtUserDAO();
			BmtOnePostDTO postDto = dao.selectOnePost(dto);
			
			//comment
			LOG.debug("*********error1");
			ArrayList<BmtCmtDtDTO> clDto = dao.selectComment(dto);
			
					
			if(postDto != null && clDto != null) {
				HttpSession session = request.getSession();
				session.setAttribute("post", postDto);				
				session.setAttribute("cmtlist", clDto);
				//포스트 아이디 가져오기
				session.setAttribute("p_idx", postid);
				
				System.out.println("선택한 게시글 번호: "+postid);
				moveURL="03_onePost.jsp";
			}
			
			
		}		
		
	catch(Exception e) {
		e.printStackTrace();
		
	}
	return moveURL;
		
}
}
