package controller;

import domain.*;
import org.jsfr.json.compiler.JsonPathParser;
import org.springframework.social.facebook.api.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.SrcService;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/srcBoard/*")
public class SrcBoardController {

    @Inject
    private SrcService service;

    //--------------------------------------------------------------------------------------------------src게시판 관련 코드들
    @RequestMapping(value = "/srcList", method = RequestMethod.GET)
    public void srcList(@ModelAttribute("cri") SearchCriteria cri, HttpServletRequest request, Model model) throws Exception {

        if (cri.getPerPageNum() == 10) {
            cri.setPerPageNum(6);//소스 파일 6개씩 나오도록 페이지 세팅
        }

        List<SrcVO> list = service.srcList(cri); //소스파일 리스트로 가져오기
        for (int i = 0; i < list.size(); i++) {
            SrcVO imsi = list.get(i);
            SrcLikeVO likeVO = new SrcLikeVO(imsi.getSrcId());

            imsi.setSrclikeCli(service.selectSrcLike(request, likeVO)); //좋아요 클릭 여부 가져오기
            list.set(i, imsi);
        }
        model.addAttribute("list", list);

        //페이지 세팅
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(service.srcListSearchCount(cri)); //검색한 데이터 카운트 전체 갯수
//        System.out.println(pageMaker);
        model.addAttribute("pageMaker", pageMaker);
    }
}
