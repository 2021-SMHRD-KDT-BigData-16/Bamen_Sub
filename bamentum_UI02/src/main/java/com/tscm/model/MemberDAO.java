package com.tscm.model;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.controller.JoinService;
import com.tscm.db.SqlSessionManager;

public class MemberDAO {
	private static final Logger LOG = LoggerFactory.getLogger(MemberDAO.class); 
	
	// data acess object >> 데이터베이스에 있는 데이터에 접근 도와주는 객체
	
	// 1. factory 가져오기(sqlsession 을 빌려올수 있는 공장 가져오기)
	private SqlSessionFactory factory =  SqlSessionManager.getFactory();

	public int join(MemberDTO dto) {
		LOG.debug(" join {} ", dto);
		int cnt = 0;
		// 회원가입 기능 수행 -> 데이터베이스에 데이터 추가하기.
		// 데이터베이스 접근하려면 connection(sqlsession) 필요
		
		// 1. sqlsession 빌려오기
		SqlSession session = factory.openSession(true);
		try {
			// 2. mapper.xml 파일 안에 있는 sql구문 중에 사용하고 싶은 sql 구문 정해주기
			// session 메소드 delete, update, insert, selectOne, selectAll
			// session.insert("mapper식별자.sql구문식별자", mapper파일로 넘기고 싶은 매개변수)
			//cnt = session.insert("com.smhrd.model.MemberDAO.join", dto);
			
			cnt = session.insert("join", dto);
			
		} finally {
			// 3. sqlssion 반납하기.
			session.close();
		}
		
		return cnt;
	}
	
	public MemberDTO login(MemberDTO dto) {
		MemberDTO retDto = null;

		System.out.printf("login - email: %s, pw : %s %n", dto.getEmail(), dto.getPw());
		
		SqlSession session = factory.openSession(true);
		try {
			retDto = session.selectOne("login", dto);
			if (retDto == null) {
				System.out.printf("login fail - retDto: %s %n", retDto);
			} else {
				System.out.printf("login success - email: %s %n", retDto.getEmail());
			}
			
		} finally {
			session.close();
		}
		
		return retDto;
	}	


	public int update(MemberDTO dto) {
		int iRet = 0;

		System.out.printf("update - email: %s, pw : %s %n", dto.getEmail(), dto.getPw());
		
		SqlSession session = factory.openSession(true);
		try {
			iRet = session.update("update", dto);
			if (iRet > 0) {
				System.out.printf("update success - iRet: %d %n", iRet);
			} else {
				System.out.printf("update fail - iRet: %d %n", iRet);
			}
			
		} finally {
			session.close();
		}
		
		return iRet;
	}	

	
}
