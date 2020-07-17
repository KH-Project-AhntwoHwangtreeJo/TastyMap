package com.kh.tastyMap.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.tastyMap.member.model.vo.Member;


/**
 * interceptor 클래스는 HandlerInterceptorAdaptor가 가진 
 * 메소드 3개를 재정의 (Override) 하여 구현할 수 있다.
 * 
 * 1. preHandle : 특정 컨트롤러의 메소드가 수행되기 이전에 동작할 내용 
 * 2. postHandle : 특정 컨트롤러의 메소드가 수행된 후에 동작할 내용 (동작 기반: 해당 코드가 이어 붙음)
 * 3. afterCompletion : 특정 컨트롤러의 메소드가 완료된 이후에 동작할 내용 (결과 기반 : return한 결과를 바탕으로 동작)
 * @author user1
 *
 */
public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		Member m = (Member)session.getAttribute("member");
		
		if(m==null) {
			logger.info("비로그인 상태에서 ["+ request.getRequestURI()+"] 경로에 접근 시도함!");
			
			request.setAttribute("loc", "/");
			request.setAttribute("msg", "로그인 후에 이용해주세요 ^_^ ");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			
			return false;
		}
		
		
		
		return super.preHandle(request, response, handler);
	}
	
	
}
