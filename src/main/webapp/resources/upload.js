function checkImageType(fileName) {
    var pattern = /jpg|gif|png|jpeg/i;

    return fileName.match(pattern);

}

function getFileInfo(fullName) {

    var fileName, imgsrc, getLink;

    var fileLink;

    if(checkImageType(fullName)){
        imgsrc = "http://" + document.location.host + "/displayFile?fileName="+fullName;
        fileLink = fullName.substr(14);

        var front = fullName.substr(0,12); ///2015/00/00/
        var end = fullName.substr(14);

        getLink = "/displayFile?fileName="+front+end;
    }else{
        imgsrc="/resource/dist/img/file.png";
        fileLink=fullName.substr(12);
        getLink="/displayFile?fileName="+fullName;
    }
    fileName= fullName.substr(fileLink.indexOf("_")+1);

    //return {fileName:fileName,imgsrc:imgsrc,getLink:getLink,fullName:fullName}
    return imgsrc;
}

function filePathChange(path, thumbnail) {
    var headerimg;
    var fullName=path;
    var test =fullName.lastIndexOf("/");
    fileName= fullName.substring(test+1,fullName.length);
    path= fullName.substring(0,test+1);
//            console.log(path);
//            console.log(fileName);
//            console.log(test);
    if(thumbnail === "true"){
        profileheader =path+"s_"+fileName;
    }else{
        profileheader =path+fileName;
    }

//            console.log(fullName);
    if(fullName!=="") {
        headerimg = getFileInfo(profileheader);
        // console.log(headerimg);
        hstr = headerimg;
    }else{
        hstr = "/resources/images/like1.png";
    }
    return hstr;
}
