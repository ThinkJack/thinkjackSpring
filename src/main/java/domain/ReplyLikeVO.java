package domain;

public class ReplyLikeVO {
    //하트Id
    Integer replyLikeId;
    //댓글번호
    Integer replyId;
    //유저ID
    Integer userId;

    public Integer getReplyLikeId() {
        return replyLikeId;
    }

    public void setReplyLikeId(Integer replyLikeId) {
        this.replyLikeId = replyLikeId;
    }

    public Integer getReplyId() {
        return replyId;
    }

    public void setReplyId(Integer replyId) {
        this.replyId = replyId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }


    @Override
    public String toString() {
        return "ReplyLikeVO{" +
                "replyLikeId=" + replyLikeId +
                ", replyId=" + replyId +
                ", userId=" + userId +
                '}';
    }
}
