package com.sp.introduce;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("introduceController")
public class IntroduceController {

	@RequestMapping(value = "/introduce/introduce", method = RequestMethod.GET)
	public String method() {
		return "introduce/introduce";
	}
}
