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
import com.tscm.controller.LikeService;
import com.tscm.controller.LogInService;
import com.tscm.controller.LogoutService;
import com.tscm.controller.MorePageService;
import com.tscm.controller.MyProfile;
import com.tscm.controller.PostCreate;
import com.tscm.controller.PostDelete;
import com.tscm.controller.Search;
import com.tscm.controller.SelectMyPage;
import com.tscm.controller.SelectPost;
import com.tscm.controller.UpdateService;
import com.tscm.controller.Search;
import com.tscm.controller.BicNumIns;
import com.tscm.controller.CmtCreate;
import com.tscm.controller.CmtDelete;
import com.tscm.controller.FollowDelect;
import com.tscm.controller.FollowInsert;
import com.tscm.controller.FollowselectAll;
import com.tscm.controller.SelectPostOne;
import com.tscm.model.BmtPostDTO;
import com.tscm.model.BmtOnePostDTO;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger LOG = LoggerFactory.getLogger(FrontController.class);

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		LOG.debug(" {} service - start ", "FrontController");
		String moveURL = null;

		request.setCharacterEncoding("UTF-8");

		String uri = request.getRequestURI();
		String path = request.getContextPath();

		String strUriDo = uri.substring(path.length() + 1);

		LOG.debug("uri {}, path {}, substr : {}", uri, path, strUriDo);
		if (strUriDo.equals("LogIn.do")) {

			LogInService login = new LogInService();
			moveURL = login.execute(request, response);
			LOG.debug("LogInService moveURL {} ", moveURL);

		} else if (strUriDo.equals("PublicPage.do")) {
			SelectPost SelectPublic = new SelectPost();
			moveURL = SelectPublic.execute(request, response);
			LOG.debug("SelectPublic moveURL {} ", moveURL);
		
		} else if(strUriDo.equals("onePost.do")) {	
			LOG.debug("**** onePost moveURL {} ", moveURL);
			SelectPostOne selectpostone= new SelectPostOne();		
			moveURL = selectpostone.execute(request, response);
			HttpSession session = request.getSession();
			BmtOnePostDTO retDto = (BmtOnePostDTO)session.getAttribute("post");		
						
		} else if (strUriDo.equals("more_page.do")) {

			MorePageService more_page = new MorePageService();
			moveURL = more_page.execute(request, response);
			LOG.debug("MorePageService moveURL {} ", moveURL);
						
		} else if (strUriDo.equals("LikeService.do")) {

			LikeService like = new LikeService();
			moveURL = like.execute(request, response);
			LOG.debug("MorePageService moveURL {} ", moveURL);
						
		}else if (strUriDo.equals("Logout.do")) {

			LOG.debug("LogOutService start ");
			LogoutService logout = new LogoutService();
			moveURL = logout.execute(request, response);
			LOG.debug("LogOutService moveURL {} ", moveURL);

		} else if (strUriDo.equals("Join.do")) {
			
			JoinService join = new JoinService();
			moveURL = join.execute(request, response);
			LOG.debug("JoinService moveURL {} ", moveURL);			
			response.sendRedirect(moveURL);
			return;

		} else if (strUriDo.equals("MyPage.do")) {
			SelectMyPage mypage = new SelectMyPage();
			moveURL = mypage.execute(request, response);
			LOG.debug("SelectMyPage moveURL {} ", moveURL);

		} else if (strUriDo.equals("Update.do")) {
			UpdateService update = new UpdateService();
			moveURL = update.execute(request, response);
			LOG.debug("UpdateService moveURL {} ", moveURL);

		} else if(strUriDo.equals("PostCreate.do")) {
			PostCreate postwrite= new PostCreate();
			moveURL = postwrite.execute(request, response);
			LOG.debug("PostCreate moveURL {} ", moveURL);
			
		}else if(strUriDo.equals("PostDelete.do")) {
			PostDelete postdelete= new PostDelete();
			moveURL = postdelete.execute(request, response);
			LOG.debug("PostCreate moveURL {} ", moveURL);
			
		}else if(strUriDo.equals("CmtInput.do")) {
			CmtCreate cmtinput= new CmtCreate();
			moveURL = cmtinput.execute(request, response);
			LOG.debug("cmtService moveURL {} ", moveURL);
			
		} else if(strUriDo.equals("CmtDelete.do")) {
			CmtDelete cmtdelete= new CmtDelete();
			moveURL = cmtdelete.execute(request, response);
			LOG.debug("cmtService moveURL {} ", moveURL);
	// 2023.03.31 경수 추가			
		} else if(strUriDo.equals("BicNumIns.do")) {
			BicNumIns bic_num_ins= new BicNumIns();
			moveURL = bic_num_ins.execute(request, response);
			LOG.debug("BicNumIns moveURL {} ", moveURL);
		} else if(strUriDo.equals("MyProfile.do")) {
			MyProfile my_profile = new MyProfile();
			moveURL = my_profile.execute(request, response);
			LOG.debug("MyProfile moveURL {} ", moveURL);
	// 2023.04.01 추가 
		}else if(strUriDo.equals("FollowInsert.do")) {
			FollowInsert FollowInsert= new FollowInsert();
			moveURL = FollowInsert.execute(request, response);
			LOG.debug("FollowInsert moveURL {} ", moveURL);
			
		}else if(strUriDo.equals("FollowselectAll.do")) {
			
			System.out.println("확인2");
			FollowselectAll FollowselectAll= new FollowselectAll();
			moveURL = FollowselectAll.execute(request, response);
			System.out.println("FollowselectALL 이동!");
			LOG.debug("FollowselectAll moveURL {} ", moveURL);
			
		}else if(strUriDo.equals("FollowDelect.do")){
			FollowDelect FollowDelect= new FollowDelect();
			moveURL = FollowDelect.execute(request, response);
			LOG.debug("FollowDelect moveURL {} ", moveURL);
		
		}else if(strUriDo.equals("Search.do")) {
			Search search = new Search();
			moveURL = search.execute(request, response);
			LOG.debug("cmtService moveURL {} ", moveURL);
			
		}else {
			LOG.debug("FrontController : {}", "Unknown page");
		}
		
		

		if(moveURL != null) {
			RequestDispatcher rd =  request.getRequestDispatcher(moveURL);
			rd.forward(request, response);
		}
		
	}

}
