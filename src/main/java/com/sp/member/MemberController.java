package com.sp.member;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller("member.memberController")
public class MemberController {

	@Autowired
	private MemberService service;

	@RequestMapping(value = "/member/member", method = RequestMethod.GET)
	public String memberForm(Model model) throws Exception {
		model.addAttribute("mode", "member");
		return ".member.member";
	}

	@RequestMapping(value = "/member/member", method = RequestMethod.POST)
	public String memberSubmit(Member dto, final RedirectAttributes reAttr, Model model, HttpSession session) {		
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "member";

			dto.setTel(dto.getTel().replaceAll("-", ""));

			String tel1 = dto.getTel().substring(0, 3);
			String tel2 = dto.getTel().substring(3, 7);
			String tel3 = dto.getTel().substring(7);

			dto.setTel(tel1 + "-" + tel2 + "-" + tel3);
			
			service.insertMember(dto, pathname);
		} catch (Exception e) {
			model.addAttribute("mode", "member");
			model.addAttribute("message", "회원가입 실패");

			return ".member.member";
		}

		StringBuilder sb = new StringBuilder();
		sb.append(dto.getName() + "님의 회원 가입이 정상적으로 처리되었습니다.<br>");

		reAttr.addFlashAttribute("message", sb.toString());
		reAttr.addFlashAttribute("title", "회원 가입");

		return "redirect:/member/complete";
	}

	@RequestMapping(value = "/member/complete")
	public String complete(@ModelAttribute("message") String message) throws Exception {
		if (message == null || message.length() == 0) {
			return "redirect:/";
		}

		return ".member.complete";
	}

	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String loginForm() {
		return ".member.login";
	}

	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	public String loginSubmit(@RequestParam String id, @RequestParam String pwd, HttpSession session, Model model) throws Exception {
		Member dto = service.loginMember(id);
		if (dto == null || !pwd.equals(dto.getPwd())) {
			model.addAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
			return ".member.login";
		}

		SessionInfo info = new SessionInfo();
		info.setId(dto.getId());
		info.setName(dto.getName());

		session.setAttribute("member", info);

		String uri = (String) session.getAttribute("preLoginURI");
		session.removeAttribute("preLoginURI");
		if (uri == null) {
			uri = "redirect:/";
		} else {
			uri = "redirect:" + uri;
		}

		return uri;
	}

	@RequestMapping(value = "/member/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("member");

		session.invalidate();

		return "redirect:/";
	}
	
	@RequestMapping(value = "/member/pwd", method = RequestMethod.GET)
	public String pwdForm(String memberOut, Model model) {
		if(memberOut == null) {
			model.addAttribute("mode", "update");
		} else {
			model.addAttribute("mode", "memberOut");
		}
		
		return ".member.pwd";
	}
	
	@RequestMapping(value = "/member/pwd", method = RequestMethod.POST)
	public String pwdSubmit(@RequestParam String pwd, @RequestParam String mode, final RedirectAttributes reAttr, Model model, HttpSession session) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Member dto = service.readMember(info.getId());
		if(dto == null) {
			session.invalidate();
			return "redirect:/";
		}
		
		if(!dto.getPwd().equals(pwd)) {
			if(mode.equals("update")) {
				model.addAttribute("mode", "update");
			} else {
				model.addAttribute("mode", "memberOut");
			}
			model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
			return ".member.pwd";
		}
		
		if(mode.equals("memberOut")) {
			session.removeAttribute("member");
			session.invalidate();
			
			StringBuilder sb = new StringBuilder();
			sb.append(dto.getName() + "님의 회원 탈퇴가 정상적으로 처리되었습니다.");
			
			reAttr.addFlashAttribute("title", "회원 탈퇴");
			reAttr.addFlashAttribute("message", sb.toString());
			
			return "redirect:/member/complete";
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		
		return ".member.member";
	}
	
	@RequestMapping(value = "/member/idCheck", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> idCheck(@RequestParam String id) throws Exception {
		String p = "true";
		
		Member dto = service.readMember(id);
		if(dto != null) {
			p = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("passed", p);
		
		return model;
	}

	@RequestMapping(value = "/member/update", method = RequestMethod.POST)
	public String updateSubmit(Member dto, final RedirectAttributes reAttr, Model model) {

		try {
			service.updateMember(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		StringBuilder sb = new StringBuilder();
		sb.append(dto.getName() + "님의 정보가 정상적으로 변경되었습니다.");

		reAttr.addFlashAttribute("title", "회원 정보 수정");
		reAttr.addFlashAttribute("message", sb.toString());

		return "redirect:/member/complete";
	}
}
