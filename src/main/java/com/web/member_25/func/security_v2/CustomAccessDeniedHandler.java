package com.web.member_25.func.security_v2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

public class CustomAccessDeniedHandler implements AccessDeniedHandler{

	

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException)
			throws IOException, ServletException {
		ObjectMapper mapper=new ObjectMapper();
		ObjectNode objectNode=mapper.createObjectNode();
		objectNode.put("error", "403");
		
		response.setStatus(HttpServletResponse.SC_OK);
		response.getWriter().write(objectNode.toString());	
		response.getWriter().flush();
		response.getWriter().close();
		
	}
}
