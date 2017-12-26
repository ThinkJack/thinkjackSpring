package service;

import domain.SrcVO;

import javax.servlet.http.HttpServletRequest;

public interface SrcService {

    public void readSrc(HttpServletRequest request, SrcVO vo)throws Exception;
    public void saveSrc(SrcVO vo)throws Exception;
    public void updateSrcStatus(String srcId)throws Exception;
}
