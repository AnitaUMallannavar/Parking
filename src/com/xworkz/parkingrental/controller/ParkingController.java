package com.xworkz.parkingrental.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.time.LocalTime;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import com.xworkz.parkingrental.constant.FileConstant;
import com.xworkz.parkingrental.dto.ParkingDTO;
import com.xworkz.parkingrental.dto.ParkingInfoDTO;
import com.xworkz.parkingrental.dto.UserDTO;
import com.xworkz.parkingrental.dto.UserParkingDTO;
import com.xworkz.parkingrental.service.ParkingService;
import lombok.extern.slf4j.Slf4j;

@Component
@RequestMapping("/")
@Slf4j
public class ParkingController {

	@Autowired
	private ParkingService service;

	public ParkingController() {
		log.info("Created: " + getClass().getSimpleName());
	}

	@PostMapping("adminLogin")
	public String validate(ParkingDTO dto, Model model, HttpServletRequest req) {
		// if(dto!=null)
		if (!dto.getEmail().isEmpty() && !dto.getPassword().isEmpty()) {
			log.info("running parking()");
			ParkingDTO dto2 = service.validateCredential(dto.getEmail(), dto.getPassword());
			if (dto2 != null) {
				// session scope
				HttpSession session = req.getSession();
				session.setAttribute("sessionDTO", dto2);

				// request scope
				// model.addAttribute("time", dto2.getLoginTime());
				// model.addAttribute("name", dto2.getName());
				return "AdminLoginSuccess";
			} else {
				model.addAttribute("error", "*Invalid credential");
			}
		} else {
			model.addAttribute("error2", "Please enter credential");
		}
		return "AdminLogin";
	}

	@RequestMapping(value = "updateParkingInfo", method = RequestMethod.POST)
	@PostMapping("updateParkingInfo")
	public String updateParkingInfo(ParkingInfoDTO dto, Model model) {
		log.info("running updateParkingInfo()");
		boolean saved = service.saveParkingInfo(dto);
		if (saved) {
			model.addAttribute("success", "Data saved successfully");
		} else {
			log.info("Data already exist");
			model.addAttribute("error", "Data already exist");
			model.addAttribute("dto2", dto);
		}
		return "UpdateParkingInfo";
	}

	@RequestMapping("viewData")
	public String viewData(String location, Model model) {
		log.info("running viewData()");
		List<ParkingInfoDTO> dtoList = service.findByLocation(location);
		if (!dtoList.isEmpty()) {
			log.info("dto list: " + dtoList);
			model.addAttribute("list", dtoList);
			model.addAttribute("size", "No. of records: " + dtoList.size());
			return "AdminViewData";
		} else {
			model.addAttribute("error", "No record found");
			return "AdminViewData";
		}
	}

	@PostMapping("userRegistration")
	public String userRegistration(UserDTO userDto, UserParkingDTO upDto, Model model, MultipartFile file) throws FileNotFoundException, IOException {
		log.info("running userRegistration");
		
		upDto.setFileName(System.currentTimeMillis()+"_"+file.getOriginalFilename());
		upDto.setOriginalFileName(file.getOriginalFilename());
		upDto.setContentType(file.getContentType());

		File physicalFile = new File(FileConstant.FILE_LOCATION + upDto.getFileName());
		try (OutputStream os = new FileOutputStream(physicalFile)) {
			os.write(file.getBytes());
		}
		
		boolean status = service.validateAndRegister(userDto, upDto);
		if (status) {
			model.addAttribute("success", "Registration done Successfully");
		} else {
			model.addAttribute("error", "Email is already registered, please login");
		}
		return "UserRegistration";
	}

