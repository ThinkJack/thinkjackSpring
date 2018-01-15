package persistence;

import domain.Criteria;
import domain.ReplyVO;
import domain.SrcReplyVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class SrcReplyDAOImpl implements SrcReplyDAO {

    @Inject
    SqlSession sqlSession;

    final String srcReplyMapper = "mapper.srcReplyMapper";

    // 댓글 목록 & 페이징
    @Override
    public List<SrcReplyVO> list(String srcId, Criteria cri) throws Exception {
        Map<String, Object> paramMap = new HashMap<>();

        paramMap.put("srcId", srcId);
        paramMap.put("cri", cri);

        return sqlSession.selectList(srcReplyMapper+".srcListReply", paramMap);
    }

    //댓글 수
    @Override
    public int count(String srcId) throws Exception {
        return sqlSession.selectOne(srcReplyMapper + ".count", srcId);
    }


    // 무한 스크롤
//    @Override
//    public List<SrcReplyVO> infiniteScrollDown(int replyId ) {
//        return sqlSession.selectList(srcReplyMapper+".infiniteScrollDown", replyId);
//    }


    // 댓글 작성
    @Override
    public void create(SrcReplyVO vo) throws Exception {
        sqlSession.insert(srcReplyMapper+".insertReply", vo);
    }

    // 댓글 수정
    @Override
    public void update(SrcReplyVO vo) throws Exception{
        // TODO Auto-generated method stub
        sqlSession.update(srcReplyMapper+".updateReply", vo);
    }

    // 댓글 삭제
    @Override
    public void delete(Integer replyId) throws Exception {
        // TODO Auto-generated method stub
        sqlSession.delete(srcReplyMapper+".deleteReply", replyId);


    }

}

