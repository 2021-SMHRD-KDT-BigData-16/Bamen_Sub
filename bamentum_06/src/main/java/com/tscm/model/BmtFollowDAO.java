package com.tscm.model;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.db.SqlSessionManager;


public class BmtFollowDAO{
	private static final Logger LOG = LoggerFactory.getLogger(BmtFollowDAO.class); 
	private SqlSessionFactory factory = SqlSessionManager.getFactory();

	
	public BmtUserDTO select_user(BmtUserDTO dto) {
		BmtUserDTO retDto = null;

		LOG.debug(" select_user email: {} ", dto.getU_email());
		
		SqlSession session = factory.openSession(true);
		try {
			retDto = session.selectOne("bmt_select_user", dto);
			if (retDto == null) {
				LOG.debug(" login fail : {} ", retDto);
			} else {
				LOG.debug(" login success email : {} : {} : {} ", 
						retDto.getU_email(), retDto.getU_nick(), retDto.getU_profile());
			}
			
		} finally {
			session.close();
		}
		
		return retDto;
	}	

	public ArrayList<BmtFwDetailDTO> select_follow(BmtUserDTO dto) {
		ArrayList<BmtFwDetailDTO>  listDto = null;

		LOG.debug(" select_follow email: {} ", dto.getU_email());
		
		SqlSession session = factory.openSession(true);
		try {
			
			listDto = (ArrayList)session.selectList("bmt_select_fw_detail", dto);
			if (listDto != null) {
				for(int i=0; i< listDto.size(); i++)
				{
					LOG.debug("select_follow - {} : {} - {} , {} , {}", 
							listDto.get(i).getFollower(), listDto.get(i).getFollowing(), 
							listDto.get(i).getF_date(), listDto.get(i).getU_nick(), 
							listDto.get(i).getU_profile() );
				}
			} else {
				LOG.debug("{} Fail ", "select_follow" );
			}
			
		} finally {
			session.close();
		}
		
		return listDto;
	}	
	
	
/*	
	public int following(BmtFollowDTO dto) {
		LOG.debug(" DAO 시작 ", dto);
		int cnt = 0;
		SqlSession session = factory.openSession(true);
		try {

			
			cnt = session.insert("bmt_following", dto);
			
		} finally {
			session.close();
			
		}
		LOG.debug(" DAO 끝 ", dto);
		return cnt;
	}
	
	ArrayList<BmtFollowDTO> list = null;
//	MemberDTO를 타입형으로 지정하는거 
	public ArrayList<BmtFollowDTO> Follow_SelectAll(BmtFollowDTO dto) {
		System.out.println("확인DTO시작");
		
		SqlSession session = factory.openSession(true);
		try {
			list= (ArrayList)session.selectList("Follow_selectAll",dto);
		}finally {
			session.close();
		}
		System.out.println("확인DTO끝");
		return list;
	}
	

	public int bmt_Unfollow (BmtFollowDTO dto) {
		LOG.debug(" DAO-delete 시작 ", dto);
		int cnt = 0;
		SqlSession session = factory.openSession(true);
		try {

			LOG.debug(" DTO :{},{} " , dto.getFollower(), dto.getFollowing());
			
			cnt = session.insert("bmt_Unfollow", dto);
			
		} finally {
			session.close();
			
		}
		LOG.debug(" DAO-delete끝 " , dto);
		return cnt;
	}
	
*/	
	
	
}
