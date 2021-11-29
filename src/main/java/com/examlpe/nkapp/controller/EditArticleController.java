package com.examlpe.nkapp.controller;

import com.examlpe.nkapp.domain.Article;
import com.examlpe.nkapp.domain.Computers;
import com.examlpe.nkapp.domain.User;
import com.examlpe.nkapp.repos.ArticleRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.jws.soap.SOAPBinding;
import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/articles")
@PreAuthorize("hasAuthority('ADMIN')")
public class EditArticleController {
    @Autowired
    private ArticleRepo articleRepo;

    @Value("${upload.path}")
    private String uploadPath;


    @GetMapping
    public String articleList(Model model){
        model.addAttribute("articles", articleRepo.findAll());
        return "aList";
    }

    @GetMapping("{article}")
    public String articleEditForm(@PathVariable Article article, Model model){
        model.addAttribute("articles", article);
        return "aEdit";
    }

    @PostMapping
    public String add(
            @RequestParam String theme,
            @RequestParam String text, Map<String, Object> model,
            @RequestParam("file") MultipartFile file, @AuthenticationPrincipal User user
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

    @PostMapping("{article}")
    public String articleEdit(
            @RequestParam String theme,
            @RequestParam String text,
            @PathVariable Article article){

        article.setTheme(theme);
        article.setText(text);

        articleRepo.save(article);

        return "redirect:/articles";
    }

    @PostMapping("article/del/{article}")
    public String deleteArticle(@PathVariable Article article){
        articleRepo.delete(article);

        return "redirect:/article";
    }

}
