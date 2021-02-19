package com.toolers.shop.web.fiter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EncodingFilter implements javax.servlet.Filter {

    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest)req;
        HttpServletResponse response = (HttpServletResponse)res;
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        MyRequest myRequest = new MyRequest(request);

        chain.doFilter(request, response);

    }
}
