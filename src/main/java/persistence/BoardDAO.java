package persistence;

import domain.BoardLikeVO;
import domain.BoardVO;

import java.util.List;


public interface BoardDAO {

    public void insertBoard(BoardVO vo) throws Exception;

    public BoardVO readBoard(int bno) throws  Exception;

    public List<BoardVO> readAllBoard() throws  Exception;

    public void updateBoard(BoardVO vo)throws Exception;

    public void deleteBoard(int boardId)throws Exception;

    public List<BoardVO> readCategoryBoard(String categoryname) throws Exception;

    public void insertBoardLike(BoardLikeVO vo) throws Exception;

    public void deleteBoardLike(BoardLikeVO vo) throws Exception;

    public void updateBoardLike(int boardId)throws Exception;

}
