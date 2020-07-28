package com.kh.tastyMap.bookmark.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tastyMap.bookmark.model.vo.Bookmark;

@Repository
public class BookmarkDAOImpl implements BookmarkDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	
	@Override
	public int selectBookmarkOne(Bookmark bookmark) {
		
		return sqlSession.selectOne("restaurantMapper.selectBookmark", bookmark);
	}

	@Override
	public int insertBookmark(Bookmark bookmark) {
		 	return sqlSession.insert("restaurantMapper.insertBookmark", bookmark);
	}

	@Override
	public int deleteBookmark(Bookmark bookmark) {
		
		return  sqlSession.delete("restaurantMapper.deleteBookmark", bookmark);
	}

	@Override
	public Bookmark selectMyBookList(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Bookmark> iHaveBookmarkList(String member_Id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("loveMapper.iHaveBookmarkList", member_Id);
	}

}
