package com.kh.tastyMap.post.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tastyMap.post.model.dao.PostDAO;
import com.kh.tastyMap.post.model.exception.PostException;
import com.kh.tastyMap.post.model.vo.Picture;
import com.kh.tastyMap.post.model.vo.Post;
import com.kh.tastyMap.restaurant.model.vo.Restaurant;
@Service
public class PostServiceImpl implements PostService {

	@Autowired
	PostDAO postDAO;
	
	
	
	@Override
	public int selectRestaurantName(String rName) {
		// TODO Auto-generated method stub
		Restaurant restaurant = postDAO.selectRestaurantName(rName);
		
		if (restaurant == null) { // 쿼리 결과가 없으면
			return -1;
		} else { // RNO 가져오기 성공
		return restaurant.getRno();
		}
	}

	
	@Override
	public int insertFirstRestaurant(String rName, String address) {
		return postDAO.insertFirstRestaurant(rName, address);
	}


	@Override
	public int insertPost(Post post, List<Picture> pictureList) {
		int result = 0;
		int pNo = 0;
		
		 try{
	         result = postDAO.insertPost(post);
	         
	         if(result == POST_SERVICE_ERROR) throw new PostException();
	         
	         
//	         pNo = post.getPNo(); //pNo를 리턴함.
	         pNo = postDAO.selectCurrval();
	         System.out.println("currval: " + pNo);
	         
	         //현재 Picture객체의 pNo는 값이 없다. 
	         //1. 가져온 postNo를 대입하던지
	         //2. mapper의 insert문에서 selectKey를 사용함
	         if(pictureList.size()>0){
	            for(Picture p : pictureList){
	              // a.setBoardNo(boardNo); //게시물번호 대입
	            	p.setPNo(pNo);
	            	System.out.println(p);
	               result = postDAO.insertPicture(p);
	               if(result == POST_SERVICE_ERROR) throw new PostException();
	            }
	         }
	      } catch(Exception e){
//	         throw new BoardException("게시물등록오류");
	         throw e;
	      }
	      return result;
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

	// post 상세페이지
	@Override
	public Post PostDetail(int pno) {
		return postDAO.PostDetail(pno);
	}

}
