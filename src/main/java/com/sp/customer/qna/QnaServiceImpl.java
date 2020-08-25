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
	public List<Qna> listQna(Map<String, Object> map) {
		List<Qna> list = null;

		try {
			list = dao.selectList("qna.listQna", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

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
		int result = 0;
		
		try {
			result = dao.selectOne("qna.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public List<Qna> listCategory() {
		List<Qna> list = null;
		
		try {
			list = dao.selectList("qna.listCategory");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public Qna readQna(int num) {
		Qna dto = null;
		
		try {
			dto = dao.selectOne("qna.readQna", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Qna readAnswer(int parent) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Qna preReadQuestion(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Qna nextReadQuestion(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateQna(Qna dto) throws Exception {
		
		try {
			dao.selectOne("qna.updateQna", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteQna(int num) throws Exception {
		
		try {
			dao.deleteData("qna.deleteQna", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteAnswer(int num) throws Exception {
		
		try {
			dao.deleteData("qna.deleteAnswer", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
