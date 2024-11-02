<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Management System</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<h1>Employee Management System</h1>

		<!-- Form Section -->
		<div class="form-container">
			<div class="form-header">
				<h2>Add Employee</h2>
				<button
					onclick="window.location.href='${pageContext.request.contextPath}/employees/contact'"
					class="contact-us-btn">Contact Us</button>
			</div>
			<form id="employeeForm"
				action="${pageContext.request.contextPath}/employees/add"
				method="post" class="employee-form" onsubmit="submitForm(event);">
				<div class="form-row">
					<label for="empName">Employee Name:</label> <input type="text"
						id="empName" name="empName" required>
				</div>
				<div class="form-row">
					<label for="email">Email:</label> <input type="email" id="email"
						name="email" required>
				</div>
				<div class="form-row">
					<label for="phoneNumber">Phone Number:</label> <input type="text"
						id="phoneNumber" name="phoneNumber" required>
				</div>
				<div class="form-row">
					<label for="department">Department:</label> <select id="department"
						name="department" required>
						<option value="">Select Department</option>
						<option value="HR">HR</option>
						<option value="IT">IT</option>
						<option value="Finance">Finance</option>
						<option value="Sales">Sales</option>
					</select>
				</div>
				<div class="form-row">
					<label for="salary">Salary:</label> <input type="number"
						id="salary" name="salary" required>
				</div>
				<button type="submit" class="submit-btn">Add Employee</button>
			</form>
		</div>

		<!-- Employee List Section -->
		<div class="table-container">
            <h2>Employee List</h2>
            <table class="table">
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
                    <c:if test="${not empty employeeList}">
                        <c:forEach var="employee" items="${employeeList}">
                            <tr>
                                <td>${employee.empId}</td>
                                <td>${employee.empName}</td>
                                <td>${employee.email}</td>
                                <td>${employee.phoneNumber}</td>
                                <td>${employee.department}</td>
                                <td>${employee.salary}</td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty employeeList}">
                        <tr>
                            <td colspan="6">No employees found.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
	</div>

	<!-- Modal for Success Notification -->
	<div class="modal fade" id="success_Notification" tabindex="-1"
		role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<div class="text-center">
						<img
							src="${pageContext.request.contextPath}/static/images/source.gif"
							style="width: 140px;">
						<h4 class="refunded_body">Employee added successfully!</h4>
						<div class="text-center">
							<button id="confirmButton" type="button" class="btn btn-success"
								onclick="redirectToAddEmployee();">OK</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<script>
	function submitForm(event) {
		event.preventDefault(); // Prevent the default form submission

		// Create a FormData object to gather form data
		const formData = new FormData(document.getElementById('employeeForm'));

		// Send the form data using fetch
		fetch('${pageContext.request.contextPath}/employees/add', {
			method: 'POST',
			body: formData
		})
		.then(response => {
			if (response.ok) {
				// Show the success modal
				showSuccessModal();
			} else {
				// Handle error
				alert('Failed to add employee. Please try again.');
			}
		})
		.catch(error => {
			console.error('Error:', error);
			alert('An error occurred while adding the employee. Please try again.');
		});
	}

		function redirectToAddEmployee() {
			// Redirect to the employee management page after clicking OK
			window.location.href = '${pageContext.request.contextPath}/employees/management';
		}

		function openModal(empId, empName, empEmail, empPhone, empDepartment,
				empSalary) {
			document.getElementById('modalEmpId').innerText = empId;
			document.getElementById('modalEmpName').innerText = empName;
			document.getElementById('modalEmpEmail').innerText = empEmail;
			document.getElementById('modalEmpPhone').innerText = empPhone;
			document.getElementById('modalEmpDepartment').innerText = empDepartment;
			document.getElementById('modalEmpSalary').innerText = empSalary;

			document.getElementById('employeeModal').style.display = 'block';
		}

		function closeModal() {
			document.getElementById('employeeModal').style.display = 'none';
		}

		// Close modal when clicking outside of it
		window.onclick = function(event) {
			var modal = document.getElementById('employeeModal');
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
		function showSuccessModal() {
			// Show the success modal
			$('#success_Notification').modal('show');
		}

	</script>
</body>
</html>
