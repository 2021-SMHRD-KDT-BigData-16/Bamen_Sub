package com.tscm.FrontController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.controller.JoinService;
import com.tscm.controller.LogInService;
import com.tscm.controller.LogoutService;
import com.tscm.controller.SelectMyPage;
import com.tscm.controller.SelectPublic;
import com.tscm.controller.UpdateService;
import com.tscm.controller.cmtService;
import com.tscm.controller.selectOrigin;
import com.tscm.model.BmtPostDTO;
import com.tscm.model.BmtPtDetailDTO;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger LOG = LoggerFactory.getLogger(JoinService.class);

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		LOG.debug(" {} service - start ", "FrontController");
		String moveURL = null;

		request.setCharacterEncoding("UTF-8");

		String uri = request.getRequestURI();
		String path = request.getContextPath();

		// 3. 1~2번을 활용하여 필요한 요청 이름 확인!
		String strUriDo = uri.substring(path.length() + 1);

		LOG.debug("uri {}, path {}, substr : {}", uri, path, strUriDo);
		if (strUriDo.equals("LogIn.do")) {

			LogInService login = new LogInService();
			moveURL = login.execute(request, response);
			LOG.debug("LogInService moveURL {} ", moveURL);

		} else if (strUriDo.equals("PublicPage.do")) {
			SelectPublic SelectPublic = new SelectPublic();
			moveURL = SelectPublic.execute(request, response);
			LOG.debug("SelectPublic moveURL {} ", moveURL);
		
		} else if(strUriDo.equals("selectOrigin.do")) {
		
			selectOrigin selectOrigin = new selectOrigin();		
			moveURL = selectOrigin.execute(request, response);
			HttpSession session = request.getSession();
			BmtPtDetailDTO retDto = (BmtPtDetailDTO)session.getAttribute("post");
						
						
		} else if (strUriDo.equals("Logout.do")) {

			LOG.debug("LogOutService start ");
			LogoutService logout = new LogoutService();
			moveURL = logout.execute(request, response);
			LOG.debug("LogOutService moveURL {} ", moveURL);

		} else if (strUriDo.equals("Join.do")) {
			
			JoinService join = new JoinService();
			moveURL = join.execute(request, response);
			LOG.debug("JoinService moveURL {} ", moveURL);

		} else if (strUriDo.equals("MyPage.do")) {
			SelectMyPage mypage = new SelectMyPage();
			moveURL = mypage.execute(request, response);
			LOG.debug("SelectMyPage moveURL {} ", moveURL);

		} else if (strUriDo.equals("Update.do")) {
			UpdateService update = new UpdateService();
			moveURL = update.execute(request, response);
			LOG.debug("UpdateService moveURL {} ", moveURL);

		} else if(strUriDo.equals("cmtInput.do")) {
			cmtService cmtinput= new cmtService();
			moveURL = cmtinput.execute(request, response);
			LOG.debug("cmtService moveURL {} ", moveURL);
			
		} else {
			LOG.debug("FrontController : {}", "잘못된 요청값");
		}

		RequestDispatcher rd =  request.getRequestDispatcher(moveURL);
		rd.forward(request, response);
		
	}

}
