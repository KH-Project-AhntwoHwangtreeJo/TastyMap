package com.kh.websocket.common;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.kh.tastyMap.member.model.service.MemberService;
import com.kh.tastyMap.member.model.vo.Alarm;
import com.kh.tastyMap.member.model.vo.Member;

public class EchoHandler extends TextWebSocketHandler {
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	@Autowired
	private MemberService appSrv;

	// 클라이언트와 연결 이후에 실행되는 메서드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		sessionList.add(session);

		Member m = (Member) session.getAttributes().get("member");

		Gson gson = new Gson();

		String docJson = gson.toJson(appSrv.selectApprovalReceive(m.getMemberId()));

		session.sendMessage(new TextMessage(docJson));

		super.afterConnectionEstablished(session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		System.out.println("msg : " + message.getPayload());
		System.out.println(session);
		List<Alarm> list = appSrv.selectApprovalReceive(message.getPayload());
		System.out.println(list);
		super.handleTextMessage(session, new TextMessage(new Gson().toJson(list)));
	}

	// 클라이언트와 연결을 끊었을 때 실행되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		super.afterConnectionClosed(session, status);
	}
    	
    
}
