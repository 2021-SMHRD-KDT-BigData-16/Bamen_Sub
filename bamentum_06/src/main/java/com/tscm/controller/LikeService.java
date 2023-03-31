package com.tscm.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;
import com.tscm.model.BmtLikeDAO;
import com.tscm.model.BmtLikeDTO;
import com.tscm.model.BmtUserDTO;

public class LikeService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = null;
		
		try {
			out =response.getWriter();
			HttpSession session = request.getSession();
			BmtUserDTO user = (BmtUserDTO) session.getAttribute("user");
			
			String u_email = (String) session.getAttribute("email");
			String temp = request.getParameter("p_idx");
			Long p_idx= Long.parseLong(temp);
			System.out.println(u_email+p_idx);

			BmtLikeDTO dtolike = new BmtLikeDTO();
			dtolike.setP_idx(p_idx);
			dtolike.setU_email(u_email);

			BmtLikeDAO daolike = new BmtLikeDAO();
						
			daolike.likeInsert(dtolike);
//			
			int cnt=daolike.showLike(dtolike);
			System.out.println("좋아요 수"+cnt);			
			
			out.print("{\"resCode\":1}");
			
		} catch (Exception e) {
			e.printStackTrace();
			out.print("{\"resCode\":0}");
			
		}
		return null;
	}
}
