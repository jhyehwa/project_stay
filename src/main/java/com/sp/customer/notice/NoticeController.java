package com.sp.customer.notice;

import java.io.File;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.FileManager;
import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller("customer.noticeController")
@RequestMapping("/customer/notice/*")
public class NoticeController {

	@Autowired
	private NoticeService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value = "list")
	public String list(
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			Model model) throws Exception {
		
		int rows = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "UTF-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("condition", condition);
		
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		List<Notice> noticeList = null;
		if(current_page == 1) {
			noticeList = service.listNoticeTop();
		}
		
		int offset = (current_page - 1) * rows;
		if(offset < 0) {
			offset = 0;
		}
		
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<Notice> list = service.listNotice(map);
		
		Date endDate = new Date();
		long gap;
		int listNum, n = 0;
		for(Notice dto : list) {
			listNum = dataCount - (offset + n);
			dto.setListNum(listNum);
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");
			Date beginDate = formatter.parse(dto.getCreated());
			
			gap = (endDate.getTime() - beginDate.getTime()) / (60 * 60 * 1000);
			dto.setGap(gap);
			dto.setCreated(dto.getCreated().substring(0, 10));
			
			n++;
		}
		
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("list", list);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return "customer/notice/list";
	}
	
	@RequestMapping(value = "created", method = RequestMethod.GET)
	public String createdForm(Model model) throws Exception {
		model.addAttribute("pageNo", "1");
		model.addAttribute("mode", "created");
		
		return "customer/notice/created";
	}
	
	@RequestMapping(value = "created", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdSubmit(Notice dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state = "false";
		
		if(info.getId().equals("admin")) {
			try {
				String root = session.getServletContext().getRealPath("/");
				String pathName = root + "uploads" + File.separator + "notice";
				
				dto.setId(info.getId());
				service.insertNotice(dto, pathName);
				state = "true";
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		return model;
	}
}
