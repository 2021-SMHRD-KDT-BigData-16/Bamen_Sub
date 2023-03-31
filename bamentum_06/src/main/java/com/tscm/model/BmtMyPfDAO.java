package com.tscm.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.db.SqlSessionManager;

public class BmtMyPfDAO {
	private static final Logger LOG = LoggerFactory.getLogger(BmtMyPfDAO.class); 
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

	public ArrayList<BmtBicDTO> select_bic_list(BmtUserDTO dto) {
		ArrayList<BmtBicDTO>  retDto = null;

		LOG.debug(" select_user email: {} ", dto.getU_email());
		
		SqlSession session = factory.openSession(true);
		try {
			retDto = session.selectOne("bmt_select_bic_list", dto);
			if (retDto == null) {
				LOG.debug(" login fail : {} ", retDto);
			} else {
				LOG.debug(" login success : {} ", retDto);
				
//				LOG.debug(" login success email : {} : {} : {} ", 
//						retDto.getU_email(), retDto.getU_nick(), retDto.getU_profile());
			}
			
		} finally {
			session.close();
		}
		
		return retDto;
	}	

	

}
