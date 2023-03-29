package com.tscm.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.controller.Command;
import com.tscm.model.BmtOnePostDTO;
import com.tscm.model.BmtPostDAO;
import com.google.gson.Gson;


public class MorePageService implements Command {
	private static final Logger LOG = LoggerFactory.getLogger(MorePageService.class);

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		LOG.debug(" {} service - start ", "MorePageService");
		String moveURL = null;
		
		try {
			request.setCharacterEncoding("UTF-8");
			
//			String str_page = request.getParameter("page_cnt");
//			LOG.debug(" **** MorePageService before - page_cnt {} ", str_page);
			
			HttpSession session = request.getSession();
			int post_page = (int)session.getAttribute("post_page");
			LOG.debug(" **** MorePageService before - post_page {} ", post_page);
			
			BmtPostDAO daoPost = new BmtPostDAO();
			ArrayList<BmtOnePostDTO> listDto = daoPost.SelectPagePost(post_page);
			for(int i=0; i< listDto.size(); i++) {
				LOG.debug(" post {} rn {} - {} ", i, listDto.get(i).getRn(), listDto.get(i).getP_content());
			}
			
			post_page++;
			
			if(listDto.size() == 0)
				post_page -= 1;
			
			LOG.debug(" **** MorePageService after - post_page {} ", post_page);
			
			String gson = new Gson().toJson(listDto);
			
			response.setCharacterEncoding("UTF-8");
			response.setContentType("json");
			response.getWriter().write(gson);
			response.getWriter().close();
			
			LOG.debug(" {} req get gson {} ", "MorePageService", gson);
			
			session.setAttribute("post_page", post_page);
			session.setAttribute("postlist", listDto);
			
			post_page = (int)session.getAttribute("post_page");
			LOG.debug(" post_page last : {}", post_page);
			
			moveURL = "01_post.jsp";
			
			
		} catch (Exception e) {
			e.printStackTrace();
			LOG.debug(" exception : {} ", e);
		}
		
		return moveURL;
	} 

}
