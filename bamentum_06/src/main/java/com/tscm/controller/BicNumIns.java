package com.tscm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class BicNumIns implements Command {
	private static final Logger LOG = LoggerFactory.getLogger(BicNumIns.class);

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String moveURL = null;
		try {

			request.setCharacterEncoding("UTF-8");
			String b_brand = request.getParameter("b_brand");
			String b_model = request.getParameter("b_model");
			String b_num = request.getParameter("b_num");
			String b_img = request.getParameter("b_img");
			LOG.debug("b_brand : {}, b_model : {}, b_num : {} b_img {} ", b_brand, b_model, b_num, b_img);
		} catch (Exception e) {
			e.printStackTrace();
			LOG.debug(" exception : {} ", e);
		}

		return moveURL;
	}

}
