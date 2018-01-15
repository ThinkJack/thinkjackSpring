package service;


import domain.Criteria;
import domain.SrcReplyVO;

import java.util.List;

public interface SrcReplyService {
    // 댓글 목록
    public List<SrcReplyVO> list(String srcId, Criteria cri) throws Exception;

    //댓글 수
    public int count(String srcId) throws Exception;

    //무한스크롤
//    List<SrcReplyVO> infiniteScrollDown(int replyId) throws Exception;


    // 댓글 입력
    public  void create(SrcReplyVO vo) throws Exception;
    // 댓글 수정
    public  void update(SrcReplyVO vo) throws Exception;
    // 댓글 삭제
    public void delete(Integer replyId)throws Exception;




//    String create(HttpServletRequest request, SrcReplyVO vo);
}
