package com.xworkz.parkingrental.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Component;

@Component
public class UserOTPMail {

	public boolean sendMail(String email, String name, int otp) {
		String host = "smtp.gmail.com";
		String port = "587";
		String fromEmail = "anitaum007@gmail.com";         // Sender email
		String appPassword = "vgntirdrdefxvhdl";           // App password (no spaces)

		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.debug", "true");
		props.put("mail.transport.protocol", "smtp");

		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(fromEmail, appPassword);
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(fromEmail));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
			message.setSubject("Login OTP");

			String content = "<h3>Hello " + name + ",</h3>"
					+ "<p>Your One Time Password (OTP) is: <b>" + otp + "</b></p>"
					+ "<br/><p><b>Thanks & Regards</b>,<br/>X-workz</p>";

			message.setContent(content, "text/html");

			Transport.send(message);
			System.out.println("Email sent successfully to " + email);
			return true;

		} catch (MessagingException e) {
			e.printStackTrace();
			return false;
		}
	}
}
