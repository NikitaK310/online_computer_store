package com.examlpe.nkapp.repos;

import com.examlpe.nkapp.domain.Article;
import com.examlpe.nkapp.domain.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ArticleRepo extends CrudRepository<Article, Long> { // с помощью рефлексии он читает строку метода который конвертирует запрос в sql который тащит из базы данных данные и передает их юзеру
    List<Article> findByAuthor(User user); // спринг рефлексивно читает интерфейс создает класс и реализует методы
}
