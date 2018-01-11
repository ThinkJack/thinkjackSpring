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
    private int boardLikecnt;
    private String boardWriterProfile;

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
                ", boardLikecnt=" + boardLikecnt +
                ", boardWriterProfile='" + boardWriterProfile + '\'' +
                '}';
    }

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

    public int getBoardLikecnt() {
        return boardLikecnt;
    }

    public void setBoardLikecnt(int boardLikecnt) {
        this.boardLikecnt = boardLikecnt;
    }

    public String getBoardWriterProfile() {
        return boardWriterProfile;
    }

    public void setBoardWriterProfile(String boardWriterProfile) {
        this.boardWriterProfile = boardWriterProfile;
    }
}
