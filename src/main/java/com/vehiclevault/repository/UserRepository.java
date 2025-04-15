package com.vehiclevault.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.vehiclevault.entity.UserEntity;

public interface UserRepository extends JpaRepository<UserEntity, Integer> {
    Optional<UserEntity> findByEmail(String email);
    Optional<UserEntity> findByUserId(Integer userId);
    
    
    @Query("SELECT COUNT(u) FROM UserEntity u")
    long countAllUsers();
    
    @Query("SELECT FUNCTION('MONTH', u.createdAt), COUNT(u) FROM UserEntity u WHERE u.createdAt IS NOT NULL GROUP BY FUNCTION('MONTH', u.createdAt) ORDER BY FUNCTION('MONTH', u.createdAt)")
    List<Object[]> countUsersByMonth();


}
