package domain;

public class BoardLikeVO {

    private int boardLikeId;
    private int boardId;
    private int userId;

    public int getBoardLikeId() {
        return boardLikeId;
    }

    public void setBoardLikeId(int boardLikeId) {
        this.boardLikeId = boardLikeId;
    }

    public int getBoardId() {
        return boardId;
    }

    public void setBoardId(int boardId) {
        this.boardId = boardId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "BoardLikeVO{" +
                "boardLikeId=" + boardLikeId +
                ", boardId=" + boardId +
                ", userId=" + userId +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof BoardLikeVO)) return false;

        BoardLikeVO that = (BoardLikeVO) o;

        if (getBoardLikeId() != that.getBoardLikeId()) return false;
        if (getBoardId() != that.getBoardId()) return false;
        return getUserId() == that.getUserId();
    }

}
