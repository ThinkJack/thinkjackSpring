package service;

import domain.BoardLikeVO;
import domain.BoardVO;
import domain.SearchCriteria;
import org.springframework.stereotype.Service;
import persistence.BoardDAO;

import javax.inject.Inject;
import java.util.List;

@Service
public class BoardServiceImpl implements BoardService {

    @Inject
    BoardDAO dao;


    @Override
    public void insertBoard(BoardVO vo, String category) throws Exception {
        dao.insertBoard(vo,category);
    }

    @Override
    public BoardVO readBoard(int boardId, String category) throws Exception {
        return dao.readBoard(boardId,category);
    }

    @Override
    public void updateBoard(BoardVO vo, String category) throws Exception {
        dao.updateBoard(vo,category);
    }

    @Override
    public void deleteBoard(int boardId, String category) throws Exception {
        dao.deleteBoard(boardId,category);
    }

    @Override
    public void insertBoardLike(BoardLikeVO vo) throws Exception {
        dao.insertBoardLike(vo);
        dao.updateBoardLike(vo.getBoardId());
    }

    @Override
    public void deleteBoardLike(BoardLikeVO vo) throws Exception {
        dao.deleteBoardLike(vo);
        dao.updateBoardLike(vo.getBoardId());
    }

    @Override
    public List<BoardVO> searchCriteria(SearchCriteria cri, String category) throws Exception {
        return dao.search(cri,category);
    }

    @Override
    public int searchCount(SearchCriteria cri, String category) throws Exception {
        return dao.searchCount(cri, category);
    }

    @Override
    public void increaseViewcnt(int boardId, String category) throws Exception {
        dao.increaseViewcnt(boardId,category);
    }
}
