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
//	private Timestamp replyRegdate;
////Timestamp를 써야하는지 date를 써야하는지 모르겠음
//	private Timestamp replyUpdate;
	private Integer replyParent;
//	대댓글에 필요한 부분
	private Integer replyLikecnt;
//좋아요수
	

	
	
}
