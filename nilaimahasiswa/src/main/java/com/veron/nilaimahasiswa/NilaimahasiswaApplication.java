package com.veron.nilaimahasiswa;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;

@SpringBootApplication
public class NilaimahasiswaApplication {

	public static void main(String[] args) {
		SpringApplication.run(NilaimahasiswaApplication.class, args);
	}
        
        @Bean
        private RestTemplate restTemplate(){
            return new RestTemplate();
        }
}
