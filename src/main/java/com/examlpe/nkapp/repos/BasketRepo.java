package com.examlpe.nkapp.repos;

import com.examlpe.nkapp.domain.Basket;
import com.examlpe.nkapp.domain.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BasketRepo extends CrudRepository<Basket,Long> {
    List<Basket> findByUser(User user);

}
