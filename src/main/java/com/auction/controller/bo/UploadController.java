package com.auction.controller.bo;

import com.auction.constants.Constants;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.joda.time.DateTime;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
@RequestMapping("/bo/uploadFile")
public class UploadController {
    private static final Logger LOGGER = Logger.getLogger(UploadController.class);

    @RequestMapping(value = "img", method = RequestMethod.POST)
    public String post(Model model, @RequestParam MultipartFile upload, @RequestParam String CKEditorFuncNum) throws IllegalStateException, IOException {
        StringBuilder sb = new StringBuilder();
        try {
            if (!upload.isEmpty()) {
                String dateString = new DateTime().toString(Constants.YYYYMMDD);
                String name = UUID.randomUUID() + ".jpg";
                String basePath = Constants.UPLOAD_PATH + dateString;
                FileUtils.forceMkdir(new File(basePath));
                File file = new File(basePath + File.separator + name);
                upload.transferTo(file);
                String fileUrl = "http://www.ffpaimai.com:8000/uploads/" + dateString + "/" + name;
                sb.append("<script type=\"text/javascript\">").append("window.parent.CKEDITOR.tools.callFunction(").append(CKEditorFuncNum).append(",'").append(fileUrl).append("','')</script>");
                model.addAttribute("ck", sb.toString());
            }
        } catch (Exception e) {
            LOGGER.error(e, e);
        }

        return "bo/ckeditorUpload";
    }
}
