package persistence;

import domain.BoardVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class BoardDAOImpl implements BoardDAO {

    @Inject
    private SqlSession session;

    final String namespace = "mapper.boardMapper";

    @Override
    public void createBoard(BoardVO vo) throws Exception {

        session.insert(namespace+".insert",vo);
    }

    @Override
    public BoardVO readBoard(int bno) throws Exception {
        return session.selectOne(namespace+".select",bno);
    }

    @Override
    public List<BoardVO> readAllBoard() throws Exception {

        return session.selectList(namespace+".selectAll");
    }

    @Override
    public void updateBoard(BoardVO vo) throws Exception {
        session.update(namespace+".update",vo);
    }

    @Override
    public void deleteBoard(int bno) throws Exception {
        session.delete(namespace+".delete",bno);

    }

    @Override
    public List<BoardVO> readCategoryBoard(String categoryname)throws Exception {
        return session.selectList(namespace+".selectCategoryBoard" , categoryname);
    }

}
