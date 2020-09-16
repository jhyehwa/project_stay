package com.sp.customer.qna;

import java.util.List;
import java.util.Map;

public interface QnaService {
	public void insertBoard(Qna dto) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<Qna> listBoard(Map<String, Object> map);
	
	public List<Qna> listCategory();
	
	public Qna readQna(int num);
	public Qna readAnswer(int parent);
	
	public Qna preReadQuestion(Map<String, Object> map);
	public Qna nextReadQuestion(Map<String, Object> map);
	
	public void updateBoard(Qna dto) throws Exception;
	
	public void deleteQna(int num) throws Exception;
	public void deleteAnswer(int num) throws Exception;
	
	public void insertCategory(Qna dto) throws Exception;
	public void updateCategory(Qna dto) throws Exception;
	public void deleteCategory(int categoryNum) throws Exception;
}
