package com.examlpe.nkapp.controller;

import com.examlpe.nkapp.domain.Computers;
import com.examlpe.nkapp.repos.ComputersRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

@Controller
public class ComputersController {
    @Autowired
    private ComputersRepo computersRepo;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/computers")
    public String computers(Model model) {
        Iterable<Computers> computers2 = computersRepo.findAll();

        //ArrayList<Computers> computers3= new ArrayList<>();

        //computers2.forEach(computers3::add);
        //List<Computers> list = computers3.stream().filter(x -> x.getCount()>0).collect(Collectors.toList());

        model.addAttribute("computers", computers2);

        return "computers";
    }

    @PostMapping("/computers")
    public String addComputer( @AuthenticationPrincipal Computers computers,
                               @RequestParam String description,
                               @RequestParam String manufactureModel, Map<String, Object> model,
                               @RequestParam int price, @RequestParam int count,
                               @RequestParam("file") MultipartFile file) throws IOException {

       Computers computers1 = new Computers(manufactureModel, description, price, count);

        if(file != null && !file.getOriginalFilename().isEmpty()){
            File uploadDir = new File(uploadPath);

            if(!uploadDir.exists()){
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" +resultFilename));

            computers.setFilename(resultFilename);
        }

       computersRepo.save(computers1);

       Iterable<Computers> computers2 = computersRepo.findAll();

       model.put("computers",computers2);

        return "redirect:/computers";
    }
}
