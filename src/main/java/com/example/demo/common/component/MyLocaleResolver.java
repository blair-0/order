package com.example.demo.common.component;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.StringUtils;
import org.springframework.web.servlet.LocaleResolver;


/**
 * 在链接上携带区域信息
 */
public class MyLocaleResolver implements LocaleResolver {
	
    @Override
    public Locale resolveLocale(HttpServletRequest httpServletRequest) {
        String l = httpServletRequest.getParameter("l");
        Locale locale = Locale.getDefault();
        if (!StringUtils.isEmpty(l)) {
            String[] language = l.split("_");
            locale = new Locale(language[0], language[1]);
        }
        return locale;
    }

    @Override
    public void setLocale(HttpServletRequest httpServletRequest,
    		HttpServletResponse httpServletResponse, Locale locale) {
    	
    }
}