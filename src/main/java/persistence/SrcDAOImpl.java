package persistence;

import domain.Criteria;
import domain.SearchCriteria;
import domain.SrcLikeVO;
import domain.SrcVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class SrcDAOImpl implements SrcDAO {

    @Inject
    private SqlSession sqlSession;

    final String srcMapper = "mapper.srcMapper";
    final String srcLikeMapper = "mapper.srcLikeMapper";
    final String srcBoardMapper = "mapper.srcBoardMapper";

    @Override
    public void insertSrc(SrcVO vo) {
//        if(vo.getSrcWriter() != 0){
//            sqlSession.insert(srcMapper + ".insertSrcWriter", vo);
//        }else{
//            sqlSession.insert(srcMapper + ".insertSrcWriterX", vo);
//        }
        sqlSession.insert(srcMapper + ".insertSrc", vo);
    }

    @Override
    public void updateSrc(SrcVO vo) {
        sqlSession.update(srcMapper + ".updateSrc", vo);
    }

    @Override
    public void updateSrcStatus(String srcId) {
        sqlSession.update(srcMapper + ".updateSrcStatus", srcId);
    }

    @Override
    public SrcVO selectSrcOne(String srcId) {
        return sqlSession.selectOne(srcMapper + ".selectSrcOne", srcId);
    }

    @Override
    public void updateSrcWriter(Map map) {
        sqlSession.update(srcMapper + ".updateSrcWriter", map);
    }

    @Override
    public int updateSrcLikeCnt(SrcVO vo) {
        return sqlSession.update(srcMapper + ".updateSrcLikeCnt", vo);
    }

    @Override
    public int readLike(SrcLikeVO vo) {
        return sqlSession.selectOne(srcLikeMapper + ".selectLikeSrc", vo);
    }

    @Override
    public void insertSrcLike(SrcLikeVO vo) {
        sqlSession.insert(srcLikeMapper + ".insertLikeSrc", vo);
    }

    @Override
    public void deleteSrcLike(SrcLikeVO vo) {
        sqlSession.delete(srcLikeMapper + ".deleteLikeSrc", vo);
    }

    @Override
    public int selectSrcLikeCnt(String srcId) {
        return sqlSession.selectOne(srcLikeMapper + ".selectLikeSrcCnt", srcId);
    }

    @Override
    public void updateSrcViewCnt(String srcId) {
        sqlSession.update(srcMapper + ".updateSrcViewCnt", srcId);
    }

    @Override
    public List selectSrcList(SearchCriteria cri){
        return sqlSession.selectList(srcBoardMapper + ".selectSrcBoardList", cri);
    }

    @Override
    public int srcListSearchCount(SearchCriteria cri) throws Exception {
        return sqlSession.selectOne(srcBoardMapper + ".srcListSearchCount", cri);
    }

    @Override
    public void updateSrcDelete(SrcVO vo) {
        sqlSession.update(srcMapper + ".updateSrcDelete", vo);
    }
}
