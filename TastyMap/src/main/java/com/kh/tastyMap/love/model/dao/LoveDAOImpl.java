package com.kh.tastyMap.love.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tastyMap.love.model.vo.Love;
import com.kh.tastyMap.post.model.vo.PostList;

@Repository
public class LoveDAOImpl implements LoveDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 좋아요 눌렀는지 확인용
	@Override
	public int selectLoveOne(Love love) {
		return sqlSession.selectOne("loveMapper.selectPostLove", love);
	}

	// 좋아요 추가
	@Override
	public int insertLove(Love love) {
		return sqlSession.insert("loveMapper.insertPostLove", love);
	}

	// 좋아요 삭제
	@Override
	public int deleteLove(Love love) {
		return sqlSession.delete("loveMapper.deletePostLove", love);
	}

	@Override
	public Love selectMyLoveList(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PostList> iHaveLoveList(String member_Id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("loveMapper.iHaveLoveList", member_Id);
	}
	
	

}
