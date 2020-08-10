package com.sp.store;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("storeController")
@RequestMapping("/store/*")
public class StoreController {
	
	@Autowired
	private StoreService storeService;
	
	@RequestMapping(value="list", method= RequestMethod.GET)
	public String list(Model model) {
		
		List<StoreCategory> categoryList = new ArrayList<StoreCategory>();
		
		try {
			categoryList = storeService.categoryList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("categoryList", categoryList);
		
		return ".store.list";
	}
	
}
