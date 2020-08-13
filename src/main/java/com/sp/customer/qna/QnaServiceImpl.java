package com.sp.customer.qna;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("customer.qna.qnaService")
public class QnaServiceImpl implements QnaService {

	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertQna(Qna dto) throws Exception {
		
		try {
			dao.insertData("qna.insertQna", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		
		return 0;
	}

	@Override
	public List<Qna> listQna(Map<String, Object> map) {
		
		return null;
	}

}
