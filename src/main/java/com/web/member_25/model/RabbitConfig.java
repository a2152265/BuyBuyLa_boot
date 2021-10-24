package com.web.member_25.model;


import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class RabbitConfig {
	@Bean
	public Queue regQueue() {
		return new  Queue ("reg_email");
	}

}
