package service;

import domain.BoardVO;
import org.springframework.stereotype.Service;
import persistence.BoardDAO;

import javax.inject.Inject;
import java.util.List;

@Service
public class BoardServiceImpl implements BoardService {

    @Inject
    BoardDAO dao;


    @Override
    public void insertBoard(BoardVO vo) throws Exception {
        dao.createBoard(vo);
    }

    @Override
    public BoardVO readBoard(int bno) throws Exception {
        return dao.readBoard(bno);
    }

    @Override
    public List<BoardVO> listAllBoard() throws Exception {
        return dao.readAllBoard();
    }

    @Override
    public void updateBoard(BoardVO vo) throws Exception {
        dao.updateBoard(vo);

    }

    @Override
    public void deleteBoard(int bno) throws Exception {
        dao.deleteBoard(bno);
    }

    @Override
    public List<BoardVO> readCategoryBoard(String categoryname) throws Exception {
        return dao.readCategoryBoard(categoryname);
    }
}
