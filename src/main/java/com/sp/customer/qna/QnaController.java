package com.sp.customer.qna;

import java.net.URLDecoder;
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

import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller("customer.qna.qnaController")
@RequestMapping(value = "/customer/qna/*")
public class QnaController {

	@Autowired
	private QnaService service;

	@Autowired
	private MyUtil myUtil;

	@RequestMapping(value = "list")
	public String list(
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			Model model) throws Exception {

		int rows = 10;
		int total_page;
		int dataCount;

		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "UTF-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);

		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(rows, dataCount);

		if (total_page < current_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * rows;
		if (offset < 0) {
			offset = 0;
		}

		map.put("offset", offset);
		map.put("rows", rows);

		List<Qna> list = service.listQna(map);

		int listNum, n = 0;
		for (Qna dto:list) {
			listNum = dataCount - (offset + n);
			dto.setListNum(listNum);
			n++;
		}

		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");

		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("paging", paging);
		model.addAttribute("total_page", total_page);

		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);

		return ".customer.qna.list";
	}
	
	@RequestMapping(value = "created", method = RequestMethod.GET)
	public String createdForm(Model model) throws Exception {
		List<Qna> listCategory = service.listCategory();

		model.addAttribute("pageNo", "1");
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("mode", "created");

		return ".customer.qna.created";
	}

	@RequestMapping(value = "created", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdSubmit(Qna dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state = "true";

		try {
			dto.setId(info.getId());
			service.insertQna(dto);
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);

		return model;
	}
}
