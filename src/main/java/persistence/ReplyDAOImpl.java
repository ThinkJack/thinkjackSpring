package persistence;

import domain.ReplyVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;


@Repository
public class ReplyDAOImpl implements ReplyDAO {

    @Inject
    private SqlSession session;

    final String namespace = "mapper.replyMapper";

    @Override
    public List<ReplyVO> readAllReply() throws Exception {
        return null;
    }

    @Override
    public void createReply(ReplyVO vo) throws Exception {
        session.insert(namespace+".insert",vo);
    }

    @Override
    public ReplyVO readReply(Integer boardId) throws Exception {
        return  session.selectOne(namespace+".select",boardId);
    }

    @Override
    public void updateReply(ReplyVO vo) throws Exception {

        session.update(namespace+".update",vo);
    }

    @Override
    public void deleteReply(Integer replyId) throws Exception {

        session.delete(namespace+".delete",replyId);
    }

    @Override
    public void reCreateReply(ReplyVO vo) throws Exception {

    }

    @Override
    public List<ReplyVO> reReadReply(Integer replyId) throws Exception {
        return null;
    }

    @Override
    public void reUpdateReply(ReplyVO vo) throws Exception {

    }

    @Override
    public void reDeleteReply(Integer replyParent) throws Exception {

    }
}
