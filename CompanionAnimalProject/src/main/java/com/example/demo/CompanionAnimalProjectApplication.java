package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;

@SpringBootApplication
@ComponentScan("com.example.*")
public class CompanionAnimalProjectApplication {

	public static void main(String[] args) {
		
		System.setProperty("server.servlet.context-path", "/CompanionAnimalProject");
		SpringApplication.run(CompanionAnimalProjectApplication.class, args);
	}

}
