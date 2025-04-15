package com.example.project2_test.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;
 


public class AppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer{
	@Override
	 protected Class<?>[] getRootConfigClasses() {
		System.out.println("getRootConfigClasses");
        return new Class[] {   MvcConfiguration.class };
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
    	System.out.println("getServletConfigClasses"); 
        return new Class[] { MvcConfiguration.class };
    }

    @Override
    protected String[] getServletMappings() {
    	System.out.println("getServletMappings");
        return new String[] { "/" };
    }
}

