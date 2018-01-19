package persistence;

import domain.Criteria;
import domain.SrcReplyVO;

import java.util.List;

public interface SrcReplyDAO {
    // 댓글 목록
    public List<SrcReplyVO> list(String srcId, Criteria cri) throws Exception;

    //댓글 수
    public int count(String srcId) throws Exception;

    // 댓글 무한 스크롤
//    List<SrcReplyVO> infiniteScrollDown(int replyId);


    // 댓글 입력
    public void create(SrcReplyVO vo) throws Exception;

    // 댓글 수정
    public void update(SrcReplyVO vo) throws Exception;

    // 댓글 삭제
    public void delete(Integer replyId) throws Exception;

}
