package service;

import org.springframework.stereotype.Service;
import persistence.SrcDAO;

import javax.inject.Inject;

@Service
public class SrcServiceImpl implements SrcService {

    @Inject
    private SrcDAO dao;
}
