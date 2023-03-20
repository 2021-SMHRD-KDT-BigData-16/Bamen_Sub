package com.tscm.model;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.controller.JoinService;
import com.tscm.db.SqlSessionManager;

public class MemberDAO {
	
	private SqlSessionFactory factory =  SqlSessionManager.getFactory();
	private static Logger LOG = LoggerFactory.getLogger(MemberDAO.class); 

	public int join(MemberDTO dto) {
		int cnt = 0;
		SqlSession session = factory.openSession(true);
		try {
			cnt = session.insert("join", dto);
			LOG.debug("insert join - cnt: {} ", cnt);
			
		} finally {
			session.close();
		}
		
		return cnt;
	}
	
	public MemberDTO login(MemberDTO dto) {
		MemberDTO retDto = null;

		LOG.debug("login - email: {}, pw : {} ", dto.getEmail(), dto.getPw());
		
		SqlSession session = factory.openSession(true);
		try {
			retDto = session.selectOne("login", dto);
			if (retDto == null) {
				LOG.debug("login fail - retDto: {} ", retDto);
			} else {
				LOG.debug("login success - email: {} ", retDto.getEmail());
			}
			
		} finally {
			session.close();
		}
		
		return retDto;
	}	

	
}
