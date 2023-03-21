package com.tscm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.model.BmtPostDTO;
import com.tscm.model.BmtUserDAO;
import com.tscm.model.BmtUserDTO;

@WebServlet("/SelectMyPage")
public class SelectMyPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger LOG = LoggerFactory.getLogger(LogInService.class); 

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LOG.debug(" {} service - start ", "SelectMyPage");
		request.setCharacterEncoding("UTF-8");
		BmtUserDAO dao = new BmtUserDAO();
		
		HttpSession session = request.getSession();
		BmtUserDTO retDto = (BmtUserDTO)session.getAttribute("user");
		String email = retDto.getEmail();
		
		LOG.debug(" email {}  ", email);
		List<BmtPostDTO> listDto = dao.selectMyPage(retDto);
		
		if(listDto != null)
		{
			LOG.debug("SelectMyPage - listDto size {}", listDto.size());
			request.setAttribute("listMyPage", listDto);
		}
		else {
			LOG.debug("SelectMyPage - listDto null");
		}
		
		RequestDispatcher rd =  request.getRequestDispatcher("select.jsp");
		rd.forward(request, response);
		
	}

}
