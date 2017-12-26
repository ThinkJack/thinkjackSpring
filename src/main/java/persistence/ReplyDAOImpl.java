package persistence;

import domain.Criteria;
import domain.ReplyLikeVO;
import domain.ReplyVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Repository
public class ReplyDAOImpl implements ReplyDAO {

    @Inject
    private SqlSession session;
    final String namespace = "mapper.replyMapper";


    //생성(insert)
    @Override
    public void createReply(ReplyVO vo) throws Exception {

        session.insert(namespace + ".insert", vo);
    }
    //댓글 전체 목록(select)

    @Override
    public List<ReplyVO> readReply(Integer boardId) throws Exception {

        return session.selectList(namespace + ".select", boardId);
    }

    //정정(update)
    @Override
    public void updateReply(ReplyVO vo) throws Exception {

        session.update(namespace + ".update", vo);
    }

    //삭제(delete)
    @Override
    public void deleteReply(int replyId) throws Exception {
        session.delete(namespace + ".delete", replyId);
    }
    //대댓글 입력
    @Override
    public void reCreateReply(ReplyVO vo) throws Exception {
        session.insert(namespace + ".insert2", vo);
    }

    //대댓글 찾기
    @Override
    public List<ReplyVO> reReadReply(Integer replyId) throws Exception {
        return session.selectList(namespace + ".select2", replyId);
    }


    @Override
    public List<ReplyVO> listPage(Integer boardId, Criteria cri)throws Exception {
        Map<String, Object> paramMap = new HashMap<>();

        paramMap.put("boardId", boardId);
        paramMap.put("cri", cri);
        return session.selectList(namespace + ".listPage", paramMap);
    }

    //페이징 처리
    @Override
    public int count(Integer boardId) throws Exception{

        return session.selectOne(namespace+".count",boardId);
    }


    @Override
    public void createReplyLikeCnt(ReplyLikeVO vo) throws Exception {
        session.insert(namespace+".createReplyLikeCnt",vo);
    }

    @Override
    public void updateReplyLikeCnt(int reply_id) throws Exception {
        session.update(namespace+".updateReplyLikeCnt",reply_id);
    }

    @Override
    public int getReplyLike(ReplyLikeVO vo) throws Exception {

        return session.selectOne(namespace + ".heart", vo);
    }

    @Override
    public void deleteReplyLikeCnt(ReplyLikeVO vo) throws Exception {
        session.delete(namespace+".deleteReplyLikeCnt",vo);
    }

 }

