package domain;

public class ReplyVO {
	//	댓글 번호
	private Integer replyId;
	//글 번호
	private Integer boardId;
	//	댓글 내용
	private String replyText;
	//	유저 ID
	private String replyWirter;
	//	대댓글에 필요한 부분
	private Integer replyParent;
	//좋아요수
	private Integer replyLikeCnt;
	//삭제부분 0,1
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

	public Integer getReplyLikeCnt() {
		return replyLikeCnt;
	}

	public void setReplyLikeCnt(Integer replyLikeCnt) {
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
				", replyParent=" + replyParent +
				", replyLikeCnt=" + replyLikeCnt +
				", replyState=" + replyState +
				'}';
	}
}
