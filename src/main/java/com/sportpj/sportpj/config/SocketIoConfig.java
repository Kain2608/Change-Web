package com.sportpj.sportpj.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import com.corundumstudio.socketio.SocketIOServer;

@Configuration
public class SocketIoConfig {

    @Bean
    public SocketIOServer socketIOServer() {
        com.corundumstudio.socketio.Configuration config = new com.corundumstudio.socketio.Configuration();
        config.setHostname("localhost");
        config.setPort(9092); 
        config.setOrigin("http://localhost:8081");
        
        return new SocketIOServer(config);
    }
}