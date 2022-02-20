package com.www.config;


import org.springframework.context.annotation.Bean;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.FilterChain;
import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;


public class SpringWebAppInitializer implements WebApplicationInitializer {

	@Override
	public void onStartup(ServletContext ctx) throws ServletException {
		AnnotationConfigWebApplicationContext appContext = new AnnotationConfigWebApplicationContext();
		appContext.register(ApplicationContextConfig.class);

		ServletRegistration.Dynamic dispatcher = ctx.addServlet("SpringDispatcher",
				new DispatcherServlet(appContext));
		dispatcher.setLoadOnStartup(1);
		dispatcher.addMapping("/");


		ContextLoaderListener contextLoaderListener = new ContextLoaderListener(appContext);

		ctx.addListener(contextLoaderListener);


		// Filter.
		FilterRegistration.Dynamic fr = ctx.addFilter("encodingFilter", CharacterEncodingFilter.class);

		fr.setInitParameter("encoding", "UTF-8");
		fr.setInitParameter("forceEncoding", "true");
		fr.addMappingForUrlPatterns(null, true, "/*");
	}
	
}
