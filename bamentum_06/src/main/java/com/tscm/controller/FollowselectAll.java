package com.tscm.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.model.BmtFollowDAO;
import com.tscm.model.BmtFollowDTO;

public class FollowselectAll implements Command{
	private static final Logger LOG = LoggerFactory.getLogger(FollowselectAll.class);

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Followselect이동완료!");
		String moveURL = null;
		HttpSession session = request.getSession();
		
		try {
			String follower = (String)session.getAttribute("email");
			LOG.debug(" {} service - start1 ", "FwSelectService");
			request.setCharacterEncoding("UTF-8");
			
			System.out.println("Followselect - U_Email 값 들어오는거 확인");
		
			BmtFollowDAO dao = new BmtFollowDAO();
			BmtFollowDTO dto = new BmtFollowDTO(follower);
			ArrayList<BmtFollowDTO> dtoList = dao.Follow_SelectAll(dto);
			
			session.setAttribute("fw_dtoList", dtoList);
			moveURL = "07_follow.jsp";
			
		} catch (Exception e) {
			e.printStackTrace();
			LOG.debug(" exception : {} ", e);
		}
		
		return moveURL;
	}

}