package com.kh.tastyMap.websocket.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler {
	// 웹소켓에서 데이터 전달할때 5가지 방법  서버입장 4개, 사용자 입장 5개 (스프링은 onOpen, onMessage, onClose 3가지만 있다.)
	// onOpen : 웹소켓 최초 연결 (누구누구님이 입장하셨습니다.)
	// onMessage : 서버로 전달된 메시지 (onMessage / send) 사용자는 받는 보내는 메시지 두개가 있지만 서버입장에선 받는거만 있다.onMessage
	// onError : 웹 소켓 연결 도중 에러가 발생 했을 때
	// onClose : 웹 소켓 종료
	// 웹소켓에서 특정 사용자가 세션을 연결하여 주고받는 데이터를 처리하는 객체
	   
    // 접속 사용자 리스트
//    private List<WebSocketSession> sessionList = new ArrayList();
//   
//    //에러가 났을 때, 혹은 개발시 활용할 로거 클래스(안써도 됨)
//    private Logger logger = LoggerFactory.getLogger(EchoHandler.class);
//
//    // 사용자 연결 후 실행할 메소드 (웹소켓에서 onOpen 과 같다)
//    @Override
//    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//       // WebSocket의 세션은 HttpSession과 다르다
//      
//       // 1. 사용자 연결 시에 sesstionList라는 사용자 리스트에 접속한 사용자를 추가한다.
//       sessionList.add(session);
//       logger.info("{}연결됨", session.getId());
//      
//       System.out.println("채팅방 입장자 :"+session.getId() );
//       // super.afterConnectionEstablished(session);
//    }
//
//    // 사용자가 메세지를 보냈을 때 접속한 사람 모두에게 해당 메세지를 전달하는 메소드 
//    // (웹소켓에서 onMessage와 같다.)
//    @Override
//    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//       //session.sendMessage(new TextMessage(session.getId() + "|" + message.getPayload()));
//       System.out.println("session주소 : "+session.getRemoteAddress());
//       System.out.println(session.getAttributes().get("userName"));
//      
//       // 사용자 모두에게 데이터를 전달하는 반복문
//       for (WebSocketSession one : sessionList) {
//          one.sendMessage(new TextMessage(session.getId() + " | " + message.getPayload()+"|"+session.getRemoteAddress()+"|"+session.getAttributes().get("userName")));
//       }
//       // super.handleTextMessage(session, message);
//    }
//
//    // 사용자가 접속을 종료할 때 동작하는 메소드 (웹소켓에서 onClose와 같다.)
//    @Override
//    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
//
//       // 현재 사용자 목록에서 해당 사용자를 제거
//       sessionList.remove(session);
//       logger.info("{}연결끊김",session.getId());
//      
//       // 현재 사용자가 나간 내용을 다른 사용자들에게 공지
//       for (WebSocketSession one : sessionList) {
//          if(one==session) continue;
//          one.sendMessage(new TextMessage(session.getAttributes().get("userName")+"님이 퇴장하셨습니다."));
//       }
//      
//       //super.afterConnectionClosed(session, status);
//    }
    
    	//로그인 한 전체
    	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
    	// 1대1
    	Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
    		
    	//서버에 접속이 성공 했을때
    	@Override
    	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    		sessions.add(session);
    		
    		String senderEmail = getEmail(session);
    		userSessionsMap.put(senderEmail , session);
    	}
    	
    	//소켓에 메세지를 보냈을때
    	@Override
    	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//    		String senderEmail = getEmail(session);
    		//모든 유저에게 보낸다 - 브로드 캐스팅
//    		for (WebSocketSession sess : sessions) {
//    			sess.sendMessage(new TextMessage(senderNickname + ": " +  message.getPayload()));
//    		}
    		
    		//protocol : cmd , 댓글작성자, 게시글 작성자 , seq (reply , user2 , user1 , 12)
    		String msg = message.getPayload();
    		if(StringUtils.isNotEmpty(msg)) {
    			String[] strs = msg.split(",");
    			
    			if(strs != null && strs.length == 5) {
    				String cmd = strs[0];
    				String caller = strs[1]; 
    				String receiver = strs[2];
    				String receiverEmail = strs[3];
    				String seq = strs[4];
    				
    				//작성자가 로그인 해서 있다면
    				WebSocketSession boardWriterSession = userSessionsMap.get(receiverEmail);
    				
    				if("reply".equals(cmd) && boardWriterSession != null) {
    					TextMessage tmpMsg = new TextMessage(caller + "님이 " + 
    										"<a type='external' href='/mentor/menteeboard/menteeboardView?seq="+seq+"&pg=1'>" + seq + "</a> 번 게시글에 댓글을 남겼습니다.");
    					boardWriterSession.sendMessage(tmpMsg);
    				
    				}else if("follow".equals(cmd) && boardWriterSession != null) {
    					TextMessage tmpMsg = new TextMessage(caller + "님이 " + receiver +
    							 "님을 팔로우를 시작했습니다.");
    					boardWriterSession.sendMessage(tmpMsg);
    					
    				}else if("love".equals(cmd) && boardWriterSession != null) {
    					TextMessage tmpMsg = new TextMessage(caller + "님이 " +
    										//변수를 하나더 보낼수 없어서 receiver 변수에 member_seq를 넣어서 썼다.
    										"<a type='external' href='/mentor/essayboard/essayboardView?pg=1&seq="+seq+"&mentors="+ receiver +"'>" + seq + "</a>번 좋아요를 했습니다.");
    					boardWriterSession.sendMessage(tmpMsg);
    				}
    			}
    			// 모임 신청 했을때
    			if(strs != null && strs.length == 5) {
    				String cmd = strs[0];
    				String mentee_name = strs[1];
    				String mentor_email = strs[2];
    				String meetingboard_seq = strs[3];
    				String participation_seq = strs[4];
    				
    				// 모임 작성한 멘토가 로그인 해있으면
    				WebSocketSession mentorSession = userSessionsMap.get(mentor_email);
    				if(cmd.equals("apply") && mentorSession != null) {
    					TextMessage tmpMsg = new TextMessage(
    							mentee_name + "님이 모임을 신청했습니다. " +"<a type='external' href='/mentor/participation/participationView?mseq="+ meetingboard_seq +"&pseq="+ participation_seq +"'>신청서 보기</a>");
    					mentorSession.sendMessage(tmpMsg);
    				}
    			}
    		}
    	}
    	
    	//연결 해제될때
    	@Override
    	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    		//System.out.println("afterConnectionClosed " + session + ", " + status);
    		userSessionsMap.remove(session.getId());
    		sessions.remove(session);
    	}
    	
    	//웹소켓 email 가져오기
    	private String getEmail(WebSocketSession session) {
    		Map<String, Object> httpSession = session.getAttributes();
    		MemberDTO loginUser = (MemberDTO)httpSession.get("memDTO");
    		
    		if(loginUser == null) {
    			return session.getId();
    		} else {
    			return loginUser.getMember_email();
    		}
    	
    
}
