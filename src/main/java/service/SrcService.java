package service;

import domain.Criteria;
import domain.SearchCriteria;
import domain.SrcLikeVO;
import domain.SrcVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

public interface SrcService {

    Map readSrc(HttpServletRequest request) throws Exception;

    String saveSrc(HttpServletRequest request, HttpServletResponse response, SrcVO vo) throws Exception;

    Map srcLike(HttpServletRequest request, SrcLikeVO vo);

    int selectSrcLike(HttpServletRequest request, SrcLikeVO vo);

    List<SrcVO> srcList(SearchCriteria cri) throws Exception;

    int srcListSearchCount(SearchCriteria cri) throws Exception;

    void srcDelete(SrcVO vo) throws Exception;
}
