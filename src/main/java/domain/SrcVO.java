package domain;

import java.util.Date;

public class SrcVO {
    private String srcId;
    private int srcWriter;
    private String srcPath;
    private String srcComments;
    private Date srcRegdate;
    private Date srcUpdate;
    private String srcTitle;
    private int srcLikeCnt;
    private int srcViewCnt;
    private int srcStatus;  //0 하고 1로 구분 (삭제에서 사용)

    public String getSrcId() {
        return srcId;
    }

    public void setSrcId(String srcId) {
        this.srcId = srcId;
    }

    public int getSrcWriter() {
        return srcWriter;
    }

    public void setSrcWriter(int srcWriter) {
        this.srcWriter = srcWriter;
    }

    public String getSrcPath() {
        return srcPath;
    }

    public void setSrcPath(String srcPath) {
        this.srcPath = srcPath;
    }

    public String getSrcComments() {
        return srcComments;
    }

    public void setSrcComments(String srcComments) {
        this.srcComments = srcComments;
    }

    public Date getSrcRegdate() {
        return srcRegdate;
    }

    public void setSrcRegdate(Date srcRegdate) {
        this.srcRegdate = srcRegdate;
    }

    public Date getSrcUpdate() {
        return srcUpdate;
    }

    public void setSrcUpdate(Date srcUpdate) {
        this.srcUpdate = srcUpdate;
    }

    public String getSrcTitle() {
        return srcTitle;
    }

    public void setSrcTitle(String srcTitle) {
        this.srcTitle = srcTitle;
    }

    public int getSrcLikeCnt() {
        return srcLikeCnt;
    }

    public void setSrcLikeCnt(int srcLikeCnt) {
        this.srcLikeCnt = srcLikeCnt;
    }

    public int getSrcViewCnt() {
        return srcViewCnt;
    }

    public void setSrcViewCnt(int srcViewCnt) {
        this.srcViewCnt = srcViewCnt;
    }

    public int getSrcStatus() {
        return srcStatus;
    }

    public void setSrcStatus(int srcStatus) {
        this.srcStatus = srcStatus;
    }

    @Override
    public String toString() {
        return "SrcVO{" +
                "srcId='" + srcId + '\'' +
                ", srcWriter=" + srcWriter +
                ", srcPath='" + srcPath + '\'' +
                ", srcComments='" + srcComments + '\'' +
                ", srcRegdate=" + srcRegdate +
                ", srcUpdate=" + srcUpdate +
                ", srcTitle='" + srcTitle + '\'' +
                ", srcLikeCnt=" + srcLikeCnt +
                ", srcViewCnt=" + srcViewCnt +
                ", srcStatus=" + srcStatus +
                '}';
    }
}
