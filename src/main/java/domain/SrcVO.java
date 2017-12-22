package domain;

import java.util.Date;

public class SrcVO {
    private String srcId;
    private int srcWriter; //null일때 작성자 없는것 (익명)
    private String srcPath;
    private String srcComments;
    private Date srcRegdate;
    private Date srcUpdate;
    private String srcTitle;
    private int srcLikecnt;
    private int srcViewcnt;
    private int srcStatus;  //0, 1, 2로 구분 (private, public, delete)

    private String srcHtml;
    private String srcCss;
    private String srcJavaScript;

    public String getSrcHtml() {
        return srcHtml;
    }

    public void setSrcHtml(String srcHtml) {
        this.srcHtml = srcHtml;
    }

    public String getSrcCss() {
        return srcCss;
    }

    public void setSrcCss(String srcCss) {
        this.srcCss = srcCss;
    }

    public String getSrcJavaScript() {
        return srcJavaScript;
    }

    public void setSrcJavaScript(String srcJavaScript) {
        this.srcJavaScript = srcJavaScript;
    }

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

    public int getSrcLikecnt() {
        return srcLikecnt;
    }

    public void setSrcLikecnt(int srcLikecnt) {
        this.srcLikecnt = srcLikecnt;
    }

    public int getSrcViewcnt() {
        return srcViewcnt;
    }

    public void setSrcViewcnt(int srcViewcnt) {
        this.srcViewcnt = srcViewcnt;
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
                ", srcLikecnt=" + srcLikecnt +
                ", srcViewcnt=" + srcViewcnt +
                ", srcStatus=" + srcStatus +
                ", srcHtml='" + srcHtml + '\'' +
                ", srcCss='" + srcCss + '\'' +
                ", srcJavaScript='" + srcJavaScript + '\'' +
                '}';
    }
}
