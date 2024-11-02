package com.Javapalace.Employee_Management_System.service;

import java.util.List;

import com.Javapalace.Employee_Management_System.entity.Employee;

public interface EmployeeService {

	List<Employee> getAllEmployees();

	Employee addEmployee(Employee employee);

}
