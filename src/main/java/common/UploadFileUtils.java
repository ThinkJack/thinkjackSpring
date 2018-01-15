package common;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

import javax.imageio.ImageIO;

import java.awt.image.BufferedImage;
import java.io.File;

import java.util.Calendar;
import java.util.UUID;

public class UploadFileUtils {
    private static final Logger logger =
            LoggerFactory.getLogger(UploadFileUtils.class);


    public static String uploadFile(String uploadPath, String originalName,byte[] fileData, String userId)throws Exception{
        //S3 서버 관련 설정
        S3Util s3 = new S3Util();
        String bucketName = "thinkjackbucket";

        //UserVo 필요
        UUID uid = UUID.randomUUID();

        //savedName : 570d570a-7af1-4afe-8ed5-391d660084b7_g.JPG 같은 형식으로 만들어준다.
        String savedName = uid.toString() +"_"+originalName;

        String imagepath = "profile/"+ uploadPath;

        String savedPath = calcPath(imagepath,userId);

        File target =new File(uploadPath +savedPath,savedName);

        FileCopyUtils.copy(fileData,target);

        String formatName = originalName.substring(originalName.lastIndexOf(".")+1);

        String uploadedFileName ="/profile/"+formatName;

//        if(MediaUtils.getMediaType(formatName) !=null){
//            makeThumbnail(uploadPath,savedPath,savedName);
//                  String testupload=  savedPath+"/"+savedName;
//            uploadedFileName = testupload.replace('\\','/');
//                 // System.out.println("testupload: "+testupload);
//                 // System.out.println("testupload:replce "+testupload.replace('\\','/'));
//                  //System.out.println("thumbFile:"+uploadedFileName);
//                   // makeThumbnail(uploadPath,saveedPath,saveedName);
//
//        }else{
//            uploadedFileName = makeIcon(uploadPath,savedPath,savedName);
//        }

        //S3Util 의 fileUpload 메서드로 파일을 업로드한다.
        s3.fileUpload(bucketName, uploadPath+uploadedFileName, fileData);


        System.out.println(uploadedFileName);
//	s3.fileUpload(bucketName, new File(fileName))
        return uploadedFileName;

    }

    private static String makeIcon(String uploadPath, String path, String fileName) throws Exception{
        String iconName =
                uploadPath + path +File.separator+fileName;

        return iconName.substring(uploadPath.length()).replace(File.separatorChar,'/');
    }

    private static  String calcPath(String uploadPath, String userId){
        Calendar cal =Calendar.getInstance();
        String profilePath = "/"+userId;

        S3Util s3 = new S3Util();
        String bucketName = "thinkjackbucket";

        s3.createFolder(bucketName,profilePath);
        //makeDir(uploadPath, profilePath);

//
//        String  yearPath = File.separator+cal.get(Calendar.YEAR);
//
//        String monthPath = yearPath +
//                File.separator +
//                new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
//
//                String datePath = monthPath +
//                        File.separator +
//                        new DecimalFormat("00").format(cal.get(Calendar.DATE));
//
//                makeDir(uploadPath, yearPath,monthPath,datePath);

              //  logger.info(datePath);

                        return profilePath;
    }

    private static void makeDir(String uploadPath, String... paths) {
        if (new File(uploadPath + paths[paths.length - 1]).exists()) {
            return;
        }
        for (String path : paths) {

            File dirPath = new File(uploadPath + path);

            if (!dirPath.exists()) {
                dirPath.mkdir();
            }
        }
    }

    //썸네일 생성
    private static String makeThumbnail(
            String uploadPath,
            String path,
            String fileName)throws Exception{

        BufferedImage sourceImg =
                ImageIO.read(new File(uploadPath + path, fileName));
        BufferedImage destImg =
                Scalr.resize(sourceImg,Scalr.Method.AUTOMATIC,Scalr.Mode.FIT_TO_HEIGHT,100);
        String thumbnailName =
                uploadPath+path +File.separator +"s_"+fileName;
        File newFile = new File(thumbnailName);
        String formatName =
                fileName.substring(fileName.lastIndexOf(".")+1);


        ImageIO.write(destImg,formatName.toUpperCase(),newFile);
        return thumbnailName.substring(
                uploadPath.length()).replace(File.separatorChar,'/');


    }
}
