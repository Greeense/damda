package com.bit.pro.dao;

import java.util.List;

import com.bit.pro.vo.QnaVo;

public interface QnaDao {
	
	List<QnaVo> selectQna() throws Exception;
	int insertQna(QnaVo qnaVo) throws Exception;
}
