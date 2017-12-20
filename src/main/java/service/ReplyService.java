package service;


import domain.Criteria;
import domain.ReplyLikeVO;
import domain.ReplyVO;

import java.util.List;

public interface ReplyService {

    //    생성(insert)
    public void insertReply(ReplyVO vo) throws Exception;
    //댓글 전체 목록(select)
    public List<ReplyVO> listReply(Integer boardId) throws  Exception;
    //정정(update)
    public void updateReply(ReplyVO vo) throws Exception;
    //삭제(delete)
    public void deleteReply(int replyId) throws Exception;


    //생성(insert)
    public void reInsertReply(ReplyVO vo) throws Exception;
    //댓글 전체 목록(select)
    public List<ReplyVO> reListReply(Integer replyId) throws  Exception;


    //페이징 처리
    public List<ReplyVO> listReplyPage(Integer boardId, Criteria cri)throws Exception;
    //댓글 수
    public int count(Integer boardId) throws  Exception;

   //좋아요 추가
    public void insertReplyLike(ReplyLikeVO vo) throws  Exception;
    //좋아요 업데이트
    public void deleteReplyLike(ReplyLikeVO vo) throws  Exception;
   // 좋아요 버튼
    public Integer readLike(ReplyLikeVO vo)  throws Exception;




    
}
