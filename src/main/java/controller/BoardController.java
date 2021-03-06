package controller;


import domain.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import service.BoardService;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/board/*")

public class BoardController {

    private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

    @Inject
    private BoardService service;


    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public void registerGET(BoardVO board, Model model,
                            @ModelAttribute("category") String category) throws Exception {

    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerPOST(BoardVO board, RedirectAttributes rttr,
                               @ModelAttribute("category") String category,
                               HttpServletRequest httpRequest) throws Exception {

        String userName = ((UserVO) httpRequest.getSession().getAttribute("login")).getUserName();
        board.setBoardWriter(userName);

        service.insertBoard(board, category);

        rttr.addFlashAttribute("msg", "success");
        return "redirect:/board/list?category=" + category;
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public void listAll(@ModelAttribute("cri") SearchCriteria cri,
                        @ModelAttribute("category") String category,
                        Model model) throws Exception {

        model.addAttribute("list", service.searchCriteria(cri, category));

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);

        pageMaker.setTotalCount(service.searchCount(cri, category));

        model.addAttribute("pageMaker", pageMaker);

        model.addAttribute("category", category);
    }

    @RequestMapping(value = "/read", method = RequestMethod.GET)
    public void read(@RequestParam("boardId") int boardId, Model model,
                     @ModelAttribute("cri") SearchCriteria cri,
                     @ModelAttribute("category") String category,
                     HttpServletRequest httpRequest) throws Exception {

        service.increaseViewcnt(boardId, category);

        model.addAttribute(service.readBoard(boardId, category));

        if(null == httpRequest.getSession().getAttribute("login") ) {
            BoardLikeVO vo = new BoardLikeVO();
            vo.setBoardId(boardId);
            vo.getUserId();
            int boardlike = service.getBoardLike(vo);

            model.addAttribute("heart", boardlike);

        }else{
            int userid = ((UserVO) httpRequest.getSession().getAttribute("login")).getUserId();

            BoardLikeVO vo = new BoardLikeVO();
            vo.setBoardId(boardId);
            vo.setUserId(userid);
//            System.out.println(vo.getUserId() + "userId??");
            int boardlike = service.getBoardLike(vo);
//            System.out.println(boardlike + "boardLike숫자");

            model.addAttribute("heart", boardlike);
        }
    }


    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public void modify(int boardId, Model model,
                       @ModelAttribute("category") String category) throws Exception {
        model.addAttribute(service.readBoard(boardId, category));

    }

    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modifyPOST(BoardVO board, RedirectAttributes rttr,
                             @ModelAttribute("category") String category,
                             HttpServletRequest httpRequest) throws Exception {

        service.updateBoard(board, category);
        String msg = "SUCCESS";

        rttr.addFlashAttribute("msg", msg);

        return "redirect:/board/list?category=" + category;
    }

    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public String remove(@RequestParam("boardId") int boardId, RedirectAttributes rttr,
                         @ModelAttribute("category") String category) throws Exception {
        service.deleteBoard(boardId, category);


        rttr.addFlashAttribute("msg", "SUCCESS");

        return "redirect:/board/list?category=" + category;
    }

    @ResponseBody
    @RequestMapping(value = "/heart", method = RequestMethod.POST, produces = "application/json")
    public int heart(HttpServletRequest httpRequest) throws Exception {

        int heart = Integer.parseInt(httpRequest.getParameter("heart"));
        int boardId = Integer.parseInt(httpRequest.getParameter("boardId"));

        int userid = ((UserVO) httpRequest.getSession().getAttribute("login")).getUserId();

        BoardLikeVO boardLikeVO = new BoardLikeVO();

        boardLikeVO.setBoardId(boardId);
        boardLikeVO.setUserId(userid);

        System.out.println(heart);

        if (heart >= 1) {
            service.deleteBoardLike(boardLikeVO);
            heart = 0;
        } else {
            service.insertBoardLike(boardLikeVO);
            heart = 1;
        }

        return heart;

    }


}
