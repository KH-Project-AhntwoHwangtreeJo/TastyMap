package com.kh.tastyMap.post.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.tastyMap.post.model.vo.Picture;
import com.kh.tastyMap.post.model.vo.Post;
@Service
public class PostServiceImpl implements PostService {

	@Override
	public int insertPost(Post post, List<Picture> pictureList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePost(Post post, List<Picture> pictureList) {
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
		// TODO Auto-generated method stub
		return null;
	}

}