	@PostMapping("generateOTPAndLogin")
	public String onGenerateOTPAndLogin(String generateOtp, String login, String email, Integer otp, Model model,
			HttpServletRequest req) {
		
		log.info("running onGenerateOTPAndLogin()");
		log.info("Controller: generateOtp: " + generateOtp);
		log.info("controller: login from UI: " + login);
		log.info("controller: email from UI: " + email);
		log.info("controller: otp from UI: " + otp);
					
		if (generateOtp != null && "Generate OTP".equals(generateOtp)) {
			
			UserDTO dto = service.findByUserEmail(email);
			
			HttpSession session = req.getSession();
			session.setAttribute("emailId", email);
			
			if (dto != null) {
				boolean otpStatus = service.generateOtp(email);
				if (otpStatus) {
					model.addAttribute("mail", email);
					model.addAttribute("generateOtpSuccess",
							"OTP sent to registered mail-id, will be expired after 2 mins");
				} else {
					model.addAttribute("mail", email);
					model.addAttribute("generateOtpError", "Re-generate the OTP");
				}
			} else {
				model.addAttribute("mail", email);
				model.addAttribute("emailError", "*Not a registered mail-id");
			}
		} else if (login != null && "Login".equals(login)) {
			log.info("validating otp...");
			log.info("controller: onGenerateOTP(): email from login.jsp: " + email);
			UserDTO dto = service.findByUserEmail(email);
			boolean otpNotExpired = dto.getOtpExpiryTime().isAfter(LocalTime.now());
			log.info("otp Not Expired: " + otpNotExpired);
			if (otpNotExpired) {
				log.info("OTP not expired");
				boolean isOtpValid = service.validateOTP(email, otp);
				if (isOtpValid) {
					
					HttpSession session = req.getSession();
					session.setAttribute("userDto", dto);
					
					log.info("session: "+session);
					return "UserLoginSuccess";
				} else {
					if (dto.getOtpCount() < 3) {
						model.addAttribute("otpError", "*Invalid OTP");
					} else {
						model.addAttribute("acctLocked", "*Your account is blocked");
					}
				}
			} 
			log.info("OTP expired");
			model.addAttribute("otpExpired", "*OTP expired, please generate the new OTP");
		}
		return "UserLogin";
	}

	@RequestMapping("addUserParkingInfo")
	public String onAddUserParkingInfo(UserParkingDTO upDto, Model model, MultipartFile file, HttpServletRequest req) throws IOException {
		log.info("controller: running onAddUserParkingInfo()");
		UserParkingDTO dto = service.findByVehicleNo(upDto.getVehicleNo());

		if (dto == null || !dto.isActive()) {
			log.info("controller: onAddUserParkingInfo(): new vehicle");

			upDto.setFileName(System.currentTimeMillis() + "_" + file.getOriginalFilename());
			upDto.setOriginalFileName(file.getOriginalFilename());
			upDto.setContentType(file.getContentType());

			File physicalFile = new File(FileConstant.FILE_LOCATION + upDto.getFileName());
			try (OutputStream os = new FileOutputStream(physicalFile)) {
				os.write(file.getBytes());
			}

			HttpSession session = req.getSession();
			Object mail = session.getAttribute("emailId");
			log.info("controller: onAddUserParkingInfo(): mailid of line#133: " + mail);

			String response = service.addUserParkingInfo(upDto, (String) mail);

			if (response.contains("successfully")) {
				model.addAttribute("success", response);
			} else {
				model.addAttribute("error", response);
			}

			return "UserParkingInfo";
		}

		log.info("controller: onAddUserParkingInfo(): This vehicle is already parked");
		model.addAttribute("error", "*This vehicle is already parked");
		return "UserParkingInfo";
	}



	@GetMapping("userViewData")
	public String onUserViewData(Model model, HttpServletRequest req) {
		log.info("onUserViewData()");
		
		HttpSession session = req.getSession();
		String mail = (String) session.getAttribute("emailId");
		
		UserDTO userDto = service.findByUserEmail(mail);
		List<UserParkingDTO> upDtos = service.findAllById(mail);


		if (userDto != null && !upDtos.isEmpty()) {
			model.addAttribute("personalData", userDto);
			model.addAttribute("parkingData", upDtos);
			return "UserViewData";
		}
		model.addAttribute("error", "Facing some issue, please retry after some time");
		return "UserViewData";
	}
	
