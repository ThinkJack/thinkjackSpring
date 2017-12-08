package domain;

import java.security.Timestamp;

public class ReplyVO {

	private Integer replyId;
//	댓글 번호
	private Integer boardId;
//글 번호
	private String replyText;
//	댓글 내용
	private String replyWirter;
//	유저 ID
	private Integer replyParent;
//	대댓글에 필요한 부분
	private Integer replyLikecnt;
//좋아요수


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

	public Integer getReplyParent() {
		return replyParent;
	}

	public void setReplyParent(Integer replyParent) {
		this.replyParent = replyParent;
	}

	public Integer getReplyLikecnt() {
		return replyLikecnt;
	}

	public void setReplyLikecnt(Integer replyLikecnt) {
		this.replyLikecnt = replyLikecnt;
	}

	@Override
	public String toString() {
		return "ReplyVO{" +
				"replyId=" + replyId +
				", boardId=" + boardId +
				", replyText='" + replyText + '\'' +
				", replyWirter='" + replyWirter + '\'' +
				", replyParent=" + replyParent +
				", replyLikecnt=" + replyLikecnt +
				'}';
	}
}
