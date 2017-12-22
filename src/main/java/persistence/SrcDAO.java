package persistence;

import domain.SrcVO;

public interface SrcDAO {
    public void insertSrc(SrcVO vo);
    public void updateSrc(SrcVO vo);
    public void updateSrcStatus(String srcId);
    public SrcVO selectSrcOne(String srcId);


}
