package com.auction.controller.bo;

import com.auction.service.UploadService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Controller
@RequestMapping("/bo/uploadFile")
public class UploadController {
    private static final Logger LOGGER = Logger.getLogger(UploadController.class);

    @Autowired
    private UploadService uploadService;

    @RequestMapping(value = "img", method = RequestMethod.POST)
    public String post(Model model, @RequestParam MultipartFile upload, @RequestParam String CKEditorFuncNum) throws IllegalStateException, IOException {
        StringBuilder sb = new StringBuilder();
        try {
            if (!upload.isEmpty()) {
                String fileUrl = uploadService.upload(upload);
                sb.append("<script type=\"text/javascript\">").append("window.parent.CKEDITOR.tools.callFunction(").append(CKEditorFuncNum).append(",'").append(fileUrl).append("','')</script>");
                model.addAttribute("ck", sb.toString());
            }
        } catch (Exception e) {
            LOGGER.error(e, e);
        }

        return "bo/ckeditorUpload";
    }
}
