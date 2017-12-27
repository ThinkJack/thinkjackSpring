package service;

import domain.SrcVO;
import domain.UserVO;
import org.springframework.stereotype.Service;
import persistence.SrcDAO;
import persistence.UserDAO;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

@Service
public class SrcServiceImpl implements SrcService {

    @Inject
    private SrcDAO srcdao;

    @Inject
    private UserDAO userdao;

    @Override
    public SrcVO readSrc(HttpServletRequest request, SrcVO vo) throws Exception {

        UserVO userVo = new UserVO();
        String uri = request.getRequestURI();
        String srcId = uri.replace("/edit/editPage", "");
        srcId = srcId.replace("/", "");

        try {
            vo = srcdao.selectSrcOne(srcId);
            userVo.setUserId(vo.getSrcWriter());
            if(userVo.getUserId() != 0){
                vo.setSrcWriterName(userdao.read(userVo).getUserName());
            }
//            System.out.println(vo.getSrcPath() + "/html.txt");
            vo.setSrcHtml(readCodeSet(vo.getSrcPath() + "/html.txt"));
            vo.setSrcCss(readCodeSet(vo.getSrcPath() + "/css.txt"));
            vo.setSrcJavaScript(readCodeSet(vo.getSrcPath() + "/js.txt"));
        } catch (Exception e) {
            e.printStackTrace();
        }

        return vo;
    }

    @Override
    public String saveSrc(HttpServletRequest request, SrcVO vo)throws Exception{
        String srcId = vo.getSrcId();   //램덤하게 생성되는 id값
        boolean srcEmpty = false;
        String filePath;

        if(srcId == "") {
            //srcID값 작업
            srcEmpty = true;
            do {
                srcId = randomSrcId();
            } while (srcdao.selectSrcOne(srcId) != null);
        }
        //SrcFile 생성
        filePath = "./srcCodeDir/" + srcId;
        File fileDir = new File(filePath);
        try {
            // 파일 경로 dir 생성
            if (!fileDir.exists()) {
                fileDir.mkdirs();
                System.out.println("파일 디렉토리 생성");
            }
            // true 지정시 파일의 기존 내용에 이어서 작성
            fileWriter(filePath + "/html.txt", vo.getSrcHtml());
            fileWriter(filePath + "/css.txt", vo.getSrcCss());
            fileWriter(filePath + "/js.txt", vo.getSrcJavaScript());
            // 파일안에 문자열 쓰기
            vo.setSrcPath(filePath);
            if(srcEmpty) {
                vo.setSrcId(srcId);
                srcdao.insertSrc(vo);
            }else{
                srcdao.updateSrc(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return srcId;
    }

    @Override
    public void updateSrcStatus(String srcId) throws Exception {
        srcdao.updateSrcStatus(srcId);
    }

    ///////////////////////////////////////////////////////////////////////////////
    //codeFile 읽어오는 작업
    public String readCodeSet(String filePath) throws IOException {
        String str = "";
        int i;

        File file = new File(filePath);
        FileReader fr = new FileReader(file);
        while ((i = fr.read()) != -1) {
            if(i == 10){
                str += "\\n";
            }else{
                str += (char) i;
            }

        }
        fr.close();
        return str;
    }
    //srcID값 작업
    public String randomSrcId(){

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
    public void fileWriter(String filePath, String src)throws Exception{
        File file = new File(filePath);
        if(!file.exists()){
            file.createNewFile();
        }else{
            file.delete();
            file.createNewFile();
        }
        FileWriter fw = new FileWriter(file, true) ;
        fw.write(src);
        fw.flush();
        // 객체 닫기
        fw.close();
    }
}
