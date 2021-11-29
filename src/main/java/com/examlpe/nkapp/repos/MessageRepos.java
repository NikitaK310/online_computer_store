package com.examlpe.nkapp.repos;

import com.examlpe.nkapp.domain.Message;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MessageRepos extends CrudRepository<Message, Long> {

    List<Message> findByTag(String tag);

}
