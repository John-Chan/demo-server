package com.pig4cloud.demo.server;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@SpringBootApplication
public class DemoServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(DemoServerApplication.class, args);
	}

	@GetMapping("/")
	public ResponseEntity<String> index(){
		return ResponseEntity.ok("最小镜像挑战赛<br/>© 2020 pig4clooud.com");
	}
}
