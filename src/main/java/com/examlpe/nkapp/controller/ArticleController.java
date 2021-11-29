package com.examlpe.nkapp.controller;

import com.examlpe.nkapp.domain.Article;
import com.examlpe.nkapp.domain.Basket;
import com.examlpe.nkapp.domain.Message;
import com.examlpe.nkapp.domain.User;
import com.examlpe.nkapp.repos.ArticleRepo;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

@Controller
public class ArticleController {

    private final ArticleRepo articleRepo;

    public ArticleController(ArticleRepo articleRepo) {
        this.articleRepo = articleRepo;
    }

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/article")
    public String main(Model model) {
        Iterable<Article> articles = articleRepo.findAll();

        model.addAttribute("articles", articles);

        return "article";
    }

    @PostMapping("/article")
    public String add(
            @AuthenticationPrincipal User user, //
            @RequestParam String theme,
            @RequestParam String text, Map<String, Object> model,
            @RequestParam("file") MultipartFile file
    ) throws IOException {
        Article article = new Article(theme, text, user);

        if(file != null && !file.getOriginalFilename().isEmpty()){
            File uploadDir = new File(uploadPath);

            if(!uploadDir.exists()){
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" +resultFilename));

            article.setFilename(resultFilename);
        }

        articleRepo.save(article);

        Iterable<Article> articles = articleRepo.findAll();

        model.put("articles", articles);

        return "article";
    }


}
