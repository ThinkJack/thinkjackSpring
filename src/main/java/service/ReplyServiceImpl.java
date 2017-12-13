package service;


import domain.Criteria;
import domain.ReplyLikeVO;
import domain.ReplyVO;
import org.springframework.stereotype.Service;
import persistence.ReplyDAO;

import javax.inject.Inject;
import java.util.List;

@Service
public class ReplyServiceImpl implements ReplyService{

    @Inject
    ReplyDAO dao;


    //생성
    @Override
    public void insertReply(ReplyVO vo) throws Exception {
        dao.createReply(vo);
    }
    //찾기
    @Override
    public List<ReplyVO> listReply(Integer boardId) throws Exception {
        return dao.readReply(boardId);
    }
    //댓글,대댓글 정정
    @Override
    public void updateReply(ReplyVO vo) throws Exception {
        dao.updateReply(vo);
    }
    //삭제
    @Override
    public void deleteReply(Integer replyId) throws Exception {
        dao.deleteReply(replyId);

    }
    //대댓글 생성
    @Override
    public void reInsertReply(ReplyVO vo) throws Exception {
        dao.reCreateReply(vo);
    }
    //대댓글 찾기
    @Override
    public List<ReplyVO> reListReply(Integer replyId) throws Exception {
        return dao.reReadReply(replyId);
    }



//    페이징처리와 전체 글목록 보기
    @Override
    public List<ReplyVO> listReplyPage(Integer replyId, Criteria cri) throws Exception {
        return dao.listPage(replyId,cri);
    }
//댓글 수
    @Override
    public int count(Integer replyId) throws Exception {
        return dao.count(replyId);
    }

//좋아요 부분
    //좋아요 추가
    @Override
    public void insertReplyLike(ReplyLikeVO vo) throws Exception {
        dao.createReplyLikeCnt(vo);
        dao.updateReplyLikeCnt(vo.getReplyId());
        //replyVO 에서 불러와야 한다
    }

    //좋아요 삭제
    @Override
    public void deleteReplyLike(ReplyLikeVO vo) throws Exception {
    dao.deleteReplyLikeCnt(vo);
    dao.updateReplyLikeCnt2(vo.getReplyId());
    }
}
