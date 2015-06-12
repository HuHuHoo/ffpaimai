package com.auction.controller.bo;

import com.auction.constants.Constants;
import com.auction.dao.ImageDAO;
import com.auction.domain.Image;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.ArrayUtils;
import org.apache.log4j.Logger;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.UUID;

/**
 * Created by lb on 2014/8/24.
 */
@Controller
@RequestMapping(value = "/bo/homeImage")
public class HomeImageController {
    private static final Logger LOGGER = Logger.getLogger(HomeImageController.class);
    @Autowired
    private ImageDAO imageDAO;

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String list(Model model) {
        model.addAttribute("images", imageDAO.findByType(Image.HOME_IMAGE_TYPE));
        return "bo/listHomeImage";
    }

    @Transactional
    @RequestMapping(value = "upload/{id}", method = RequestMethod.POST)
    public String addOrModify(@PathVariable Long id, @RequestParam MultipartFile upload) {
        Image image = imageDAO.findById(id);
        if (!upload.isEmpty()) {
            try {
                String dateString = new DateTime().toString("yyyy-MM-dd");
                String name = UUID.randomUUID() + ".jpg";
                String basePath = Constants.UPLOAD_PATH + dateString;
                FileUtils.forceMkdir(new File(basePath));
                File file = new File(basePath + File.separator + name);
                upload.transferTo(file);
                image.setPath("/uploads/"+dateString + "/" + name);
            } catch (Exception e) {
                LOGGER.error(e, e);
            }
        }
        return "redirect:/bo/homeImage/list";
    }
}
