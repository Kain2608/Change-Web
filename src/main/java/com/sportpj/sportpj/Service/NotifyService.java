package com.sportpj.sportpj.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.SocketIOServer;
import com.sportpj.sportpj.Model.ContactModel;
import com.sportpj.sportpj.Model.NotificationModel;
import com.sportpj.sportpj.Model.UserModel;
import com.sportpj.sportpj.Repository.NotifyRepository;

import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;

@Service
public class NotifyService {

    @Autowired
    private SocketIOServer server;

    @Autowired
    private NotifyRepository notifyRepository;

    private static final Map<String, SocketIOClient> clientMap = new ConcurrentHashMap<>();

    @PostConstruct
    public void init() {
        server.addConnectListener(client -> {
            String userId = client.getHandshakeData().getSingleUrlParam("userId");

            if (userId != null && !userId.isEmpty()) {
                clientMap.put(userId, client);
        
                List<NotificationModel> unreadList = notifyRepository.findByRecipientIdAndIsReadFalse(userId);

                if (!unreadList.isEmpty()) {
                    List<Map<String, Object>> dataToSend = unreadList.stream().map(n -> {
                        Map<String, Object> map = new HashMap<>();
                        map.put("id", n.getId());
                        map.put("content", n.getContent());
                        map.put("createdAt", n.getCreatedAt() != null ? n.getCreatedAt().toString() : "");
                        return map;
                    }).collect(Collectors.toList());

                    client.sendEvent("load_unread", dataToSend);
                }
            }
        });

        server.addDisconnectListener(client -> {
            String userId = client.getHandshakeData().getSingleUrlParam("userId");
            if (userId != null) {
                clientMap.remove(userId);
            }
        });

        try {
            server.start();
        } catch (Exception e) {
        }
    }

    @PreDestroy
    public void stopSocketServer() {
        if (server != null) {
            server.stop();
        }
    }

    public void sentToUser(UserModel userModel, ContactModel contact) {
        String content = "Bạn có tin nhắn mới từ " + contact.getEmail() + ": " + contact.getMessage();

        NotificationModel notify = new NotificationModel();
        notify.setContent(content);
        notify.setRecipientId(String.valueOf(userModel.getId()));
        notifyRepository.save(notify);

        String userIdStr = String.valueOf(userModel.getId());
        SocketIOClient client = clientMap.get(userIdStr);

        if (client != null && client.isChannelOpen()) {
            client.sendEvent("new_notification", content);
        }
    }
}