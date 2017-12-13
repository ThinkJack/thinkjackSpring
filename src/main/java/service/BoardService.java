package service;

import domain.BoardLikeVO;
import domain.BoardVO;
import domain.SearchCriteria;

import java.util.List;

public interface BoardService {

    public void insertBoard(BoardVO vo,String category) throws Exception;

    public BoardVO readBoard(int boardId,String category) throws  Exception;

    public void updateBoard(BoardVO vo,String category)throws Exception;

    public void deleteBoard(int boardId,String category)throws Exception;

    public void insertBoardLike(BoardLikeVO vo) throws Exception;

    public void deleteBoardLike(BoardLikeVO vo) throws Exception;

    public List<BoardVO> searchCriteria(SearchCriteria cri,String category)
            throws Exception;

    public int searchCount(SearchCriteria cri,String category) throws Exception;

}
