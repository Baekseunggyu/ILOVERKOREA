package kr.ac.kopo.kor.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.kor.model.Notice;
import kr.ac.kopo.kor.service.NoticeService;
import kr.ac.kopo.kor.util.Pager;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	private final String path = "notice/";

	@Autowired
	NoticeService service;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(dateFormat, false));
	}

	@GetMapping("/view/{noticeId}")
	public String view(@PathVariable int noticeId, Model model) {
		Notice item = service.item(noticeId);

		if (item == null)
			return "redirect:..";

		service.increaseViewcont(noticeId);
		model.addAttribute("item", item);

		return path + "view";
	}

	@RequestMapping("/list")
	public String list(Model model, Pager pager) {
		List<Notice> list = service.list(pager);

		model.addAttribute("list", list);

		return path + "list";

	}

}