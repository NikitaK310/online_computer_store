package com.examlpe.nkapp.controller;


import com.examlpe.nkapp.domain.Basket;
import com.examlpe.nkapp.domain.Computers;
import com.examlpe.nkapp.domain.User;
import com.examlpe.nkapp.repos.BasketRepo;
import com.examlpe.nkapp.repos.ComputersRepo;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

@Controller
public class BasketController {
    private final ComputersRepo computersRepo;


    private final BasketRepo basketRepo;

    public BasketController(ComputersRepo computersRepo, BasketRepo basketRepo) {
        this.computersRepo = computersRepo;
        this.basketRepo = basketRepo;
    }


    @GetMapping("/basket")
    public String userList(@AuthenticationPrincipal User user, Model model){
        model.addAttribute("baskets",basketRepo.findByUser(user));

        Optional<Integer> reduce = basketRepo.findByUser(user).stream().map(x -> x.getComputers().getPrice()*x.getCount()).reduce((x, y) -> x + y);

        model.addAttribute("sum",reduce.orElse(0));

        return "basket";
    }

    @PostMapping("computer/buy/{computers}")
    public String buyComputer(@AuthenticationPrincipal User user,
                              @PathVariable Computers computers,
                              @RequestParam Integer count){
        if(count > computers.getCount()) return "redirect:/computers";

        basketRepo.save(new Basket(user, computers, count));

        computers.setCount(computers.getCount() - count);

        if (computers.getCount() == 0){
            computers.setCount(0);
        }

        computersRepo.save(computers);

        return "redirect:/computers";
    }

    @PostMapping("basket/del/{basket}")
    public String deleteComputer(@PathVariable Basket basket){
        basketRepo.delete(basket);

        return "redirect:/basket";
    }



}
