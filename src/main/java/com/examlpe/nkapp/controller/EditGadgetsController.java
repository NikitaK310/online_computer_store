package com.examlpe.nkapp.controller;

import com.examlpe.nkapp.domain.Computers;
import com.examlpe.nkapp.repos.ComputersRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/computer")
@PreAuthorize("hasAuthority('ADMIN')")
public class EditGadgetsController {
    @Autowired
    private ComputersRepo computersRepo;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping
    public String computerList(Model model){
        model.addAttribute("computers", computersRepo.findAll());
        return "computerList";
    }

    @GetMapping("{computer}")
    public String computerEditForm(@PathVariable Computers computer, Model model){
        model.addAttribute("computer", computer);
        return "computerEdit";
    }

    @PostMapping
    public String add(
            @RequestParam String manufactureModel,
            @RequestParam String description, Map<String, Object> model,@RequestParam int price,@RequestParam int count,
            @RequestParam("file") MultipartFile file
    ) throws IOException {
        Computers computers1 = new Computers(manufactureModel, description, price, count);

        if(file != null && !file.getOriginalFilename().isEmpty()){
            File uploadDir = new File(uploadPath);

            if(!uploadDir.exists()){
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" +resultFilename));

            computers1.setFilename(resultFilename);
        }

        computersRepo.save(computers1);

        Iterable<Computers> computers2 = computersRepo.findAll();

        model.put("computers", computers2);

        return "computers";
    }

    @PostMapping("{computers}")
    public String computerSave(
            @RequestParam String manufactureModel,
            @RequestParam String description,
            @RequestParam Integer price,
            @RequestParam Integer count,
            @PathVariable Computers computers){
        computers.setManufactureModel(manufactureModel);
        computers.setDescription(description);
        if(price != null){
        computers.setPrice(price);
        }
        if(count != null){
        computers.setCount(count);
        }

        computersRepo.save(computers);

        return "redirect:/computer";
    }

    @PostMapping("del/{computers}")
    public String deleteComputer(@PathVariable Computers computers){
        computersRepo.delete(computers);

        return "redirect:/computer";
    }
}
