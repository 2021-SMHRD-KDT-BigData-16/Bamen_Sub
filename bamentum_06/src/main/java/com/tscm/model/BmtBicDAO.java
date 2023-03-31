package com.tscm.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.db.SqlSessionManager;

public class BmtBicDAO {
	private static final Logger LOG = LoggerFactory.getLogger(BmtBicDAO.class); 
	private SqlSessionFactory factory =  SqlSessionManager.getFactory();
	
	public int bic_insert(BmtBicDTO dto) {
		LOG.debug(" bic_insert {} ", dto);
		int cnt = 0;
		SqlSession session = factory.openSession(true);
		try {
			cnt = session.insert("bic_insert", dto);
			
		} finally {
			session.close();
		}
		
		return cnt;
	}

	

}
