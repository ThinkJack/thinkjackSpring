package service;

import domain.SrcVO;

import javax.servlet.http.HttpServletRequest;

public interface SrcService {

    SrcVO readSrc(HttpServletRequest request, SrcVO vo)throws Exception;
    String saveSrc(HttpServletRequest request, SrcVO vo)throws Exception;
    void updateSrcStatus(String srcId)throws Exception;
}
