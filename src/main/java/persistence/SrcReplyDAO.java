package persistence;

import domain.SrcReplyVO;

import java.util.List;

public interface SrcReplyDAO {
    // 댓글 목록
     List<SrcReplyVO> list(String srcId);
    // 댓글 입력
     void create(SrcReplyVO vo);
    // 댓글 수정
     void update(SrcReplyVO vo);
    // 댓글 삭제
     void delete(Integer replyId);

}