	@GetMapping("showFile")
	public void showFile(String fileName, String contentType, HttpServletResponse resp) throws IOException {
		log.info("running showFile()");
		File physicalFile = new File(FileConstant.FILE_LOCATION + fileName); // STEP 1: GET ref of the file, by
																					// name passed
		resp.setContentType(contentType); // STEP2 : set content type
		OutputStream outputStream = resp.getOutputStream(); // STEP 3: write file as Bytes to response
		FileInputStream inputStream = new FileInputStream(physicalFile);
		byte[] buffer = new byte[4096];
		int length;
		while ((length = inputStream.read(buffer)) > 0) {
			outputStream.write(buffer, 0, length);
		}
		inputStream.close();
		outputStream.flush();
	}

	@GetMapping("/parkinginfo/{vehicleNo}")
	public String loadingUserParkingData(@PathVariable String vehicleNo, Model model) {
		log.info("running loadingUserParkingData()");
		UserParkingDTO upDto = service.findByVehicleNo(vehicleNo);
		model.addAttribute("upDto", upDto);
		return "parkingupdate"; // must match the JSP name
	}




	@PostMapping("/parkinginfo")
	public String updateUserParkingData(UserParkingDTO upDto, String vNo, Model model, MultipartFile file,
			HttpServletRequest req) throws FileNotFoundException, IOException {
		log.info("controller: running updateUserParkingData()");
		log.info("controller: updateUserParkingData(): old vNo from UI: " + vNo);

		UserParkingDTO dto = service.findByVehicleNo(vNo);
		log.info("controller: updateUserParkingData(): existing user parking data: " + dto);
		if (upDto != null) {
			log.info("controller: updateUserParkingData(): upDto is not null");

			if (file != null) {
				log.info("controller: updateUserParkingData(): new vehicle pic uploaded");
				upDto.setFileName(System.currentTimeMillis() + "_" + file.getOriginalFilename());
				upDto.setOriginalFileName(file.getOriginalFilename());
				upDto.setContentType(file.getContentType());

				File physicalFile = new File(FileConstant.FILE_LOCATION + upDto.getFileName());
				try (OutputStream os = new FileOutputStream(physicalFile)) {
					os.write(file.getBytes());
				}
			} else {
				upDto.setFileName(dto.getFileName());
				upDto.setOriginalFileName(dto.getOriginalFileName());
				upDto.setContentType(dto.getContentType());
			}

			service.updateUserParkingInfo(upDto, vNo);
			model.addAttribute("success", "Data updated successfully!");
			return "UserParkingInfo";
		}
		log.info("controller: updateUserParkingData(): This vehicle is already parked");
		model.addAttribute("error", "*This vehicle is already parked");
		return "UserParkingInfo";
	}
	
	@RequestMapping("deleteUserParkingData")
	public String onDeleteUserParkingData(String vehicleNo, Model model, HttpServletRequest req) {
		log.info("running onDeleteUserParkingData()");
		boolean status=service.deleteUserParkingEntityByVehicleNo(vehicleNo);
		if(status) {
			
			HttpSession session = req.getSession();
			String mail = (String) session.getAttribute("emailId");
			
			UserDTO userDto = service.findByUserEmail(mail);
			List<UserParkingDTO> upDtos = service.findAllById(mail);

			if (userDto != null && !upDtos.isEmpty()) {
				model.addAttribute("personalData", userDto);
				model.addAttribute("parkingData", upDtos);
				model.addAttribute("success", "record deleted");
				log.info("record deleted by vehicleNo");
		}
		}else {
			model.addAttribute("error", "Unable to delete the record, please retry");
			log.info("record not deleted by vehicleNo");
		}
		return "UserViewData";
	}
}
