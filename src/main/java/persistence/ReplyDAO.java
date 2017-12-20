package persistence;

import domain.Criteria;
import domain.ReplyLikeVO;
import domain.ReplyVO;

import java.util.List;

public interface ReplyDAO {
    //생성(insert)
    public void createReply(ReplyVO vo) throws Exception;
    //댓글 전체 목록(select)
    public List<ReplyVO> readReply(Integer boardId) throws  Exception;
    //정정(update)
    public void updateReply(ReplyVO vo) throws Exception;
    //삭제(delete)
    public void deleteReply(int replyId) throws Exception;


    //생성(insert)
    public void reCreateReply(ReplyVO vo) throws Exception;
    //댓글 전체 목록(select)
    public List<ReplyVO> reReadReply(Integer replyId) throws  Exception;


    //페이지
    public List<ReplyVO> listPage(Integer boardId, Criteria cri) throws  Exception;
    //페이지 처리를 하기위해서 count작성
    public int count(Integer boardId) throws Exception;


    //좋아요 누르면 tbl_like_cnt에 값이 추가된다.(db에서 중복처리 완료)
    public void createReplyLikeCnt(ReplyLikeVO vo)throws Exception;
    //   reply_likecnt가 +1 ,-1 되되록
    public void updateReplyLikeCnt(int reply_id) throws Exception;

    //좋아요 목록(select)
    public Integer readLike(ReplyLikeVO vo) throws  Exception;


    public void deleteReplyLikeCnt(ReplyLikeVO vo) throws Exception;


    //생성(insert)
    public void reCreateReply(ReplyVO vo) throws Exception;
    //댓글 전체 목록(select)
    public List<ReplyVO> reReadReply(Integer replyId) throws  Exception;
    //대댓글 정정(update)
    public void reUpdateReply(ReplyVO vo) throws Exception;
    //대댓글 삭제(deledte)
    public void reDeleteReply(Integer replyParent) throws Exception;
}

