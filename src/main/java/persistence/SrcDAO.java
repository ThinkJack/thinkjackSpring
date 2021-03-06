package persistence;

import domain.Criteria;
import domain.SearchCriteria;
import domain.SrcLikeVO;
import domain.SrcVO;

import java.util.List;
import java.util.Map;

public interface SrcDAO {
    SrcVO selectSrcOne(String srcId);

    void insertSrc(SrcVO vo);

    void updateSrc(SrcVO vo);

    void updateSrcWriter(Map map);

    void updateSrcStatus(String srcId);

    int readLike(SrcLikeVO vo);

    int selectSrcLikeCnt(String srcId);

    int updateSrcLikeCnt(SrcVO vo);

    void insertSrcLike(SrcLikeVO vo);

    void deleteSrcLike(SrcLikeVO vo);

    void updateSrcViewCnt(String srcId);

    List selectSrcList(SearchCriteria cri);

    int srcListSearchCount(SearchCriteria cri) throws Exception;

    void updateSrcDelete(SrcVO vo);
}
