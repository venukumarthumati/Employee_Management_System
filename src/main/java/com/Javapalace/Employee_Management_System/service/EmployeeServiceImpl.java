package com.Javapalace.Employee_Management_System.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Javapalace.Employee_Management_System.Repository.EmployeeRepository;
import com.Javapalace.Employee_Management_System.entity.Employee;
import com.Javapalace.Employee_Management_System.exception.EmployeeServiceException;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	private static final Logger logger = LoggerFactory.getLogger(EmployeeServiceImpl.class);

	@Autowired
	private EmployeeRepository employeeRepository;

	/**
	 * Adds a new employee to the repository.
	 * 
	 * @param employee the employee to be added
	 * @return the saved employee object
	 * @throws EmployeeServiceException if saving the employee fails
	 */
	@Override
	public Employee addEmployee(Employee employee) {
		logger.info("Adding new employee: {}", employee);

		// Here you could add additional validation logic if needed
		try {
			Employee savedEmployee = employeeRepository.save(employee);
			return savedEmployee;
		} catch (Exception e) {
			throw new EmployeeServiceException("Failed to save employee", e);
		}
	}

	/**
	 * Retrieves all employees from the repository.
	 * 
	 * @return a list of all employees
	 */
	@Override
	public List<Employee> getAllEmployees() {
		List<Employee> employees = employeeRepository.findAll();
		logger.info("Retrieved {} employees.", employees.size());
		return employees;
	}

}
