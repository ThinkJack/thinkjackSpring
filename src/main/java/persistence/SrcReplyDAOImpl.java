package persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;

@Repository
public class SrcReplyDAOImpl implements SrcReplyDAO {

    @Inject
    private SqlSession sqlSession;

    final String srcReplyMapper = "mapper.srcReplyMapper";
}

