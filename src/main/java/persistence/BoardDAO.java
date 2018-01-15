package persistence;

import domain.BoardLikeVO;
import domain.BoardVO;
import domain.Criteria;
import domain.SearchCriteria;

import java.util.List;


public interface BoardDAO {

    public void insertBoard(BoardVO vo,String category) throws Exception;

    public BoardVO readBoard(int bno,String category) throws  Exception;

    public void updateBoard(BoardVO vo,String category)throws Exception;

    public void deleteBoard(int boardId,String category)throws Exception;

    public List<BoardVO> search(SearchCriteria cri,String category)throws Exception;

    public int searchCount(SearchCriteria cri,String category)throws Exception;

    public void insertBoardLike(BoardLikeVO vo) throws Exception;

    public void deleteBoardLike(BoardLikeVO vo) throws Exception;

    public void updateBoardLike(int boardId)throws Exception;

    public void increaseViewcnt(int boardId,String category) throws Exception;

    public int getBoardLike(BoardLikeVO vo) throws Exception;

}
