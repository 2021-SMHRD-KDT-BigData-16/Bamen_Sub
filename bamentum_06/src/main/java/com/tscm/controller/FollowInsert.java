package com.tscm.controller;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.model.BmtFollowDAO;
import com.tscm.model.BmtFollowDTO;

public class FollowInsert implements Command { 
	String moveURL = null;
	
   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response) {
	   	Logger LOG = LoggerFactory.getLogger(getClass());
		LOG.debug(" page Start : {} ", "followPageInsert.jsp");
            try {
               // 1. 한글 인코딩 잡아주기
               request.setCharacterEncoding("UTF-8");
               // 2. 요청받은 데이터들 꺼내오기
               String follower = request.getParameter("follower");
   			   String following = request.getParameter("following");
               
               // 3. 요청받은 데이터들을 하나의 자료형으로 묶어주기
               BmtFollowDTO dto = new BmtFollowDTO(follower , following);
               //4.  팔로우 기능 수행하기
               BmtFollowDAO dao = new BmtFollowDAO();
               LOG.debug(" DAOstart: {} ", "followPageInsert.jsp");
               int cnt = dao.following(dto);
               if(cnt > 0) {
                  // 5. 팔로우가 성공했다면 join_success.jsp로 forward방식 이동
                  // ---> request scope 영역에 회원가입한 을 저장해서 이동
            	  LOG.debug(" DAOsussess: {} ", "followPageInsert.jsp");
                  request.setAttribute("follower", follower);
                  moveURL = "06_follow.jsp";
               }else {
                  // 6. 회원가입 실패했다면 main.jsp로 redirect방식 이동
            	 LOG.debug(" DAOfail: {} ", "followPageInsert.jsp");
                  moveURL = "06_follow.jsp";
               }
            } catch (UnsupportedEncodingException e) {
              LOG.debug(" DAOerror!: {} ", "followPageInsert.jsp");
               e.printStackTrace();
            }
            return moveURL;
   }



}