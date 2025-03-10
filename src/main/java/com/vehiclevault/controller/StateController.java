package com.vehiclevault.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.vehiclevault.entity.StateEntity;
import com.vehiclevault.repository.StateRepository;

@Controller
public class StateController {
	
	@Autowired
	StateRepository repoState;
	
	@GetMapping("newstate")
	public String newState() {
		return "NewState";
	}
	
	@PostMapping("savestate")
	public String saveState(StateEntity stateEntity) {
		System.out.println(stateEntity.getStateName());
		repoState.save(stateEntity);
		return "redirect:/newstate";
	}

}
