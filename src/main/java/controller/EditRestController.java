package controller;

import domain.SrcVO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import service.SrcService;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/editRest/*")
public class EditRestController {

    @Inject
    private SrcService service;

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ResponseEntity<String> srcSave(HttpServletRequest request,@RequestBody SrcVO vo) throws Exception{

        ResponseEntity<String> entity = new ResponseEntity<>(service.saveSrc(request, vo), HttpStatus.OK);

        return entity;
    }
}
