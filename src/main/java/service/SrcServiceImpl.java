package service;

import common.SrcFileSet;
import domain.*;
import org.springframework.stereotype.Service;
import persistence.SrcDAO;
import persistence.UserDAO;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.*;

@Service
public class SrcServiceImpl implements SrcService {

    @Inject
    private SrcDAO srcdao;

    @Inject
    private UserDAO userdao;

    @Override
    public Map readSrc(HttpServletRequest request) throws Exception {

        SrcFileSet srcFileSet = new SrcFileSet();
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
            vo.setSrcHtml(srcFileSet.readCodeSet(vo.getSrcPath() + "/html.txt"));
            vo.setSrcCss(srcFileSet.readCodeSet(vo.getSrcPath() + "/css.txt"));
            vo.setSrcJavaScript(srcFileSet.readCodeSet(vo.getSrcPath() + "/js.txt"));

            //cdn setting
            vo.setCdnCss(new ArrayList<String>
                    (Arrays.asList(srcFileSet.readCodeSet(vo.getSrcPath() + "/cdnCss.txt")
                            .split(","))));
            vo.setCdnJs(new ArrayList<String>
                    (Arrays.asList(srcFileSet.readCodeSet(vo.getSrcPath() + "/cdnJs.txt")
                            .split(","))));

            //사진경로 가져오기
            if (vo.getSrcWriter() != 0) {
                vo.setSrcWriterImgPath(userdao.getUserProfile(vo.getSrcWriter()));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        map.put("vo", vo);
        map.put("like", like);

        return map;
    }

    @Override
    public String saveSrc(HttpServletRequest request, SrcVO vo) throws Exception {

        SrcFileSet srcFileSet = new SrcFileSet();
        String srcId = vo.getSrcId();   //램덤하게 생성되는 id값
        boolean srcEmpty = false;
        String filePath;
        String cdn;

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
                srcId = srcFileSet.randomSrcId();
            } while (srcdao.selectSrcOne(srcId) != null);
        }
        System.out.println(srcId);
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
            srcFileSet.fileWriter(filePath + "/html.txt", vo.getSrcHtml());
            srcFileSet.fileWriter(filePath + "/css.txt", vo.getSrcCss());
            srcFileSet.fileWriter(filePath + "/js.txt", vo.getSrcJavaScript());

            List cdnCssList = vo.getCdnCss();
            List cdnJsList = vo.getCdnJs();
            cdn = srcFileSet.cdnSet(cdnCssList);
            srcFileSet.fileWriter(filePath + "/cdnCss.txt",cdn);
            cdn = srcFileSet.cdnSet(cdnJsList);
            srcFileSet.fileWriter(filePath + "/cdnJS.txt",cdn);

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
    public void srcDelete(SrcVO vo) throws Exception {
        srcdao.updateSrcDelete(vo);
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
    public int selectSrcLike(HttpServletRequest request, SrcLikeVO vo) {
        HttpSession session = request.getSession();
        if (session.getAttribute("login") instanceof UserVO) {
            vo.setUserId(((UserVO) session.getAttribute("login")).getUserId());
        }
        return srcdao.readLike(vo);
    }

    @Override
    public List<SrcVO> srcList(SearchCriteria cri) throws Exception {

//        if(cri.getSearchType().equals("w") || cri.getSearchType().equals("tw")){
//            //키워드에서 user검색시 name값 처리해서 id 가져오는 로직 추가필요
//
//        }
        SrcFileSet srcFileSet = new SrcFileSet();
        List list = srcdao.selectSrcList(cri);

        for (int i = 0; i < list.size(); i++) {
            SrcVO vo = (SrcVO) list.get(i);

            vo.setSrcHtml(srcFileSet.readCodeSet(vo.getSrcPath() + "/html.txt"));
            vo.setSrcCss(srcFileSet.readCodeSet(vo.getSrcPath() + "/css.txt"));
            vo.setSrcJavaScript(srcFileSet.readCodeSet(vo.getSrcPath() + "/js.txt"));
            //cdn setting
            vo.setCdnCss(new ArrayList<String>
                    (Arrays.asList(srcFileSet.readCodeSet(vo.getSrcPath() + "/cdnCss.txt")
                            .split(","))));
            vo.setCdnJs(new ArrayList<String>
                    (Arrays.asList(srcFileSet.readCodeSet(vo.getSrcPath() + "/cdnJs.txt")
                            .split(","))));
            list.set(i, vo);
        }

        return list;
    }

    @Override
    public int srcListSearchCount(SearchCriteria cri) throws Exception {
        return srcdao.srcListSearchCount(cri);
    }


    ///////////////////////////////////////////////////////////////////////////////
    //codeFile 읽어오는 작업

}
