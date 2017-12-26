package persistence;

import domain.SrcVO;

public interface SrcDAO {
    void insertSrc(SrcVO vo);
    void updateSrc(SrcVO vo);
    void updateSrcStatus(String srcId);
    SrcVO selectSrcOne(String srcId);


}
