package domain;

import java.util.Date;

public class BoardVO {
    private Integer boardId;
    private String boardTitle;
    private String boardContent;
    private String boardWriter;
    private Date boardRegdate;
    private int boardViewcnt;
    private String boardCategoryName;

    public Integer getBoardId() {
        return boardId;
    }

    public void setBoardId(Integer boardId) {
        this.boardId = boardId;
    }

    public String getBoardTitle() {
        return boardTitle;
    }

    public void setBoardTitle(String boardTitle) {
        this.boardTitle = boardTitle;
    }

    public String getBoardContent() {
        return boardContent;
    }

    public void setBoardContent(String boardContent) {
        this.boardContent = boardContent;
    }

    public String getBoardWriter() {
        return boardWriter;
    }

    public void setBoardWriter(String boardWriter) {
        this.boardWriter = boardWriter;
    }

    public Date getBoardRegdate() {
        return boardRegdate;
    }

    public void setBoardRegdate(Date boardRegdate) {
        this.boardRegdate = boardRegdate;
    }

    public int getBoardViewcnt() {
        return boardViewcnt;
    }

    public void setBoardViewcnt(int boardViewcnt) {
        this.boardViewcnt = boardViewcnt;
    }

    public String getBoardCategoryName() {
        return boardCategoryName;
    }

    public void setBoardCategoryName(String boardCategoryName) {
        this.boardCategoryName = boardCategoryName;
    }

    @Override
    public String toString() {
        return "BoardVO{" +
                "boardId=" + boardId +
                ", boardTitle='" + boardTitle + '\'' +
                ", boardContent='" + boardContent + '\'' +
                ", boardWriter='" + boardWriter + '\'' +
                ", boardRegdate=" + boardRegdate +
                ", boardViewcnt=" + boardViewcnt +
                ", boardCategoryName='" + boardCategoryName + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof BoardVO)) return false;

        BoardVO boardVO = (BoardVO) o;

        if (getBoardViewcnt() != boardVO.getBoardViewcnt()) return false;
        if (getBoardId() != null ? !getBoardId().equals(boardVO.getBoardId()) : boardVO.getBoardId() != null)
            return false;
        if (getBoardTitle() != null ? !getBoardTitle().equals(boardVO.getBoardTitle()) : boardVO.getBoardTitle() != null)
            return false;
        if (getBoardContent() != null ? !getBoardContent().equals(boardVO.getBoardContent()) : boardVO.getBoardContent() != null)
            return false;
        if (getBoardWriter() != null ? !getBoardWriter().equals(boardVO.getBoardWriter()) : boardVO.getBoardWriter() != null)
            return false;
        if (getBoardRegdate() != null ? !getBoardRegdate().equals(boardVO.getBoardRegdate()) : boardVO.getBoardRegdate() != null)
            return false;
        return boardCategoryName != null ? boardCategoryName.equals(boardVO.boardCategoryName) : boardVO.boardCategoryName == null;
    }

    @Override
    public int hashCode() {
        int result = getBoardId() != null ? getBoardId().hashCode() : 0;
        result = 31 * result + (getBoardTitle() != null ? getBoardTitle().hashCode() : 0);
        result = 31 * result + (getBoardContent() != null ? getBoardContent().hashCode() : 0);
        result = 31 * result + (getBoardWriter() != null ? getBoardWriter().hashCode() : 0);
        result = 31 * result + (getBoardRegdate() != null ? getBoardRegdate().hashCode() : 0);
        result = 31 * result + getBoardViewcnt();
        result = 31 * result + (boardCategoryName != null ? boardCategoryName.hashCode() : 0);
        return result;
    }
}
