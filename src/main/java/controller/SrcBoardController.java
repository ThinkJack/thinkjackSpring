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
            cri.setPerPageNum(6);
        }

        List<SrcVO> list = srcProfileSet(request, service.srcList(cri));
        model.addAttribute("list", list);
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(service.srcListSearchCount(cri));
        model.addAttribute("pageMaker", pageMaker);
    }

    //공통작업 메서드
    public List<SrcVO> srcProfileSet (HttpServletRequest request, List<SrcVO> list) throws Exception{
        for (int i = 0; i < list.size(); i++) {
            SrcVO imsi = list.get(i);
            SrcLikeVO likeVO = new SrcLikeVO();
            likeVO.setSrcId(imsi.getSrcId());

            imsi.setSrclikeCli(service.selectSrcLike(request, likeVO));
            list.set(i, imsi);
        }
        return list;
    }
}
