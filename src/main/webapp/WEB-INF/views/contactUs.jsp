<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Management System</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <h1>Employee Management System</h1>
        
        <!-- Form Section -->
        <div class="form-container">
            <div class="form-header">
                <h2>Add Employee</h2>
                <button onclick="window.location.href='${pageContext.request.contextPath}/contact'" class="contact-us-btn">Contact Us</button>
            </div>
            
            <form action="${pageContext.request.contextPath}/employees/add" method="post" class="employee-form">
                <div class="form-row">
                    <label for="empName">Employee Name:</label>
                    <input type="text" id="empName" name="empName" required>
                </div>
                
                <div class="form-row">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
                </div>
                
                <div class="form-row">
                    <label for="phoneNumber">Phone Number:</label>
                    <input type="text" id="phoneNumber" name="phoneNumber" required>
                </div>
                
                <div class="form-row">
                    <label for="department">Department:</label>
                    <select id="department" name="department" required>
                        <option value="">Select Department</option>
                        <option value="HR">HR</option>
                        <option value="IT">IT</option>
                        <option value="Finance">Finance</option>
                        <option value="Sales">Sales</option>
                    </select>
                </div>
                
                <div class="form-row">
                    <label for="salary">Salary:</label>
                    <input type="number" id="salary" name="salary" required>
                </div>
                
                <button type="submit" class="submit-btn">Add Employee</button>
            </form>
        </div>

        <!-- Employee List Section -->
        <div class="table-container">
            <h2>Employee List</h2>
            <table>
                <thead>
                    <tr>
                        <th>Employee ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone Number</th>
                        <th>Department</th>
                        <th>Salary</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="employee" items="${employees}">
                        <tr>
                            <td>${employee.empId}</td>
                            <td>${employee.empName}</td>
                            <td>${employee.email}</td>
                            <td>${employee.phoneNumber}</td>
                            <td>${employee.department}</td>
                            <td>${employee.salary}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
