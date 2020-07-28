package com.kh.tastyMap.bookmark.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tastyMap.bookmark.model.dao.BookmarkDAO;
import com.kh.tastyMap.bookmark.model.vo.Bookmark;

@Service
public class BookmarkServiceImpl implements BookmarkService {

	@Autowired
	BookmarkDAO bookmarkDAO;
		
	
	
	@Override
	public Map<String, Object> clickBookmark(Bookmark bookmark) {
		int result = bookmarkDAO.selectBookmarkOne(bookmark);
		Map<String, Object> map = new HashMap<String, Object>();
		
		String msg;
		String status= "N"; //db에 데이터가 없을때 : N / 있을 때 : Y
		
		if(result>0) {// 이미 북마크 한 것
			result=bookmarkDAO.deleteBookmark(bookmark);
			
			if(result==1) {
				// 북마크 삭제 성공 
				msg="북마크 삭제 성공";
			}else {
				//북마크 삭제 실패				
				msg="북마크 삭제 실패";
				status = "Y" ;
			}
		}else if(result==0){// 아직 북마크 안 된 것
			result= bookmarkDAO.insertBookmark(bookmark);
			if(result==1) {
				// 북마크 insert 성공 
				msg="북마크 추가 성공";
				status = "Y";
			}else {
				//북마크 insert 실패
				msg="북마크 추가 실패";
			}
		}else msg="북마크 조회실패";	
		
		map.put("msg",msg);
		map.put("status",status);
		return map;
	}

	@Override
	public Bookmark selectMyBookList(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int  selectBookmark(Bookmark bookmark) {

		return bookmarkDAO.selectBookmarkOne(bookmark);
	}

	@Override
	public List<Bookmark> iHaveBookmarkList(String member_Id) {
		// TODO Auto-generated method stub
		return bookmarkDAO.iHaveBookmarkList(member_Id);
	}

}
