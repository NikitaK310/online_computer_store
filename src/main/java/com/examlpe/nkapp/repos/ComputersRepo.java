package com.examlpe.nkapp.repos;

import com.examlpe.nkapp.domain.Computers;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ComputersRepo extends CrudRepository<Computers,Long> {
    List<Computers> findByManufactureModel(String manufactureModel);
}
