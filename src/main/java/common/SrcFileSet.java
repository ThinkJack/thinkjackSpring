package common;

import domain.SrcVO;
import org.apache.commons.io.FileUtils;

import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class SrcFileSet{

    S3Util s3 = new S3Util();
    public List setList(List<SrcVO> list)throws Exception{
        for (int i = 0; i < list.size(); i++) {
            SrcVO vo = list.get(i);
            vo.setSrcHtml(readCodeSet(vo.getSrcPath() + "/html.txt"));
            vo.setSrcCss(readCodeSet(vo.getSrcPath() + "/css.txt"));
            vo.setSrcJavaScript(readCodeSet(vo.getSrcPath() + "/js.txt"));
            //cdn setting
            vo.setCdnCss(new ArrayList<String>
                    (Arrays.asList(readCodeSet(vo.getSrcPath() + "/cdnCss.txt")
                            .split(","))));
            vo.setCdnJs(new ArrayList<String>
                    (Arrays.asList(readCodeSet(vo.getSrcPath() + "/cdnJs.txt")
                            .split(","))));
            list.set(i, vo);
        }

        return list;
    }


    public String readCodeSet(String filePath) throws IOException {

        BufferedReader reader = new BufferedReader(new InputStreamReader(s3.getSrcFile("thinkjackbucket", filePath)));
        String str = "";
        while (true) {
            String line = reader.readLine();
            if(line == null) {
                str += "\\n";
                break;
            }
            str += line;
        }
        return str;
    }

    //srcID값 작업
    public String randomSrcId() {

        int charType;   //0-소문자, 1-대문자
        int charValue = 0;  //문자 1개의 아스키값
        String srcId = "";
        for (int j = 0; j < 6; j++) {
            charType = (int) (Math.random() * 2);
            for (int i = 0; i < 3; i++) {
                if (i != 2) {
                    charValue += (int) (Math.random() * 10);
                } else {
                    charValue += (int) (Math.random() * 8) + 65;
                    if (charType == 1) {
                        charValue += 32;
                    }
                }
            }
            srcId = srcId + (char) charValue;
            charValue = 0;
        }
        return srcId;
    }

    //실제 코드 파일 생성
    public void fileWriter(String filePath, String src) throws Exception {
        File file = new File(filePath);
        CharSequence cs = new StringBuffer(src);
        FileUtils.write(file, cs);
        byte[] filedata = FileUtils.readFileToByteArray(file);
        UploadFileUtils.srcUploadFile(filePath, filedata);
    }

    //cdn setting
    public String cdnSet(List<String> list){
        String tenp = "";

        for(int i=0; i<list.size(); i++){
            tenp += list.get(i) + ",";
        }
        return tenp;
    }
}
