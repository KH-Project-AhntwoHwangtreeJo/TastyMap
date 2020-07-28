package com.kh.tastyMap.love.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tastyMap.love.model.vo.Love;

@Repository
public class LoveDAOImpl implements LoveDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int selectLoveOne(Love love) {
		return sqlSession.selectOne("loveMapper.selectPostLove", love);
	}

	@Override
	public int insertLove(Love love) {
		return sqlSession.insert("loveMapper.insertPostLove", love);
	}

	@Override
	public int deleteLove(Love love) {
		return sqlSession.delete("loveMapper.deletePostLove", love);
	}

	@Override
	public Love selectMyLoveList(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}

}
