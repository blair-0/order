package com.example.demo.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dao.TypeDao;
import com.example.demo.model.Type;

@Controller
@RequestMapping("/type")
public class TypeController {
	@Autowired
	private TypeDao typeDao;

	@RequestMapping("/{id}")
	public String getType(@PathVariable Integer id, Model model) {
		Optional<Type> typeOptional = typeDao.findById(id);
		if(typeOptional.isPresent()) {
			Type type = typeOptional.get();
			model.addAttribute(type);
		}
		return "/type/detail";
	}

	@RequestMapping("/list")
	public String listType(Model model) {
		List<Type> typeList = typeDao.findAll(new Sort(Sort.Direction.ASC, "id"));

		model.addAttribute("types", typeList);
		return "/type/list";
	}

	@GetMapping("/add")
	public String showType(Model model) {
			model.addAttribute("type", new Type());
			return "/type/add";
	}

	@PostMapping("/add")
	public String addType(@ModelAttribute Type type) {
		typeDao.save(type);
		return "/type/addResult";
	}
}
