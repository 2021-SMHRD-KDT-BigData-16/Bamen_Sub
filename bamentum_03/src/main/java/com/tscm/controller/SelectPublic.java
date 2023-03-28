package com.tscm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.model.BmtDAO;
import com.tscm.model.BmtPtDetailDTO;

public class SelectPublic implements Command {
	private static final Logger LOG = LoggerFactory.getLogger(SelectMyPage.class); 

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		LOG.debug(" {} service - start ", "SelectPublic");
		String moveURL = null;
		try {
			request.setCharacterEncoding("UTF-8");
			BmtDAO dao = new BmtDAO();
			List<BmtPtDetailDTO> listDto = dao.selectAllPost();
			
			if(listDto != null)
			{
				LOG.debug("PublicPage - listDto size {}", listDto.size());
				request.setAttribute("listPage", listDto);
			}
			else {
				LOG.debug("PublicPage - listDto null");
			}
			
			moveURL = "post.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			LOG.debug(" exception : {} ", e);
			
		}
		
		return moveURL;
	}

}
