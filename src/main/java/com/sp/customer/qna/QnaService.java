package com.sp.customer.qna;

import java.util.List;
import java.util.Map;

public interface QnaService {
	public void insertQna(Qna dto) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<Qna> listQna(Map<String, Object> map);
	
	public List<Qna> listCategory();
	
	public Qna readQna(int num);
	public Qna readAnswer(int parent);
	
	public Qna preReadQuestion(Map<String, Object> map);
	public Qna nextReadQuestion(Map<String, Object> map);
}
