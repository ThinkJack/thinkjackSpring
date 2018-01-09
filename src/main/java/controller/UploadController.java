package controller;

import common.MediaUtils;
import common.UploadFileUtils;
import domain.UserVO;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.UUID;


@Controller
public class UploadController {
    private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

    @Resource(name="uploadPath")
    private String uploadPath;

    @RequestMapping(value = "/uploadForm",method = RequestMethod.GET)
    public String uploadForm(MultipartFile file, Model model) throws Exception{

       // System.out.println("originalName:"+file.getOriginalFilename());
        //System.out.println("size: "+file.getSize());
       // System.out.println("contentType:"+file.getContentType());

        String savedName =
                uploadFile(file.getOriginalFilename(),file.getBytes());

        model.addAttribute("savedName",savedName);

        return "uploadResult";

    }

    @RequestMapping(value = "/uploadAjax",method = RequestMethod.GET)
    public void uploadAjax(){

    }
    @ResponseBody
    @RequestMapping(value = "/uploadAjax",method = RequestMethod.POST, produces = "text/plane;charset=UTF-8")
    public ResponseEntity<String> uploadAjax(MultipartFile file, HttpSession session)throws Exception{

       // System.out.println("originalName:"+file.getOriginalFilename());
//        System.out.println("size: "+file.getSize());
//        System.out.println("contentType:"+file.getContentType());
        UserVO vo = (UserVO)session.getAttribute("login");

        String userId= vo.getUserId()+"";

        return new ResponseEntity<>(
                UploadFileUtils.uploadFile(uploadPath,
                        file.getOriginalFilename(),
                        file.getBytes(),
                        userId),
                        HttpStatus.CREATED);

    }

    private String uploadFile(String originalName, byte[] fileData) throws Exception{

        UUID uid = UUID.randomUUID();
        String savedName = uid.toString() +"_" +originalName;

        File target = new File(uploadPath,savedName);

        FileCopyUtils.copy(fileData,target);
        return savedName;
    }
    @ResponseBody
    @RequestMapping("/displayFile")
    public ResponseEntity<byte[]> displayFile(String fileName)throws Exception{

        InputStream in = null;
        ResponseEntity<byte[]> entity = null;

        //System.out.println("FileName : "+fileName);

        try{
            String formatName = fileName.substring(fileName.lastIndexOf(".")+1);

            MediaType mType = MediaUtils.getMediaType(formatName);
            HttpHeaders headers = new HttpHeaders();

            in = new FileInputStream(uploadPath+fileName);
            //System.out.println("in : "+in);
            if(mType != null){
                headers.setContentType(mType);
            }else{

                fileName = fileName.substring(fileName.indexOf("_")+1);
                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
                headers.add("Content-Disposition","attachment; filename=\""+new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");
            }
            entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
            headers,
            HttpStatus.CREATED);
        }catch (FileNotFoundException effe){
            System.out.println("File Not found Exception");
            String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
            MediaType mType = MediaUtils.getMediaType(formatName);
            HttpHeaders headers = new HttpHeaders();
            in = new FileInputStream(uploadPath+"/noimage.jpeg");

                headers.setContentType(mType);

            entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
                    headers,
                    HttpStatus.CREATED);
        }catch (Exception e){
            e.printStackTrace();
            entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
        }finally {
            in.close();
        }
        return entity;
    }
}
