import domain.SrcVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import persistence.SrcDAO;
import service.SrcService;

import javax.inject.Inject;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/**/applicationContext.xml"})
public class SrcTest {

    @Inject
    private SrcDAO dao;

    @Inject
    private SrcService service;

    private SrcVO vo = new SrcVO();

//    @Test
//    public void insertSrc() throws Exception {// 익명 유저 데이터 입력
//        vo.setSrcHtml("<html</html>");
//        vo.setSrcCss("html{background : red;}");
//        vo.setSrcJavaScript("var aaa = function(){return 1;}");
//        vo.setSrcComments("gksdgksdlkghlk");
//        vo.setSrcTitle("gkgkgk");
//
//        service.saveSrc(vo);
//    }

    //    @Test
//    public void updateSrc() throws Exception {// 익명 유저 데이터 입력
//
//        vo.setSrcId("plXInl");
//        vo.setSrcHtml("<html><p>제대로 들어갔니?</p></html>");
//        vo.setSrcCss("html{background : blue;}");
//        vo.setSrcJavaScript("var aaa = function(){return 3;}");
//        vo.setSrcComments("sdsdf");
//        vo.setSrcTitle("zzz");
//
//        service.saveSrc(vo);
//    }
//
//    @Test
//    public void updateSrcStatus()throws Exception{
//        service.updateSrcStatus("plXInl");
//    }
//    @Test
//    public void readFileTest() {
//        try {
//            vo = dao.selectSrcOne("ksIqKm");
//            vo.setSrcHtml(readCodeSet(vo.getSrcPath() + "/html.txt"));
//            vo.setSrcCss(readCodeSet(vo.getSrcPath() + "/css.txt"));
//            vo.setSrcJavaScript(readCodeSet(vo.getSrcPath() + "/js.txt"));
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//
//    public String readCodeSet(String filePath) throws IOException {
//        String str = "";
//        int i;
//
//        File file = new File(filePath);
//        FileReader fr = new FileReader(file);
//        while ((i = fr.read()) != -1) {
//            str += (char) i;
//        }
//        fr.close();
//        return str;
//    }
}