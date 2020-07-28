package com.kh.tastyMap.post.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tastyMap.post.model.vo.Picture;
import com.kh.tastyMap.post.model.vo.Post;
import com.kh.tastyMap.post.model.vo.PostList;
import com.kh.tastyMap.postComment.model.vo.PostComment;
import com.kh.tastyMap.restaurant.model.vo.Restaurant;

@Repository("postDAO")
public class PostDAOImpl implements PostDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	@Override
	public Restaurant selectRestaurantName(String rName) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("postMapper.selectRestaurantName", rName);
	}
	
	

	@Override
	public int insertFirstRestaurant(String rName, String address) {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<>();
		param.put("rNameParam", rName);
		param.put("addressParam", address);
		
		return sqlSession.insert("postMapper.insertFirstRestaurant", param);
	}



	@Override
	public int insertPost(Post post) {
		return sqlSession.insert("postMapper.insertPost", post);
	}

	
	
	@Override
	public int selectCurrval() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("postMapper.selectCurrval");
	}



	@Override
	public int insertPicture(Picture p) {
		return sqlSession.insert("postMapper.insertPicture",p);
	}

	
	
	
	@Override
	public List<PostList> postAllList() {
		System.out.println(sqlSession.selectList("postMapper.postAllList"));
		return sqlSession.selectList("postMapper.postAllList");
	}



	@Override
	public int updatePost(Post post) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePicture(Picture p) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deletePost(int pno) {
		// TODO Auto-generated method stub
		return 0;
	}

	// post 상세 페이지
	@Override
	public Post postDetail(int pNo) {
		
		return sqlSession.selectOne("postMapper.postDetail", pNo);
	}
	
	// post 상세페이지 사진 
	@Override
	public List postDetailPhoto(int pNo) {
		
		return sqlSession.selectList("postMapper.postDetailPicture", pNo);
	}

	@Override
	public List<PostComment> commemtList(int pno) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public int updatePCNT(int pNo) {
		return sqlSession.update("postMapper.updatePCNT", pNo);
	}

}
