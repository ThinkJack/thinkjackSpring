package persistence;

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
    public void deleteReply(Integer replyId) throws Exception;


}

