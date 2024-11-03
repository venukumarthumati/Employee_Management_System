package com.Javapalace.Employee_Management_System.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.Javapalace.Employee_Management_System.entity.Contact;
import com.Javapalace.Employee_Management_System.service.ContactService;

@RestController
@RequestMapping("/api/contact")
public class ContactController {

	@Autowired
	private ContactService contactService; 
	
	@PostMapping("/submit")
    public ResponseEntity<Contact> submitContactForm(@RequestBody Contact contact) {
        Contact savedContact = contactService.submitContact(contact);
        return ResponseEntity.ok(savedContact);
    }
}
