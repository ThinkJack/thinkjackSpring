import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.inject.Inject;
import javax.sql.DataSource;
import java.sql.Connection;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/**/applicationContext.xml"})
public class DataSourceTest {

    @Inject
    private DataSource ds;

    @Test
    public void DataSourceTest() throws Exception{
        try (Connection con = ds.getConnection()) {

            System.out.println(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
 
    }

}
