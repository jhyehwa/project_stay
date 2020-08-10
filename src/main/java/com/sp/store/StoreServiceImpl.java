package com.sp.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("storeService")
public class StoreServiceImpl implements StoreService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<StoreCategory> categoryList() throws Exception {
		List<StoreCategory> categoryList =null;
		try {
			categoryList = dao.selectList("store.categoryList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return categoryList;
	}
	
}
