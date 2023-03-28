package com.tscm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.model.BmtPostDAO;
import com.tscm.model.BmtOnePostDTO;

public class SelectPost implements Command {
	private static final Logger LOG = LoggerFactory.getLogger(SelectPost.class); 

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		LOG.debug(" {} service - start ", "SelectPublic");
		String moveURL = null;
		try {
			request.setCharacterEncoding("UTF-8");
			BmtPostDAO dao = new BmtPostDAO();
			List<BmtOnePostDTO> listDto = dao.selectAllPost();
			
			if(listDto != null)
			{
				LOG.debug("PublicPage - listDto size {}", listDto.size());
				request.setAttribute("listPage", listDto);
			}
			else {
				LOG.debug("PublicPage - listDto null");
			}

			moveURL = "01_post.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			LOG.debug(" exception : {} ", e);
			
		}
		
		return moveURL;
	}

}
