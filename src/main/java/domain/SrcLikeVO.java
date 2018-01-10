package domain;

public class SrcLikeVO {
    private int srcLikeId;
    private String srcId;
    private int userId;

    public int getSrcLikeId() {
        return srcLikeId;
    }

    public void setSrcLikeId(int srcLikeId) {
        this.srcLikeId = srcLikeId;
    }

    public String getSrcId() {
        return srcId;
    }

    public void setSrcId(String srcId) {
        this.srcId = srcId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "SrcLikeVO{" +
                "srcLikeId=" + srcLikeId +
                ", srcId='" + srcId + '\'' +
                ", userId=" + userId +
                '}';
    }
}
