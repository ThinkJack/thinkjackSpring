package persistence;

import domain.ReplyVO;

import java.util.List;

public interface ReplyDAO {

    public void createReply(ReplyVO vo) throws Exception;
    //생성(insert)
    public ReplyVO readReply(Integer boardId) throws Exception;
    //조회(select)
    public List<ReplyVO> readAllReply() throws  Exception;
    //댓글 전체 목록(select)
    public void updateReply(ReplyVO vo) throws Exception;
    //정정(update)
    public void deleteReply(Integer replyId) throws Exception;
    //삭제(delete)

    //생성(insert)
    public void reCreateReply(ReplyVO vo) throws Exception;
    //댓글 전체 목록(select)
    public List<ReplyVO> reReadReply(Integer replyId) throws  Exception;
    //대댓글 정정(update)
    public void reUpdateReply(ReplyVO vo) throws Exception;
    //대댓글 삭제(deledte)
    public void reDeleteReply(Integer replyParent) throws Exception;
}
