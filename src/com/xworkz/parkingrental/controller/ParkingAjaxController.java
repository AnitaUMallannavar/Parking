package com.xworkz.parkingrental.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.xworkz.parkingrental.dto.ParkingInfoDTO;
import com.xworkz.parkingrental.dto.UserParkingDTO;
import com.xworkz.parkingrental.service.ParkingService;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/")
@RestController // this must be included for ajax to be worked
@EnableWebMvc // this must be included for ajax to be worked
@Slf4j
public class ParkingAjaxController {

	@Autowired
	private ParkingService service;

	public ParkingAjaxController() {
		log.info("Created: " + getClass().getSimpleName());
	}

	@GetMapping(value = "/validateFields/{location}/{vehicleType}/{engineType}/{classification}/{term}", produces = MediaType.APPLICATION_JSON_VALUE)
	public String validateFields(@PathVariable String location, @PathVariable String vehicleType,
			@PathVariable String engineType, @PathVariable String classification, @PathVariable String term,
			Model model) {
		log.info("running validateFields()");
		ParkingInfoDTO dto = service.isExist(location, vehicleType, engineType, classification, term);
		System.out.println(dto);
		if (dto!=null) {
			return "Data is already exist";
		}
		return "";
	}

	@GetMapping(value = "/validateEmail/{email}", produces = MediaType.APPLICATION_JSON_VALUE)
	public String validateEmail(@PathVariable String email) {
		log.info("running validateFields()");
		boolean exist = service.isUserExist(email);
		if (exist) {
			return "Email is already registered, please login ";
		}
		return "";
	}
	
	@GetMapping(value = "/getPriceAndDiscount/{location}/{vehicleType}/{engineType}/{classification}/{term}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ParkingInfoDTO getPriceAndDiscount(@PathVariable String location, @PathVariable String vehicleType,
			@PathVariable String engineType, @PathVariable String classification, @PathVariable String term,
			Model model) {
		log.info("running validateFields()");
		ParkingInfoDTO dto = service.isExist(location, vehicleType, engineType, classification, term);
		System.out.println(dto);
		if (dto!=null) {
			return dto;
		}
		return null;
	}
	
	private String email;
	@GetMapping(value = "/validateEmailForOPT/{email}", produces = MediaType.APPLICATION_JSON_VALUE)
	public String validateEmailForOPT(@PathVariable String email) {
		log.info("running validateEmailForOPT()");
		this.email=email;
		log.info("Ajax controller: validateEmailForOPT: this.email: "+this.email);
		log.info("Ajax Controller: validateEmailForOPT: Email: "+email);
		boolean exist = service.isUserExist(email);
		if (exist) {
			log.info("Ajax Controller: validateEmailForOPT: isUserExist: "+exist);
			return "";
		}else {
			log.info("Ajax Controller: validateEmailForOPT: isUserExist: "+exist);
		return "*Not a registered mail-id";
		}
	}
	
//	@GetMapping(value = "/validateOTP/{email}/{otp}", produces = MediaType.APPLICATION_JSON_VALUE)
//	public String validateOTP(@PathVariable String email, @PathVariable int otp) {
	@PostMapping(value = "/validateOTP/{otp}", produces = MediaType.APPLICATION_JSON_VALUE)
	public String validateOTP(@PathVariable int otp) {
		log.info("running validateOTP()");
		boolean exist = service.validateOTP(email, otp);
		if (exist) {
			return "";
		}
		return "*Invalid OTP";
	}
	
	@GetMapping(value = "/validateVehicleNo/{vehicleNo}", produces = MediaType.APPLICATION_JSON_VALUE)
	public String validateVehicleNo(@PathVariable String vehicleNo) {
		log.info("running validateVehicleNo()");
		UserParkingDTO dto = service.findByVehicleNo(vehicleNo);
		if (dto!=null) {
			return "*This vehicle is already parked";
		}
		return "";
	}
}
