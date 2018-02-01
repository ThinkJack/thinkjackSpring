package common;

import domain.SrcVO;
import org.apache.commons.io.FileUtils;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;

import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class SrcFileSet{

    S3Util s3 = new S3Util(); //s3 객체

    public List setList(List<SrcVO> list)throws Exception{

        //리스트 돌며 해당 파일들 각각 리스트에 다시 세팅
        for (int i = 0; i < list.size(); i++) {
            SrcVO vo = list.get(i); //리스트 안에 있는 SrcVO 객체 임시 vo에 담기
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
            list.set(i, vo); //vo에 파일이 다시 세팅되면 해당 배열방에 vo 넣기
        }

        return list;
    }


    public String readCodeSet(String filePath) throws IOException {

        //s3에서 파일 스트림 객체로 받아 BufferedReader로 객체 생성
        BufferedReader reader = new BufferedReader(new InputStreamReader(s3.getSrcFile("thinkjackbucket", filePath)));
        String str = "";// string 임시값
        while (true) {
            String line = reader.readLine(); //reader에서 한줄 읽기
            if(line == null) { //읽어올 줄이 없으면 while문 나가기
                break;
            }
            str += line + "\\n"; //str에 줄 넣고 줄바꿈
        }
        return str; //setting된 str 리턴해줌
    }

    //srcID값 생성하기
    public String randomSrcId() {

        int charType;   //0-소문자, 1-대문자
        int charValue = 0;  //문자 1개의 아스키값
        String srcId = "";

        for (int j = 0; j < 6; j++) {//6번 for문 돌려 6글자 만들기
            charType = (int) (Math.random() * 2); //대소문자 랜덤으로 결정
            for (int i = 0; i < 3; i++) { //3번 돌려  25개 안의 랜덤값 만들기 a~z까지의 개수 25개
                if (i != 2) {
                    charValue += (int) (Math.random() * 10); //2번은 0~9까지
                } else {
                    charValue += (int) (Math.random() * 8) + 65; // 3번째는 0~7까지 기본값은 대문자
                    if (charType == 1) { //타입에 따라 소문자일 경우 32를 더해줌  A = 65, a = 97
                        charValue += 32;
                    }
                }
            }
            srcId = srcId + (char) charValue; //세팅된 문자1개을 srcId에 추가
            charValue = 0; // 문자값 초기화
        }
        return srcId; //만들어진 srcId 리턴
    }

    //실제 코드 파일 생성
    public void fileWriter(String filePath, String src) throws Exception {
//        final DefaultResourceLoader defaultResourceLoader = new DefaultResourceLoader();
//        Resource resource = defaultResourceLoader.getResource("classpath:resource/imsi/imsi.txt");
//        System.out.println(getClass().getResource("/imsi/imsi.txt").toURI());
        File file = new File(getClass().getResource("/imsi/imsi.txt").toURI()); //리소스에 저장되어 있는 임시 txt파일을 불러옴
//        File file = new File(filePath);
        FileWriter fw = new FileWriter(file); //파일에 src문자열을 덮어쓸 준비
        fw.write(src); //덮어쓰기
        fw.flush(); //buffer 비우기
        fw.close(); //FileWriter 닫기

//        CharSequence cs = new StringBuffer(src);
//        FileUtils.write(file, cs);
        byte[] filedata = FileUtils.readFileToByteArray(file); //읽어드린 파일을 바이트 배열로 변환
        UploadFileUtils.srcUploadFile(filePath, filedata); //S3에 파일 업로드 하기
    }

    //cdn setting
    public String cdnSet(List<String> list){
        String str = "";

        for(int i=0; i<list.size(); i++){
            str += list.get(i) + ","; //리스트로 받아온 cdn문자열들을 ',' 구분자로 문자열에 세팅
        }
        return str;
    }
}
