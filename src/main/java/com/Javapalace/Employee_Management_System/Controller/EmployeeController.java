package com.Javapalace.Employee_Management_System.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Javapalace.Employee_Management_System.entity.Employee;
import com.Javapalace.Employee_Management_System.service.EmployeeService;

@Controller
@RequestMapping("/employees")
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;

	@PostMapping("/add")
	public String addEmployee(@ModelAttribute Employee employee) {
		employeeService.addEmployee(employee);
		return "redirect:/employees/management";
	}

	@GetMapping("/management")
	public String showEmployeeList(Model model) {
		List<Employee> employeeList = employeeService.getAllEmployees();
		model.addAttribute("employeeList", employeeList);
		System.out.println(employeeList);
		return "addEmployee";
	}

	@GetMapping("/contact")
	public String showContactUsPage() {
		return "contactUs";
	}
}
