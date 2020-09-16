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

		List<Qna> list = service.listBoard(map);

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

		return "customer/qna/list";
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
			service.insertBoard(dto);
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);

		return model;
	}
	
	@RequestMapping(value = "article")
	public String article(
			@RequestParam int num,
			@RequestParam String pageNo,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "UTF-8");
		}
		
		Qna qnaDto = service.readQna(num);
		if (qnaDto == null) {
			return "customer/error";
		}
		
		if (qnaDto.getQuestionPrivate() == 1 && (! info.getId().equals("admin") && ! info.getId().equals(qnaDto.getId()))) {
			return "customer/error";
		}
		
		qnaDto.setContent(qnaDto.getContent().replaceAll("\n", "<br>"));
		
		Qna answerDto = service.readAnswer(qnaDto.getNum());
		if (answerDto != null) {
			answerDto.setContent(answerDto.getContent().replaceAll("\n", "<br>"));
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", qnaDto.getNum());
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		Qna preReadDto = service.preReadQuestion(map);
		Qna nextReadDto = service.nextReadQuestion(map);
		
		model.addAttribute("qnaDto", qnaDto);
		model.addAttribute("answerDto", answerDto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("pageNo", pageNo);
		
		return "customer/qna/article";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String updateForm(
			@RequestParam int num,
			@RequestParam String pageNo,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Qna dto = service.readQna(num);
		if (dto == null) {
			return "customer/error";
		}
		
		if (!info.getId().equals(dto.getId())) {
			return "customer/error";
		}
		
		List<Qna> listCategory = service.listCategory();
		
		model.addAttribute("mode", "update");
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("dto", dto);
		model.addAttribute("listCategory", listCategory);
		
		return "customer/qna/created";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateSubmit(Qna dto, HttpSession session) throws Exception {
		
		String state = "true";
		
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			dto.setId(info.getId());
			service.updateBoard(dto);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(
			@RequestParam int num,
			@RequestParam String mode,
			HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		String state = "false";
		
		Qna dto = service.readQna(num);
		if (dto != null) {
			if (info.getId().equals(dto.getId()) || info.getId().equals("admin")) {
				try {
					if (mode.equals("question")) {
						service.deleteQna(num);
					} else if (mode.equals("answer")) {
						service.deleteAnswer(num);
					}
					state = "true";
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping(value = "answer", method = RequestMethod.GET)
	public String answerForm(
			@RequestParam int num,
			@RequestParam String pageNo,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Qna dto = service.readQna(num);
		if(dto == null) {
			return "customer/error";
		}
		
		if(!info.getId().equals("admin")) {
			return "customer/error";
		}
		
		dto.setContent("[" + dto.getSubject() + "]에 대한 답변입니다.\n");
		
		List<Qna> listCategory = service.listCategory();
		
		model.addAttribute("mode", "answer");
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("dto", dto);
		model.addAttribute("listCategory", listCategory);
		
		return "customer/qna/created";		
	}
	
	@RequestMapping(value = "answer", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> answerSubmit(
			Qna dto,
			HttpSession session) throws Exception {
		
		String state = "true";
		
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			dto.setId(info.getId());
			service.insertBoard(dto);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		
		model.put("state", state);
		
		return model;
	}
}
