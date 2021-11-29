package com.examlpe.nkapp.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Data
@NoArgsConstructor
public class Article {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private Long id;

    private String theme;

    @Lob
    private String text;

    @ManyToOne(fetch =  FetchType.EAGER) //
    @JoinColumn(name = "user_id")
    private User author;

    private String filename;

    public Article(String theme, String text, User user) {
        this.theme = theme;
        this.text = text;
        this.author = user;
    }
}
