package com.examlpe.nkapp.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Data
@NoArgsConstructor
public class Basket {

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Long id;

    @ManyToOne(fetch =  FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne(fetch =  FetchType.EAGER)
    @JoinColumn(name = "computers_id")
    private Computers computers;

    private int count;

    public Basket(User user, Computers computers, int count) {
        this.user = user;
        this.computers = computers;
        this.count = count;
    }
}
