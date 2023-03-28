package com.tscm.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tscm.db.SqlSessionManager;

public class BmtUserDAO {
	
	private static final Logger LOG = LoggerFactory.getLogger(BmtUserDAO.class); 
	
	private SqlSessionFactory factory =  SqlSessionManager.getFactory();

	public int join(BmtUserDTO dto) {
		LOG.debug(" join {} ", dto);
		int cnt = 0;
		SqlSession session = factory.openSession(true);
		try {
			cnt = session.insert("bmt_join", dto);
			
		} finally {
			session.close();
		}
		
		return cnt;
	}

	
	
	public BmtUserDTO login(BmtUserDTO dto) {
		BmtUserDTO retDto = null;

		LOG.debug(" login email: {}, pw:{} ", dto.getU_email(), dto.getU_pw());
		
		SqlSession session = factory.openSession(true);
		try {
			retDto = session.selectOne("bmt_login", dto);
			if (retDto == null) {
				LOG.debug(" login fail : {} ", retDto);
			} else {
				LOG.debug(" login success email : {} ", retDto.getU_email());
			}
			
		} finally {
			session.close();
		}
		
		return retDto;
	}	

/*
	public int update(BmtUserDTO dto) {
		int iRet = 0;

		LOG.debug(" update email: {}, pw:{} ", dto.getEmail(), dto.getPw());
		
		SqlSession session = factory.openSession(true);
		try {
			iRet = session.update("bmt_update", dto);
			if (iRet > 0) {
				LOG.debug(" update success - iRet: {}", iRet);
			} else {
				LOG.debug(" update fail - iRet: {} ", iRet);
			}
			
		} finally {
			session.close();
		}
		
		return iRet;
	}	

	public List<BmtPostDTO> selectMyPage(BmtUserDTO dtoGet) {
		List<BmtPostDTO> listDto = null;

		LOG.debug("selectMyPage start email {}", dtoGet.getEmail());
		
		SqlSession session = factory.openSession(true);
		try {
			listDto = session.selectList("bmt_selectMyPage", dtoGet);
			if (listDto != null) {
				for(int i=0; i< listDto.size(); i++)
				{
					LOG.debug("selectMyPage - {} : {} ", 
							i, listDto.get(i).getP_content());
				}
			} else {
				LOG.debug("selectMyPage fail");
			}
			
		} finally {
			session.close();
		}
		
		return listDto;
	}	

	public List<BmtPostDTO> selectPublic() {
		List<BmtPostDTO> listDto = null;

		LOG.debug("selectPublic start ");
		
		SqlSession session = factory.openSession(true);
		try {
			listDto = session.selectList("bmt_selectPublic");
			if (listDto != null) {
				for(int i=0; i< listDto.size(); i++)
				{
					LOG.debug("selectPublic - {} : {} ", 
							i, listDto.get(i).getP_content());
				}
			} else {
				LOG.debug("selectPublic fail");
			}
			
		} finally {
			session.close();
		}
		
		return listDto;
	}
	
	public BmtOnePostDTO selectOrigin(BmtOnePostDTO dtoget) {
		BmtOnePostDTO dto =null;
		
		LOG.debug("selectOrigin start {}", dtoget.getPostId());
		SqlSession session = factory.openSession(true);
		LOG.debug("selectOrigin start1 {}", dtoget.getPostId());
		try {
			LOG.debug("selectOrigin start2 {}", dtoget.getPostId());
			
			dto=session.selectOne("bmt_selectOrigin", dtoget);
			LOG.debug("selectOrigin start3 {}", dtoget.getPostId());
			
			if(dto!=null) {
				LOG.debug("selectOrigin - {} : {} ", dto.getPostId());
				
			}else {
				LOG.debug("selectOrigin fail");
			}			
		}finally {
			session.close();
		}
		return dto;
	}
	
	public BmtPostDTO selectPost(BmtPostDTO dtoget) {
		BmtPostDTO dto =null;
		
		LOG.debug("selectPost start {}", dtoget.getPostId());
		SqlSession session = factory.openSession(true);
		LOG.debug("selectPost start1 {}", dtoget.getPostId());
		try {
			LOG.debug("selectPost start2 {}", dtoget.getPostId());
			
			dto=session.selectOne("bmt_selectPost", dtoget);
			LOG.debug("selectPost start3 {}", dtoget.getPostId());
			
			if(dto!=null) {
				LOG.debug("selectPost - {} : {} ", dto.getPostId());
				
			}else {
				LOG.debug("selectPost fail");
			}			
		}finally {
			session.close();
		}
		return dto;
	}
	
	public BmtOnePostDTO selectOnePost(BmtOnePostDTO dtoget) {
		BmtOnePostDTO dto =null;
		
		LOG.debug("selectOnePost start {}", dtoget.getPostId());
		SqlSession session = factory.openSession(true);
		LOG.debug("selectOnePost start1 {}", dtoget.getPostId());
		try {
			LOG.debug("selectOnePost start2 {}", dtoget.getPostId());
			
			dto=session.selectOne("bmt_selectOnePost", dtoget);
			LOG.debug("selectOnePost start3 {}", dtoget.getPostId());
			
			if(dto!=null) {
				LOG.debug("selectOnePost - {} ", dto.getPostId());
				
			}else {
				LOG.debug("selectOnePost fail");
			}			
		}finally {
			session.close();
		}
		return dto;
	}
*/	

	

}
