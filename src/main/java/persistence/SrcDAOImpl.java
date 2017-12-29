package persistence;

import domain.SrcVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.Map;

@Repository
public class SrcDAOImpl implements SrcDAO {

    @Inject
    private SqlSession sqlSession;

    final String srcMapper = "mapper.srcMapper";

    @Override
    public void insertSrc(SrcVO vo) {
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
    public void updateSrcWriter(int srcWriter, String srcId) {
        Map map = new HashMap<>();
        map.put("srcWriter", srcWriter);
        map.put("srcId", srcId);
        sqlSession.update(srcMapper + ".updateSrcWriter", map);
    }
}
