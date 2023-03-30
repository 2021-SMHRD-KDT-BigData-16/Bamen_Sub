package com.tscm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.google.gson.Gson;
import com.tscm.model.BmtCmtDAO;
import com.tscm.model.BmtCmtDTO;


public class CmtCreate implements Command {
	private static final Logger LOG = LoggerFactory.getLogger(MorePageService.class);

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		LOG.debug(" {} service - start ", "CmtCreate");
		String moveURL = null;
		
		
		try {			
			HttpSession session = request.getSession();
			int p_idx=(int)session.getAttribute("postid");
			
			String post_comment= request.getParameter("post_comment");
			LOG.debug(" **** MorePageService before - post_comment {} ", post_comment);
			
			BmtCmtDTO dtoCmt = new BmtCmtDTO();
			dtoCmt.setC_content(post_comment);			
			
			BmtCmtDAO daoCmt= new BmtCmtDAO();
			daoCmt.cmtInsert(dtoCmt);
			
			moveURL="onePost.jsp";					
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
			LOG.debug(" exception : {} ",e);
		}
		return moveURL;
	}
}