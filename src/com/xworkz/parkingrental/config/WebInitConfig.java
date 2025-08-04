package com.xworkz.parkingrental.config;

import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletRegistration.Dynamic;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import com.xworkz.parkingrental.constant.FileConstant;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class WebInitConfig extends AbstractAnnotationConfigDispatcherServletInitializer {

	public WebInitConfig() {
		log.info("Created: " + getClass().getSimpleName());
	}

	@Override
	protected Class<?>[] getRootConfigClasses() {
		log.info("running getRootConfigClasses()");
		return null; // Consider adding RootConfig class here
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		log.info("running getServletConfigClasses()");
		return new Class[] { SpringConfig.class }; // Good
	}

	@Override
	protected String[] getServletMappings() {
		log.info("running getServletMappings()");
		return new String[] { "/" }; // Good
	}

	@Override
	protected void customizeRegistration(Dynamic registration) {
		int maxSize = FileConstant.MAX_FILE_SIZE; // e.g., 80MB
		MultipartConfigElement multipartConfigElement =
				new MultipartConfigElement(FileConstant.TEMP_FILE_LOCATION, maxSize, maxSize * 2, maxSize / 2);
		registration.setMultipartConfig(multipartConfigElement);
	}
}
