package com.vahundos.javarush.testtask.note.configuration;

import org.springframework.lang.Nullable;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import javax.servlet.Filter;

public class AppInit extends AbstractAnnotationConfigDispatcherServletInitializer {
    @Nullable
    protected Class<?>[] getRootConfigClasses() {
        return new Class[] {AppConfig.class};
    }

    @Nullable
    protected Class<?>[] getServletConfigClasses() {
        return null;
    }

    protected String[] getServletMappings() {
        return new String[] {"/"};
    }

    @Nullable
    @Override
    protected Filter[] getServletFilters() {
        return new Filter[] {new CharacterEncodingFilter("UTF-8", true)};
    }
}
