package com.llm;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class LuluMoneyApplication {

	public static void main(String[] args) {
		SpringApplication.run(LuluMoneyApplication.class, args);
	}

}
