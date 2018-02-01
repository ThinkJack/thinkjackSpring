package service;

import common.SrcFileSet;
import domain.*;
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
import java.util.*;

@Service
public class SrcServiceImpl implements SrcService {

    @Inject
    private SrcDAO srcdao;

    @Inject
    private UserDAO userdao;

    SrcFileSet sfs = new SrcFileSet();

    @Override
    public Map readSrc(HttpServletRequest request) throws Exception { // 소스파일 읽어오기

        Map map = new HashMap();
        HttpSession session = request.getSession();
        String uri = request.getRequestURI();
        SrcVO vo = new SrcVO();

        SrcLikeVO srcLikeVo = new SrcLikeVO();
        int like = 0;

        String srcId = uri.replace("/edit/editPage", "");   //uri에서 문자열 자르기
        srcId = srcId.replace("/", ""); // 남은 '/' 문자열 자르기

        if(!(srcId.equals(""))){ //srcId가 있을 경우
            //view cnt관련 코드
            srcdao.updateSrcViewCnt(srcId); //해당 ID 뷰 카운트 증가
        }

        try {
            vo = srcdao.selectSrcOne(srcId); //srcId에 해당한 src_tbl 데이터 받아오기
            srcLikeVo.setSrcId(vo.getSrcId()); //받아온 vo에서 likeVO 객체에 srcId 넎기

            if (session.getAttribute("login") instanceof UserVO) { //로그인 되어있는지 확인
                int srcWriter = vo.getSrcWriter(); //vo에서 작성자 가져오기

                UserVO userVo = (UserVO) session.getAttribute("login"); //로그인 한 유저 세션값 가져오기
                srcLikeVo.setUserId(userVo.getUserId()); //srcLikeVO에 로그인 유저 id 값 넣기
                like = srcdao.readLike(srcLikeVo); //srcLikeVo를 가지고 좋아요 여부 가져오기

                Map mapimsi = new HashMap();  //임시 map 객체 생성
                //작성자와 srcId 값 집어넣기
                mapimsi.put("srcWriter", userVo.getUserId());
                mapimsi.put("srcId", srcId);

                if (srcWriter == 0) { //작성자가 없을때
                    srcdao.updateSrcWriter(mapimsi); //로그인 한 user로 작성자 업데이트 해줌
                }

                vo = srcdao.selectSrcOne(srcId); // 업데이트 한 데이터 다시 가져오기
            }

            if (vo.getSrcWriter() != 0) { // 작성자가 있을 때
                UserVO imsiUserVo = new UserVO(vo.getSrcWriter()); //작성자 ID 를 imsiUserVO에 넣기
                vo.setSrcWriterName(userdao.read(imsiUserVo).getUserName()); //작성자 Name을 가져오기
            }
//            System.out.println(vo.getSrcPath() + "/html.txt");
            // 각각 소스 데이터 가져오기
            vo.setSrcHtml(sfs.readCodeSet(vo.getSrcPath() + "/html.txt"));
            vo.setSrcCss(sfs.readCodeSet(vo.getSrcPath() + "/css.txt"));
            vo.setSrcJavaScript(sfs.readCodeSet(vo.getSrcPath() + "/js.txt"));
            //cdn setting
            vo.setCdnCss(new ArrayList<String>
                    (Arrays.asList(sfs.readCodeSet(vo.getSrcPath() + "/cdnCss.txt")
                            .split(","))));
            vo.setCdnJs(new ArrayList<String>
                    (Arrays.asList(sfs.readCodeSet(vo.getSrcPath() + "/cdnJs.txt")
                            .split(","))));

            //사진경로 가져오기
            if (vo.getSrcWriter() != 0) {
                vo.setSrcWriterImgPath(userdao.getUserProfile(vo.getSrcWriter()));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        //가져온 vo와 like map객체에 넣어 리턴
        map.put("vo", vo);
        map.put("like", like);

        return map;
    }

    @Override
    public String saveSrc(HttpServletRequest request, SrcVO vo) throws Exception {

        String srcId = vo.getSrcId();   //램덤하게 생성되는 id값
        boolean srcIdEmpty = false; //srcId 비어있는지 여부
        String filePath;
        String cdn;

        HttpSession session = request.getSession();

        if (vo.getSrcWriter() == 0) { //작성자 없을 경우
            if (session.getAttribute("login") instanceof UserVO) { //형변환 가능한지 여부 확인
                vo.setSrcWriter(((UserVO) session.getAttribute("login")).getUserId()); // 로그인 계정 작성자로 세팅
            }
        }

        if (srcId.equals("")) { //srcId가 없을 경우
            //srcID값 작업
            srcIdEmpty = true; //srcId  비어있음

            do {
                srcId = sfs.randomSrcId(); //랜덤으로 SrcId 생성
            } while (srcdao.selectSrcOne(srcId) != null); //db에 해당 아이디 있는지 비교 후 없으면 while 나가기
        }
//        System.out.println(srcId);

        filePath = "thinkjack/srcCodeDir/" + srcId;   //SrcFile 저장 경로

        try {

            //각각 파일들 s3에 저장
            sfs.fileWriter(filePath + "/html.txt", vo.getSrcHtml());
            sfs.fileWriter(filePath + "/css.txt", vo.getSrcCss());
            sfs.fileWriter(filePath + "/js.txt", vo.getSrcJavaScript());
            cdn = sfs.cdnSet(vo.getCdnCss());//리스트로 불러온 cdn 값 구분자로 문자열 작업
            sfs.fileWriter(filePath + "/cdnCss.txt",cdn);
            cdn = sfs.cdnSet(vo.getCdnJs());//리스트로 불러온 cdn 값 구분자로 문자열 작업
            sfs.fileWriter(filePath + "/cdnJs.txt",cdn);

            vo.setSrcPath(filePath); //파일 저장경로 vo에 넣기

            if (srcIdEmpty) { //srcId가 비어있을때 insert
                vo.setSrcId(srcId);
                srcdao.insertSrc(vo);
            } else { //srcId가 존재할때 update
                srcdao.updateSrc(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
//        srcId 반환
        return srcId;
    }

    @Override
    public void srcDelete(SrcVO vo) throws Exception {
        srcdao.updateSrcDelete(vo); //삭제시 상태변경
    }

    @Override
    public Map srcLike(HttpServletRequest request, SrcLikeVO srcLikeVO) {

        int result;
        SrcVO srcVo = new SrcVO();
        Map map = new HashMap<>();
        HttpSession session = request.getSession();
        if (session.getAttribute("login") instanceof UserVO) { //로그인 여부 확인
            srcLikeVO.setUserId(((UserVO) session.getAttribute("login")).getUserId()); //로그인시 srcLikeVO에 userId 넣기
        }

        result = srcdao.readLike(srcLikeVO); //like 데이터 가져오기

        if (result == 0) {//좋아요가 없을 경우
            srcdao.insertSrcLike(srcLikeVO); //insert
        } else { //좋아요기 있을 경우
            srcdao.deleteSrcLike(srcLikeVO); //delete
        }

        srcVo.setSrcId(srcLikeVO.getSrcId());
        srcVo.setSrcLikecnt(srcdao.selectSrcLikeCnt(srcLikeVO.getSrcId()));
        srcdao.updateSrcLikeCnt(srcVo); //src 좋아요 카운트 값 변경

        map.put("result", result); //좋아요 결과여부 값
        map.put("srcLikeCnt", srcdao.selectSrcOne(srcVo.getSrcId()).getSrcLikecnt()); //좋아요 카운트

        return map;
    }

    @Override
    public int selectSrcLike(HttpServletRequest request, SrcLikeVO vo) {
        HttpSession session = request.getSession();
        if (session.getAttribute("login") instanceof UserVO) {
            vo.setUserId(((UserVO) session.getAttribute("login")).getUserId()); //로그인시
        }
        return srcdao.readLike(vo); //좋아요 했는지 여부 가져오기
    }

    @Override
    public List<SrcVO> srcList(SearchCriteria cri) throws Exception {


        List list = srcdao.selectSrcList(cri); //srcVo 리스트로 가져오기

        for (int i = 0; i < list.size(); i++) { //리스트 돌며 해당 파일 가져오기
            SrcVO vo = (SrcVO) list.get(i);
            vo.setSrcHtml(sfs.readCodeSet(vo.getSrcPath() + "/html.txt"));
            vo.setSrcCss(sfs.readCodeSet(vo.getSrcPath() + "/css.txt"));
            vo.setSrcJavaScript(sfs.readCodeSet(vo.getSrcPath() + "/js.txt"));
            //cdn setting
            vo.setCdnCss(new ArrayList<String>
                    (Arrays.asList(sfs.readCodeSet(vo.getSrcPath() + "/cdnCss.txt")
                            .split(","))));
            vo.setCdnJs(new ArrayList<String>
                    (Arrays.asList(sfs.readCodeSet(vo.getSrcPath() + "/cdnJs.txt")
                            .split(","))));
            list.set(i, vo);
        }

        return list;
    }

    @Override
    public int srcListSearchCount(SearchCriteria cri) throws Exception {
        return srcdao.srcListSearchCount(cri); //검색한 소스 데이터 전체 갯수
    }

}
