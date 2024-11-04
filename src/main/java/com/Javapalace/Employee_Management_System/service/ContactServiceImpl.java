package com.Javapalace.Employee_Management_System.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.Javapalace.Employee_Management_System.Repository.ContactRepository;
import com.Javapalace.Employee_Management_System.entity.Contact;
import com.Javapalace.Employee_Management_System.exception.ContactServiceException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * Persists a Contact entity to the database.
 *
 * @param contact the Contact entity to be saved
 * @return the saved Contact entity with a generated ID
 * @throws ContactServiceException if saving fails due to database errors
 */

@Service
public class ContactServiceImpl implements ContactService {

	private static final Logger logger = LoggerFactory.getLogger(ContactServiceImpl.class);

	@Autowired
	private ContactRepository contactRepository;

	@Transactional
	@Override
	public Contact submitContact(Contact contact) {
		if (contact == null || contact.getName() == null || contact.getEmail() == null) {
			throw new IllegalArgumentException("Contact details are incomplete.");
		}

		try {
			Contact savedContact = contactRepository.save(contact);
			logger.info("Contact saved successfully with ID: {}", savedContact.getId());
			return savedContact;
		} catch (DataAccessException e) {
			logger.error("Failed to save contact: {}", contact, e);
			throw new ContactServiceException("Failed to save contact", e);
		}
	}
}
