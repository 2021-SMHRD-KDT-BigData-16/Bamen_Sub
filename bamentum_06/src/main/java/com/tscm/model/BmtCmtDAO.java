package com.tscm.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.tomcat.util.digester.FactoryCreateRule;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.tscm.db.SqlSessionManager;

public class BmtCmtDAO {
	private SqlSessionFactory factory =  SqlSessionManager.getFactory();

	public int cmtInsert(BmtCmtDTO dto) {
		int cnt=0;		
		SqlSession session = factory.openSession(true);
		try {
			cnt= session.insert("cmt_insert",dto);
		}finally {
			session.close();
		}
		return cnt;
	}
	
	public int cmtUpdate(BmtCmtDTO dto) {
		int cnt=0;		
		SqlSession session = factory.openSession(true);
		try {
			cnt= session.update("cmt_update",dto);
		}finally {
			session.close();
		}
		return cnt;
		
	}
	
	public int cmtDelete(BmtCmtDTO dto) {
		int cnt=0;		
		SqlSession session = factory.openSession(true);
		try {
			cnt= session.update("cmt_delete",dto);
		}finally {
			session.close();
		}
		return cnt;
		
	}
}
