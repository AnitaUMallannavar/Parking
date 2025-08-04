package com.xworkz.parkingrental.controller;

import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.xworkz.parkingrental.dto.ParkingInfoDTO;
import com.xworkz.parkingrental.dto.UserDTO;

import lombok.extern.slf4j.Slf4j;

@Component
@RequestMapping
@Slf4j
public class DefaultController {

	public DefaultController() {
		log.info("Created: "+getClass().getSimpleName());
	}
	
	  @RequestMapping("onStart") 
	  public String onStart(Model model) {
	  log.info("running onStart()"); 
	  model.addAttribute("dto2", new ParkingInfoDTO());
	  return "UpdateParkingInfo"; 
	  }	 
	  
	  @RequestMapping("onRegister") 
	  public String onRegister(Model model) {
	  log.info("running onStart()"); 
	  model.addAttribute("userDto", new UserDTO());
	  return "UserRegistration"; 
	  }	 
}
