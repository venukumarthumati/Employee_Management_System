<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Contact Us</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
.social-links {
	margin-top: 20px;
	text-align: center;
}

.social-links img {
	width: 40px; /* Set icon size */
	height: 40px;
	margin: 0 15px;
	transition: transform 0.3s; /* Transition effect */
}

.social-links img:hover {
	transform: scale(1.1); /* Scale effect on hover */
}
</style>
</head>
<body>
	<div class="container">
		<h1>Contact Us</h1>
		<div class="form-container">
			<form id="contactForm"
				action="${pageContext.request.contextPath}/contact/submit"
				method="post" onsubmit="submitContactForm(event);">
				<div class="form-group">
					<label for="name">Name:</label> <input type="text"
						class="form-control" id="name" name="name" required>
				</div>
				<div class="form-group">
					<label for="email">Email:</label> <input type="email"
						class="form-control" id="email" name="email" required>
				</div>
				<div class="form-group">
					<label for="subject">Subject:</label> <input type="text"
						class="form-control" id="subject" name="subject" required>
				</div>
				<div class="form-group">
					<label for="message">Message:</label>
					<textarea class="form-control" id="message" name="message" rows="5"
						required></textarea>
				</div>
				<button type="submit" class="btn btn-primary">Send Message</button>
			</form>
		</div>

		<!-- Address Section -->
		<div class="contact-info mt-5">
			<h2>Our Address</h2>
			<p>
				1234 Employee Lane,<br> Ramalayam cross, 5th Line,<br>
				kohmitla<br> Nellore,<br> Andhra Pradesh,<br> 524408,<br>
				India
			</p>
		</div>

		<!-- Social Links Section -->
		<div class="social-links mt-4">
			<h2>Follow Us</h2>
			<a href="https://facebook.com" target="_blank"> <img
				src="https://img.icons8.com/ios-filled/50/000000/facebook-new.png"
				alt="Facebook">
			</a> <a href="https://twitter.com" target="_blank"> <img
				src="https://img.icons8.com/ios-filled/50/000000/twitter.png"
				alt="Twitter">
			</a> <a href="https://linkedin.com" target="_blank"> <img
				src="https://img.icons8.com/ios-filled/50/000000/linkedin.png"
				alt="LinkedIn">
			</a> <a href="https://instagram.com" target="_blank"> <img
				src="https://img.icons8.com/ios-filled/50/000000/instagram-new.png"
				alt="Instagram">
			</a> <a href="https://github.com" target="_blank"> <img
				src="https://img.icons8.com/ios-filled/50/000000/github.png"
				alt="GitHub">
			</a>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<script>
function submitContactForm(event) {
    event.preventDefault(); // Prevent default form submission

    const formData = new FormData(document.getElementById('contactForm'));
    const contactData = {
        name: formData.get('name'),
        email: formData.get('email'),
        subject: formData.get('subject'),
        message: formData.get('message')
    };

    fetch('/api/contact/submit', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(contactData)
    })
    .then(response => {
        if (response.ok) {
            alert('Your message has been sent successfully!');
        } else {
            alert('Failed to send message. Please try again later.');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('An error occurred while sending your message. Please try again later.');
    });
}
</script>
</body>
</html>
