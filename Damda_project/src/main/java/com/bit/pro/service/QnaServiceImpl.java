package com.bit.pro.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bit.pro.dao.QnaDao;
import com.bit.pro.vo.QnaVo;

@Service("qnaService")
public class QnaServiceImpl implements QnaService {
	
	private static final Logger logger = LoggerFactory.getLogger(QnaServiceImpl.class);

	@Resource(name="qnaDao")
	private QnaDao qnaDao;

	@Override
	public List<QnaVo> selectQna() throws Exception {
		logger.debug("���: "+qnaDao.selectQna());
		return qnaDao.selectQna();
	}

	@Override
	public int insertQna(QnaVo qnaVo) throws Exception {
		return qnaDao.insertQna(qnaVo);
	}
	

}
