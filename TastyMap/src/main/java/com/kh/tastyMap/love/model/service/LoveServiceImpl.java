package com.kh.tastyMap.love.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tastyMap.love.model.dao.LoveDAO;
import com.kh.tastyMap.love.model.vo.Love;
import com.kh.tastyMap.post.model.vo.PostList;

@Service
public class LoveServiceImpl implements LoveService {

	@Autowired
	LoveDAO loveDAO;
	
	// 좋아요 클릭시
	@Override
	public Map<String, Object> clickLove(Love love) {
		
		int result = loveDAO.selectLoveOne(love);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String msg;
		String status = "N"; // DB에 데이터 없을 때 : N / 있을 때 : Y
		
		if(result > 0) { // 이미 좋아요 한것
			result = loveDAO.deleteLove(love);
			
			if(result==1) { // 좋아요 삭제 성공
				msg="좋아요 삭제 성공";
			} else { // 북마크 삭제 실패
				msg="좋아요 삭제 실패";
				status = "Y";
			}
		} else if (result==0) { // 아직 좋아요 안한것
			result = loveDAO.insertLove(love);
			
			if(result==1) { // 좋아요 insert 성공
				msg="좋아요 추가 성공";
				status = "Y";
			} else { // 좋아요 insert 실패 
				msg="좋아요 추가 실패";
			}
		} else msg="좋아요 조회 실패";
		
		map.put("msg", msg);
		map.put("status", status);
		
		return map;
	}

	@Override
	public Love selectMyLoveList(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	// 좋아요 확인하는 메소드
	@Override
	public int selectLove(Love love) {
		return loveDAO.selectLoveOne(love);
	}


	@Override
	public List<PostList> iHaveLoveList(String member_Id) {
		// TODO Auto-generated method stub
		return loveDAO.iHaveLoveList(member_Id);
	}

}
