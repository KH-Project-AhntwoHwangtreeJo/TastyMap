package com.kh.tastyMap.post.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tastyMap.post.model.dao.PostDAO;
import com.kh.tastyMap.post.model.exception.PostException;
import com.kh.tastyMap.post.model.vo.Picture;
import com.kh.tastyMap.post.model.vo.Post;
import com.kh.tastyMap.post.model.vo.PostList;
import com.kh.tastyMap.postComment.model.dao.CommentDAO;
import com.kh.tastyMap.postComment.model.vo.PostComment;
import com.kh.tastyMap.restaurant.model.vo.Restaurant;
@Service
public class PostServiceImpl implements PostService {

	@Autowired
	PostDAO postDAO;
	@Autowired
	CommentDAO commentDAO;
	
	
	// RESTAURANT 검색하는 메소드
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

	// RESTAURANT에 식당이 없을 시 POST에서 추가하는 메소드
	@Override
	public int insertFirstRestaurant(String rName, String address) {
		return postDAO.insertFirstRestaurant(rName, address);
	}

	// POST 등록 메소드
	@Override
	public int insertPost(Post post, List<Picture> pictureList) {
		int result = 0;
		int pNo = 0;
		
		 try{
	         result = postDAO.insertPost(post);
	         
	         if(result == POST_SERVICE_ERROR) throw new PostException();
	         
	         
//	         pNo = post.getPNo(); //pNo를 리턴함.
	         pNo = postDAO.selectCurrval();
	         //System.out.println("currval: " + pNo);
	         
	         //현재 Picture객체의 pNo는 값이 없다. 
	         //1. 가져온 postNo를 대입하던지
	         //2. mapper의 insert문에서 selectKey를 사용함
	         if(pictureList.size()>0){
	            for(Picture p : pictureList){
	              // a.setBoardNo(boardNo); //게시물번호 대입
	            	p.setPNo(pNo);
	            	//System.out.println(p);
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
	
	
	// POST 전체 리스트
	@Override
	public List<PostList> postAllList() {
		return postDAO.postAllList();
	}

 
	@Override  /* 게시글 수정(조은성) */
	public int updatePost(Post post, List<Picture> pictureList) {
		int result = 0;
		int pNo = 0;
			System.out.println("postservice입니다"+ post);
		 try{
	         result = postDAO.updatePost(post);
	         
	         if(result == POST_SERVICE_ERROR) throw new PostException();
	         
	         
//	         pNo = post.getPNo(); //pNo를 리턴함.
	         pNo = post.getPNo();
	         System.out.println("currval: " + pNo);
	         
	         //현재 Picture객체의 pNo는 값이 없다. 
	         //1. 가져온 postNo를 대입하던지
	         //2. mapper의 insert문에서 selectKey를 사용함
	         
	         System.out.println("pno가지고왔니"+pictureList);
	         
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

	// post 삭제 메소드
	@Override
	public int deletePost(int pNo) {
		
		return postDAO.deletePost(pNo);
	}
	
	// PICTURE 삭제 메소드
	@Override
	public int deletePicture(int pNo) {
		return postDAO.deletePicture(pNo);
	}

	// COMMENT 삭제 메소드
	@Override
	public int deleteComment(int pNo) {
		return postDAO.deleteComment(pNo);
	}

	// post 상세페이지
	@Override
	public Post postDetail(int pNo) {
		return postDAO.postDetail(pNo);
	}
	
	// post 상세페이지 사진 출력
	@Override
	public List postDetailPhoto(int pNo) {
		return postDAO.postDetailPhoto(pNo);
	}
	
	// post 상세페이지 조회수 업데이트
	@Override
	public int updatePCNT(int pNo) {
		return postDAO.updatePCNT(pNo);
	}
	
	// 포스트 내 댓글리스트
	@Override
	public List<PostComment> commentList(int pNo) {
		return postDAO.commentList(pNo);
	}

	// 내 게시글에 좋아요한 사용자 리스트 - 안예진
	@Override
	public List<PostList> getLoveMemberList(int pno) {
		
		return postDAO.getLoveMemberList(pno);
	}

	// post 상세페이지 조회수 조회메소드
	@Override
	public int selectPCNT(int pNo) {
		return postDAO.selectPCNT(pNo);
	}
	
}
