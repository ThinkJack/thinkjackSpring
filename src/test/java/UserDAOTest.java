import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import domain.UserVO;
import persistence.UserDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/**/applicationContext.xml"})
public class UserDAOTest {
	
	@Inject
	private UserDAO dao;
	
	@Test
	public void testInsertUser() throws Exception{
		UserVO vo = new UserVO();
		vo.setUserEmail("emaidl@");
		vo.setUserPassword("1234");
		vo.setUserName("kkkdfk");
		System.out.println(vo);
		dao.insertUser(vo);

	}

}
