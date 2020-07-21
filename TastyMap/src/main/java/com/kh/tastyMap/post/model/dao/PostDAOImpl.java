package com.kh.tastyMap.post.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tastyMap.post.model.vo.Picture;
import com.kh.tastyMap.post.model.vo.Post;
import com.kh.tastyMap.postComment.model.vo.PostComment;

@Repository("postDAO")
public class PostDAOImpl implements PostDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertPost(Post post) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertPicture(Picture p) {
		// TODO Auto-generated method stub
		return 0;
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

	@Override
	public List<Post> postList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Post PostDetail(int pno) {
		return sqlSession.selectOne("postMapper.PostDetail", pno);
	}

	@Override
	public List<PostComment> commemtList(int pno) {
		// TODO Auto-generated method stub
		return null;
	}

}
