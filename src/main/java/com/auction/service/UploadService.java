package com.auction.service;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.StringUtils;
import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.UUID;

/**
 * Created by root on 15-3-3.
 */
@Service
public class UploadService {
    private static final Logger LOGGER = LoggerFactory.getLogger(UploadService.class);

    @Value("${imgPath}")
    private String imgPath;
    @Value("${imgUrl}")
    private String imgUrl;

    public String upload(MultipartFile uploadFile) {
        if (!uploadFile.isEmpty()) {
            String suffix = FilenameUtils.getExtension(uploadFile.getOriginalFilename());
            String fileName = UUID.randomUUID().toString();
            if (StringUtils.isNotBlank(suffix)) {
                fileName = fileName + "." + suffix;
            }
            try {
                String dateString = new DateTime().toString("yyyy-MM-dd");
                String basePath = imgPath + dateString;
                FileUtils.forceMkdir(new File(basePath));
                File file = new File(basePath + File.separator + fileName);
                uploadFile.transferTo(file);
                return imgUrl + dateString + "/" + fileName;
            } catch (Exception e) {
                LOGGER.error(e.getMessage(), e);
            }

        }
        return null;
    }


}
