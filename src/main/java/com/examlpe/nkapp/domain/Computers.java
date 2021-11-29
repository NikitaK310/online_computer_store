package com.examlpe.nkapp.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
@Data
@NoArgsConstructor
public class Computers {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Long id;
    private String manufactureModel;
    private String description;
    private int price;
    private int count;

    private String filename;

    public Computers(String manufactureModel, String description, int price, int count){
        this.manufactureModel = manufactureModel;
        this.description = description;
        this.price = price;
        this.count = count;
    }

}
