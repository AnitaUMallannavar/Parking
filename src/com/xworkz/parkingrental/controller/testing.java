package com.xworkz.parkingrental.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Date;

public class testing {

	public static void main(String[] args) {

		System.out.println(LocalDateTime.now());

		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yy hh:mm aa");
		String formattedDate = dateFormat.format(new Date()).toString();
		System.out.println(formattedDate);
		
		System.out.println("LocalTime.now().plusSeconds(120): "+LocalTime.now().plusSeconds(120));

		
		System.out.println("new Date(): "+new Date());
		String str = "Today is tuesday";

		String array[] = str.split(" ");
		System.out.println("Split method output:");
		for (String s : array) {
			System.out.println(s);
		}
		
		System.out.println("using for loop:");
		for(int s=0; s<=array.length-1; s++) {
			System.out.println(array[s]);
		}
		
		int price=100;
		String discount="5";
		String url="http://localhost:8080/parking-rental-app/validateFields/"+price+"/"+discount;
		System.out.println("url: "+url);
		
	}
}

//bgd image
//js validattion
//space between buttons in landing page