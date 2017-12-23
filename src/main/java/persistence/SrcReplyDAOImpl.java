package persistence;

import domain.ReplyVO;
import domain.SrcReplyVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class SrcReplyDAOImpl implements SrcReplyDAO {

    @Inject
    private SqlSession sqlSession;

//    final String srcReplyMapper = "mapper.srcReplyMapper";

    // 댓글 목록
    @Override
    public List<SrcReplyVO> list(String srcId) {
        return sqlSession.selectList("reply.listReply", srcId);
    }
    // 댓글 작성
    @Override
    public void create(SrcReplyVO vo) {
        sqlSession.insert("reply.insertReply", vo);
    }
    // 댓글 수정
    @Override
    public void update(SrcReplyVO vo) {
        // TODO Auto-generated method stub
        sqlSession.update("reply.updateReply", vo);


    }
    // 댓글 삭제
    @Override
    public void delete(Integer replyId) {
        // TODO Auto-generated method stub
        sqlSession.delete("reply.deleteReply", replyId);


    }

}

