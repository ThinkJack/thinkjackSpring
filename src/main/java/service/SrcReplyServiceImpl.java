package service;

import org.springframework.stereotype.Service;
import persistence.SrcReplyDAO;

import javax.inject.Inject;

@Service
public class SrcReplyServiceImpl implements SrcReplyService {

    @Inject
    private SrcReplyDAO dao;

}
