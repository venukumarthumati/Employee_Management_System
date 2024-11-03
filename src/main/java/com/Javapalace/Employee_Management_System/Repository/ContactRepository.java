package com.Javapalace.Employee_Management_System.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Javapalace.Employee_Management_System.entity.Contact;

@Repository
public interface ContactRepository extends JpaRepository<Contact, Integer> {

}
