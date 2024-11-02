package com.Javapalace.Employee_Management_System.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Javapalace.Employee_Management_System.Repository.EmployeeRepository;
import com.Javapalace.Employee_Management_System.entity.Employee;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeRepository employeeRepository;

	public List<Employee> getAllEmployees() {
        return employeeRepository.findAll();
    }

	@Override
	public Employee addEmployee(Employee employee) {
		 return employeeRepository.save(employee);
		
	}

}
