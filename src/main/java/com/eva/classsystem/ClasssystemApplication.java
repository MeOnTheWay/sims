package com.eva.classsystem;

import com.eva.classsystem.utils.TokenThread;
import net.unicon.cas.client.configuration.EnableCasClient;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ImportResource;

@SpringBootApplication
@MapperScan("com.eva.classsystem.mapper")
@EnableCasClient    //访问cas服务端的注解
public class ClasssystemApplication {

	public static void main(String[] args) {
		SpringApplication.run(ClasssystemApplication.class, args);
		//微信端调试  accessToken 先保留在本地超过有效时间再重新获取
		Thread thread = new Thread(new TokenThread());
		thread.start();

	}

}
