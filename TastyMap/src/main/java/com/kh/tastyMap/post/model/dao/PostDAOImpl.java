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
	
	// RESTAURANT 검색하는 메소드
	@Override
	public Restaurant selectRestaurantName(String rName) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("postMapper.selectRestaurantName", rName);
	}
	
	
	// RESTAURANT에 식당이 없을 시 POST에서 추가하는 메소드
	@Override
	public int insertFirstRestaurant(String rName, String address) {
		// TODO Auto-generated method stub
		Map<String, Object> param = new HashMap<>();
		param.put("rNameParam", rName);
		param.put("addressParam", address);
		
		return sqlSession.insert("postMapper.insertFirstRestaurant", param);
	}


	// POST 등록
	@Override
	public int insertPost(Post post) {
		return sqlSession.insert("postMapper.insertPost", post);
	}

	
	// 현재 POST 번호 가져오는 메소드
	@Override
	public int selectCurrval() {
		return sqlSession.selectOne("postMapper.selectCurrval");
	}


	// PICTURE 등록 메소드
	@Override
	public int insertPicture(Picture p) {
		return sqlSession.insert("postMapper.insertPicture",p);
	}

	
	
	// POST 전체 리스트
	@Override
	public List<PostList> postAllList() {
		return sqlSession.selectList("postMapper.postAllList");
	}

	//여기까지 안예진


	@Override /* 게시글 수정(조은성) */
	public int updatePost(Post post) {
		return sqlSession.update("postMapper.updatePost", post);
	}

	@Override
	public int updatePicture(Picture p) {
		return 0;
	}

	//POST 삭제
	@Override
	public int deletePost(int pNo) {	
		return sqlSession.update("postMapper.deletePost", pNo);
	}
	
	// PICTURE 삭제
	@Override
	public int deletePicture(int pNo) {
		return sqlSession.update("postMapper.deletePicture", pNo);
	}
	
	// COMMENT 삭제
	@Override
	public int deleteComment(int pNo) {
		return sqlSession.update("postMapper.deleteComment",pNo);
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

	// 포스트 내 댓글 리스트
	@Override
	public List<PostComment> commentList(int pNo) {
		return sqlSession.selectList("postMapper.selectPcommentList", pNo);
	}



	@Override
	public int updatePCNT(int pNo) {
		return sqlSession.update("postMapper.updatePCNT", pNo);
	}

	// 내 게시글에 좋아요한 사용자 리스트 - 안예진
	@Override
	public List<PostList> getLoveMemberList(int pno) {
		return sqlSession.selectList("postMapper.getLoveMemberList", pno);
	}
}
