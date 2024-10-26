package com.llm.repositories;

import java.util.Optional;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.llm.model.Admin;
import com.llm.model.AdminWithoutProfile;

public interface AdminRepositories extends JpaRepository<Admin, Long> {

	Admin findByAdminName(String adminName);

	@Query("SELECT a.id as id, a.email as email, a.password as password, a.adminName as adminName FROM Admin a WHERE a.email = :email AND a.password = :password")
	Optional<AdminWithoutProfile> findAdminByEmailAndPassword(@Param("email") String email, @Param("password") String password);

}
