package domain;

import java.util.Date;

public class ReplyVO {

	private Integer replyId;
//	댓글 번호
	private Integer boardId;
//글 번호
	private String replyText;
//	댓글 내용
	private String replyWriter;
//	유저 ID

    private  String replyProfile;
	//	날짜부분
	private Date replyRegdate;
	private Date replyUpdate;


	private Integer replyParent;
//	대댓글에 필요한 부분
	private int replyLikeCnt;
//좋아요수
	private int replyState;



    public Integer getReplyId() {
        return replyId;
    }

    public void setReplyId(Integer replyId) {
        this.replyId = replyId;
    }

    public Integer getBoardId() {
        return boardId;
    }

    public void setBoardId(Integer boardId) {
        this.boardId = boardId;
    }

    public String getReplyText() {
        return replyText;
    }

    public void setReplyText(String replyText) {
        this.replyText = replyText;
    }

    public String getReplyWriter() {
        return replyWriter;
    }

    public void setReplyWriter(String replyWriter) {
        this.replyWriter = replyWriter;
    }

    public String getReplyProfile() {
        return replyProfile;
    }

    public void setReplyProfile(String replyProfile) {
        this.replyProfile = replyProfile;
    }

    public Date getReplyRegdate() {
        return replyRegdate;
    }

    public void setReplyRegdate(Date replyRegdate) {
        this.replyRegdate = replyRegdate;
    }

    public Date getReplyUpdate() {
        return replyUpdate;
    }

    public void setReplyUpdate(Date replyUpdate) {
        this.replyUpdate = replyUpdate;
    }

    public Integer getReplyParent() {
        return replyParent;
    }

    public void setReplyParent(Integer replyParent) {
        this.replyParent = replyParent;
    }

    public int getReplyLikeCnt() {
        return replyLikeCnt;
    }

    public void setReplyLikeCnt(int replyLikeCnt) {
        this.replyLikeCnt = replyLikeCnt;
    }

    public int getReplyState() {
        return replyState;
    }

    public void setReplyState(int replyState) {
        this.replyState = replyState;
    }

    @Override
    public String toString() {
        return "ReplyVO{" +
                "replyId=" + replyId +
                ", boardId=" + boardId +
                ", replyText='" + replyText + '\'' +
                ", replyWriter='" + replyWriter + '\'' +
                ", replyProfile='" + replyProfile + '\'' +
                ", replyRegdate=" + replyRegdate +
                ", replyUpdate=" + replyUpdate +
                ", replyParent=" + replyParent +
                ", replyLikeCnt=" + replyLikeCnt +
                ", replyState=" + replyState +
                '}';
    }
}
