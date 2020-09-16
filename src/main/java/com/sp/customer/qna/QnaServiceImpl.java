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
	public List<Qna> listBoard(Map<String, Object> map) {
		List<Qna> list = null;

		try {
			list = dao.selectList("qna.listQna", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public void insertBoard(Qna dto) throws Exception {

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
		
		Qna dto = null;
		
		try {
			dto = dao.selectOne("qna.readAnswer", parent);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Qna preReadQuestion(Map<String, Object> map) {
		
		Qna dto = null;
		
		try{
			dto = dao.selectOne("qna.preReadQuestion", map);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Qna nextReadQuestion(Map<String, Object> map) {

		Qna dto = null;
		
		try{
			dto = dao.selectOne("qna.nextReadQuestion", map);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateBoard(Qna dto) throws Exception {
		
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

	@Override
	public void insertCategory(Qna dto) throws Exception {
		
		try {
			dao.insertData("qna.insertCategory", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateCategory(Qna dto) throws Exception {
		
		try {
			dao.updateData("qna.updateCategory", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteCategory(int categoryNum) throws Exception {
		
		try {
			dao.deleteData("qna.deleteCategory", categoryNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
