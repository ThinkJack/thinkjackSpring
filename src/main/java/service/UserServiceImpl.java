package service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import domain.UserVO;
import dto.LoginDTO;
import persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	private UserDAO dao;

	@Override
	public void regist(UserVO user) throws Exception {
		// TODO Auto-generated method stub
		//System.out.println(user);
		dao.insertUser(user);
		
	}



	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		// TODO Auto-generated method stub
		//System.out.println("service dto: "+dto);
		return dao.login(dto);
	}

	@Override
	public void modifyUser(UserVO user) throws Exception {
		dao.updateUser(user);

	}

	@Override
	public UserVO naverLogin(LoginDTO dto) throws Exception {
		UserVO vo =new UserVO();
		vo=dao.naverReadUser(dto);
//		if(vo==null){}
//		int id=vo.getUserId();
//		System.out.println("naverLogin userId :"+id);
		if(vo==null){
		try{
		dao.naverInsertUser(dto);
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}}
		return dao.naverReadUser(dto);
	}
}
