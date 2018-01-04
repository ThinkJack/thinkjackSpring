package service;

import domain.Criteria;
import domain.SrcLikeVO;
import domain.SrcVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

public interface SrcService {

    Map readSrc(HttpServletRequest request)throws Exception;
    String saveSrc(HttpServletRequest request, HttpServletResponse response, SrcVO vo)throws Exception;
    Map srcLike(HttpServletRequest request, SrcLikeVO vo);

    List srcList(Criteria cri)throws Exception;

    int listCountCriteria(Criteria cri) throws Exception;

}
