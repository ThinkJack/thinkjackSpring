package service;

import domain.Criteria;
import domain.SrcLikeVO;
import domain.SrcVO;
import domain.UserVO;
import org.springframework.stereotype.Service;
import persistence.SrcDAO;
import persistence.UserDAO;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SrcServiceImpl implements SrcService {

    @Inject
    private SrcDAO srcdao;

    @Inject
    private UserDAO userdao;

    @Override
    public Map readSrc(HttpServletRequest request) throws Exception {

        Map map = new HashMap();
        HttpSession session = request.getSession();
        String uri = request.getRequestURI();
        SrcVO vo = new SrcVO();

        SrcLikeVO srcLikeVo = new SrcLikeVO();
        int like = 0;

        String srcId = uri.replace("/edit/editPage", "");
        srcId = srcId.replace("/", "");


        try {
            vo = srcdao.selectSrcOne(srcId);
            srcLikeVo.setSrcId(vo.getSrcId());

            if (session.getAttribute("login") instanceof UserVO) {
                int chk = vo.getSrcWriter();

                UserVO userVo = (UserVO) session.getAttribute("login");
                srcLikeVo.setUserId(userVo.getUserId());
                like = srcdao.readLike(srcLikeVo);

                if (chk == 0) {
                    srcdao.updateSrcWriter(userVo.getUserId(), srcId);
                } else if (chk != userVo.getUserId()) {
                    //view cnt관련 코드
                    srcdao.updateSrcViewCnt(srcId);
                }
                vo = srcdao.selectSrcOne(srcId);
            }

            if (vo.getSrcWriter() != 0) {

                UserVO imsiUserVo = new UserVO();
                imsiUserVo.setUserId(vo.getSrcWriter());
                vo.setSrcWriterName(userdao.read(imsiUserVo).getUserName());

            }
//            System.out.println(vo.getSrcPath() + "/html.txt");
            vo.setSrcHtml(readCodeSet(vo.getSrcPath() + "/html.txt"));
            vo.setSrcCss(readCodeSet(vo.getSrcPath() + "/css.txt"));
            vo.setSrcJavaScript(readCodeSet(vo.getSrcPath() + "/js.txt"));


        } catch (Exception e) {
            e.printStackTrace();
        }

        map.put("vo", vo);
        map.put("like", like);

        return map;
    }

    @Override
    public String saveSrc(HttpServletRequest request, HttpServletResponse response, SrcVO vo) throws Exception {
        String srcId = vo.getSrcId();   //램덤하게 생성되는 id값
        boolean srcEmpty = false;
        String filePath;

        HttpSession session = request.getSession();
        Object userVo = session.getAttribute("login");

        if (vo.getSrcWriter() == 0) {
            if (userVo != null) {
                if (userVo instanceof UserVO) {
                    vo.setSrcWriter(((UserVO) userVo).getUserId());
                }
            }
        }

        if (srcId == "") {
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
            if (srcEmpty) {
                vo.setSrcId(srcId);
                srcdao.insertSrc(vo);
            } else {
                srcdao.updateSrc(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return srcId;
    }

    @Override
    public Map srcLike(HttpServletRequest request, SrcLikeVO srcLikeVO) {
        int result;
        SrcVO srcVo = new SrcVO();
        Map map = new HashMap<>();
        HttpSession session = request.getSession();
        if (session.getAttribute("login") instanceof UserVO) {
            srcLikeVO.setUserId(((UserVO) session.getAttribute("login")).getUserId());
        }

        result = srcdao.readLike(srcLikeVO);
        if (result == 0) {
            srcdao.insertSrcLike(srcLikeVO);
        } else {
            srcdao.deleteSrcLike(srcLikeVO);
        }

        srcVo.setSrcId(srcLikeVO.getSrcId());
        srcVo.setSrcLikecnt(srcdao.selectSrcLikeCnt(srcLikeVO.getSrcId()));
        srcdao.updateSrcLikeCnt(srcVo);

        map.put("result", result);
        map.put("srcLikeCnt", srcdao.selectSrcOne(srcVo.getSrcId()).getSrcLikecnt());
        return map;
    }

    @Override
    public List srcList(Criteria cri) throws Exception {
        List list = srcdao.selectSrcList(cri);

        for(int i=0; i<list.size(); i++){
            SrcVO vo = (SrcVO)list.get(i);
            vo.setSrcHtml(readCodeSet(vo.getSrcPath() + "/html.txt"));
            vo.setSrcCss(readCodeSet(vo.getSrcPath() + "/css.txt"));
            vo.setSrcJavaScript(readCodeSet(vo.getSrcPath() + "/js.txt"));
            list.set(i, vo);
        }

        return list;
    }


    @Override
    public int listCountCriteria(Criteria cri) throws Exception {
        return srcdao.countPaging(cri);
    }

    ///////////////////////////////////////////////////////////////////////////////
    //codeFile 읽어오는 작업
    public String readCodeSet(String filePath) throws IOException {
        String str = "";
        int i;

        File file = new File(filePath);
        FileReader fr = new FileReader(file);
        while ((i = fr.read()) != -1) {
            if (i == 10) {
                str += "\\n";
            } else {
                str += (char) i;
            }

        }
        fr.close();
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
        if (!file.exists()) {
            file.createNewFile();
        } else {
            file.delete();
            file.createNewFile();
        }
        FileWriter fw = new FileWriter(file, true);
        fw.write(src);
        fw.flush();
        // 객체 닫기
        fw.close();
    }


}
