package domain;

import java.util.Date;

public class ReplyVO {

	private Integer replyId;
//	댓글 번호
	private Integer boardId;
//글 번호
	private String replyText;
//	댓글 내용
	private String replyWirter;
//	유저 ID

	//	날짜부분
	private Date replyRegdate;
	private Date replyUpdate;


	private Integer replyParent;
//	대댓글에 필요한 부분
	private int replyLikeCnt;
//좋아요수
	private int replyState;
	//삭제부분 0,1


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

	public String getReplyWirter() {
		return replyWirter;
	}

	public void setReplyWirter(String replyWirter) {
		this.replyWirter = replyWirter;
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

	public void setReplyParent(int replyParent) {
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
				", replyWirter='" + replyWirter + '\'' +
				", replyRegdate=" + replyRegdate +
				", replyUpdate=" + replyUpdate +
				", replyParent=" + replyParent +
				", replyLikeCnt=" + replyLikeCnt +
				", replyState=" + replyState +
				'}';
	}
}
