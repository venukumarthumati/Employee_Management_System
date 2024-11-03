package com.Javapalace.Employee_Management_System.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Javapalace.Employee_Management_System.Repository.ContactRepository;
import com.Javapalace.Employee_Management_System.entity.Contact;

@Service
public class ContactServiceImpl implements ContactService {

	@Autowired
	private ContactRepository contactRepository;

	@Override
	public Contact submitContact(Contact contact) {
		return contactRepository.save(contact);
	}

}
