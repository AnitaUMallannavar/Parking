package com.xworkz.parkingrental.util;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.xworkz.parkingrental.entity.UserParkingEntity;
import org.springframework.stereotype.Component;

import com.xworkz.parkingrental.dto.UserParkingDTO;

@Component
public class UserParkingEmail {

	private String host;
	private String user;
	private String pswd;
	private String to;
	private String port;
	
	public boolean sendMail(String email, String name, UserParkingDTO upDto) {
		 host = "smtp.office365.com";
		 user = "Savitri.Kandgal@outlook.com";
		 pswd = "Sav3@123";
		 to = email;
		 port="587";

		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.debug", "true");
		props.put("mail.transport.protocal", "smtp");

		Session session = Session.getDefaultInstance(props, new Authenticator() {
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(user, pswd);
			}
		});

		try {
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(user));
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
		//	msg.setReplyTo(new InternetAddress[] {new InternetAddress("Savitri.Kandgal@outlook.com"), new InternetAddress(to)});
			msg.setSubject("SignUp Confirmation");
			msg.setContent("<H3>Hello " + name + ", </h3>"
					+ "<br/> "
					+ "<h5>You are registered successfully!</h5>"
					+ "Below is your parking details:<br/>"
					+ "Location: "+upDto.getLocation()+"<br/>"
					+ "Vehicle Type: "+upDto.getVehicleType()+"<br/>"
					+ "Engine Type: "+upDto.getEngineType()+"<br/>"
					+ "Classification: "+upDto.getClassification()+"<br/>"
					+ "Term: "+upDto.getTerm()+"<br/>"
					+ "Total Amount: "+upDto.getTotalAmount()
					+ "<br/> "
					+ "<br/> "
					+ "<b>Thanks & Regards</b>,<br/>"
					+ "Rental Parking System", "text/html");
			Transport.send(msg);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return true;
	}
//
//	public boolean sendMailForExpiration(String email, String name, UserParkingEntity parking) {
//		String host = "smtp.gmail.com";
//		String port = "587";
//		String fromEmail = "anitaum007@gmail.com";
//		String appPassword = "vgntirdrdefxvhdl"; // Use App Password
//
//		Properties props = new Properties();
//		props.put("mail.smtp.host", host);
//		props.put("mail.smtp.port", port);
//		props.put("mail.smtp.starttls.enable", "true");
//		props.put("mail.smtp.auth", "true");
//
//		Session session = Session.getInstance(props, new Authenticator() {
//			@Override
//			protected PasswordAuthentication getPasswordAuthentication() {
//				return new PasswordAuthentication(fromEmail, appPassword);
//			}
//		});
//
//		try {
//			MimeMessage message = new MimeMessage(session);
//			message.setFrom(new InternetAddress(fromEmail));
//			message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
//			message.setSubject("Parking Expiry Notification");
//
//			String content = "<h3>Hello " + name + ",</h3>"
//					+ "<p>Your parking slot for vehicle <b>" + parking.getVehicleNo() + "</b> "
//					+ "at location <b>" + parking.getLocation() + "</b> will expire on "
//					+ "<b>" + parking.getExpiryDate() + "</b>.</p>"
//					+ "<br/><p>Please renew to continue using the service.</p>"
//					+ "<p><b>Thanks & Regards</b>,<br/>Rental Parking System</p>";
//
//			message.setContent(content, "text/html");
//
//			Transport.send(message);
//			System.out.println("Expiry email sent successfully to " + email);
//			return true;
//
//		} catch (MessagingException e) {
//			e.printStackTrace();
//			return false;
//		}
//	}

}
