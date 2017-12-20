package persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;

@Repository
public class SrcDAOImpl implements SrcDAO {

    @Inject
    private SqlSession sqlSession;

    final String srcMapper = "mapper.srcMapper";


}
