package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/edit/*")
public class EditController {

    @RequestMapping(value = "/editPage", method = RequestMethod.GET)
    void editView(){

    }

    @RequestMapping(value = "/unitTest" ,method = RequestMethod.GET)
    void unitTest(){

    }
}