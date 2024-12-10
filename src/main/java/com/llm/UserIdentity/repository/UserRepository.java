package com.llm.UserIdentity.repository;

import com.llm.UserIdentity.model.User;
import com.llm.UserIdentity.model.enums.Role;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User,Long> {

    Optional<User> findByEmail(String email);

    Optional<User> findByUsername(String username);

    Page<User> findByRole(Role role, Pageable pageable);

    List<User> findByRole(Role role);

}
