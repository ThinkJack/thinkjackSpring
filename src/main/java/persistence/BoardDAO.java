package persistence;

import domain.BoardVO;

import java.util.List;


public interface BoardDAO {

    public void createBoard(BoardVO vo) throws Exception;

    public BoardVO readBoard(int bno) throws  Exception;

    public List<BoardVO> readAllBoard() throws  Exception;

    public void updateBoard(BoardVO vo)throws Exception;

    public void deleteBoard(int bno)throws Exception;

    public List<BoardVO> readCategoryBoard(String categoryname) throws Exception;

}
