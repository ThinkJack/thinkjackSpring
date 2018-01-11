package persistence;

import domain.BoardLikeVO;
import domain.BoardVO;
import domain.Criteria;
import domain.SearchCriteria;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class BoardDAOImpl implements BoardDAO {

    @Inject
    private SqlSession session;

    final String board = "mapper.BoardMapper_";

    final String boardLike = "mapper.boardLikeMapper";

    @Override
    public void insertBoard(BoardVO vo,String category) throws Exception {


        session.insert(board+category+".create",vo);
    }

    @Override
    public BoardVO readBoard(int bno,String category) throws Exception {

        return session.selectOne(board+category+".read",bno);
    }

    @Override
    public void updateBoard(BoardVO vo,String category) throws Exception {

        session.update(board+category+".update",vo);
    }

    @Override
    public void deleteBoard(int bno,String category) throws Exception {

        session.delete(board+category+".delete",bno);

    }

    @Override
    public List<BoardVO> search(SearchCriteria cri,String category) throws Exception {


        return session.selectList(board+category + ".search", cri);
    }

    @Override
    public int searchCount(SearchCriteria cri,String category) throws Exception {

        return session.selectOne(board+category + ".searchCount", cri);
    }

    @Override
    public void increaseViewcnt(int boardId,String category ) throws Exception {
        session.update(board+category + ".increaseViewcnt", boardId);
    }

    @Override
    public int getBoardLike(BoardLikeVO vo) throws Exception {
        return session.selectOne(boardLike+".getBoardLike",vo);
    }

    @Override
    public void insertBoardLike(BoardLikeVO vo) throws Exception {
        session.insert(boardLike+".createBoardLike",vo);
    }

    @Override
    public void deleteBoardLike(BoardLikeVO vo) throws Exception {
        session.delete(boardLike+".deleteBoardLike",vo);
    }

    @Override
    public void updateBoardLike(int boardId) throws Exception {
        session.update(boardLike+".updateBoardLike",boardId);
    }




}
