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


    //생성(insert)
    @Override
    public void createReply(ReplyVO vo) throws Exception {
        session.insert(namespace+".insert",vo);
    }
    //댓글 전체 목록(select)

    @Override
    public List<ReplyVO> readReply(Integer boardId) throws Exception {
        return  session.selectList(namespace+".select",boardId);
    }
    //정정(update)
    @Override
    public void updateReply(ReplyVO vo) throws Exception {

        session.update(namespace+".update",vo);
    }
    //삭제(delete)
    @Override
    public void deleteReply(Integer replyId) throws Exception {

        session.delete(namespace+".delete",replyId);
    }
}
