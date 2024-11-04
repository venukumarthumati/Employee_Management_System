package com.Javapalace.Employee_Management_System.exception;

public class ContactServiceException extends RuntimeException {

	public ContactServiceException(String message) {
		super(message);
	}

	public ContactServiceException(String message, Throwable cause) {
		super(message, cause);
	}
}
