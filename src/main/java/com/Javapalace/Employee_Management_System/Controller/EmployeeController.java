package com.Javapalace.Employee_Management_System.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.Javapalace.Employee_Management_System.entity.Employee;
import com.Javapalace.Employee_Management_System.exception.EmployeeServiceException;
import com.Javapalace.Employee_Management_System.service.EmployeeService;

import java.util.List;

@Controller
@RequestMapping("/employees")
public class EmployeeController {

    private static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);

    @Autowired
    private EmployeeService employeeService;

    /**
     * Adds a new employee and redirects to the management page.
     *
     * @param employee the employee to be added
     * @return redirect URL for employee management
     */
    @PostMapping("/add")
    public String addEmployee(@ModelAttribute Employee employee) {
        logger.info("Adding new employee: {}", employee);
        employeeService.addEmployee(employee);
        logger.info("Employee added successfully: {}", employee);
        return "redirect:/employees/management";
    }

    /**
     * Displays the list of employees on the management page.
     *
     * @param model the model to populate with employee data
     * @return the name of the management view
     */
    @GetMapping("/management")
    public String showEmployeeList(Model model) {
        List<Employee> employeeList = employeeService.getAllEmployees();
        model.addAttribute("employeeList", employeeList);
        return "addEmployee";
    }

    @GetMapping("/contact")
    public String showContactUsPage() {
        return "contactUs";
    }
}
