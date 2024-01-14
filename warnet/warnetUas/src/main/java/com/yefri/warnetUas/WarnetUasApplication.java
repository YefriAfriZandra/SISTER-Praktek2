package com.yefri.warnetUas;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@SpringBootApplication
@EntityScan(basePackages = "com.yefri.warnetUas.entity")
public class WarnetUasApplication {

	public static void main(String[] args) {
		SpringApplication.run(WarnetUasApplication.class, args);
	}

}
