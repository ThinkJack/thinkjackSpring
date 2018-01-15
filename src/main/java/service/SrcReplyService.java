package service;


import domain.SrcReplyVO;

import java.util.List;

public interface SrcReplyService {
    // 댓글 목록
    List<SrcReplyVO> list(String srcId) throws Exception;
    // 댓글 입력
    void create(SrcReplyVO vo) throws Exception;
    // 댓글 수정
    void update(SrcReplyVO vo) throws Exception;
    // 댓글 삭제
    void delete(Integer replyId)throws Exception;

}
