<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/c51a42b11c.js" crossorigin="anonymous"></script>
<title>Delight_Expense</title>
<style type="text/css">
/* Your existing styles remain unchanged */
body {
  background-color: #42c2ff;
  overflow: hidden;
  height: 100vh;
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  list-style: none;
  text-decoration: none;
  font-family: 'Josefin Sans', sans-serif;
}
.Register {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 400px;
  background: #ffffff;
  border-radius: 10px;
}
.Register h2 {
  text-align: center;
  padding: 0 0 20px 0;
  border-bottom: 1px solid silver;
}
.Register form {
  padding: 0 40px;
  box-sizing: border-box;
}

form .txt {
  position: relative;
  border-bottom: 2px solid #adadad;
  margin: 30px 0;
}
.txt input {
  width: 100%;
  padding: 0 5px;
  height: 40px;
  font-size: 16px;
  border: none;
  background: none;
  outline: none;
}
.txt label {
  position: absolute;
  top: 50%;
  right: 0;
  color: #adadad;
  transform: translateY(-50%);
  font-size: 16px;
  pointer-events: none;
}
#DOB label {
  position: absolute;
  top: 50%;
  right: 5%;
  color: #adadad;
  transform: translateY(-50%);
  font-size: 16px;
  pointer-events: none;
}

input[type="submit"] {
  width: 100%;
  height: 40px;
  background: #42c2ff;
  color: #e9f4fb;
  font-size: 18px;
  border-radius: 25px;
  font-weight: 700;
  cursor: pointer;
  outline: none;
  border: none;
}
input[type="submit"]:hover {
  border: 1px solid #42c2ff;
  transition: .5s;
}

.signup {
  margin: 30px 0;
  text-align: center;
  font-size: 16px;
  color: #666666;
}
.signup a {
  color: #42c2ff;
  text-decoration: none;
}
.signup a:hover {
  text-decoration: underline;
}

.error {
  color: red;
  font-size: 12px;
}
</style>
</head>
<body>
<div class="Register">
  <h2>Register</h2>
  <form action="register" method="post" onsubmit="return validate()">
    <div class="txt" id="user">
      <input type="text" name="name" id="username">
      <label>Username</label>
      <div id="username-error" class="error"></div>
    </div>
    <div class="txt">
      <input type="email" name="email" id="email">
      <label>Email</label>
      <div id="email-error" class="error"></div>
    </div>
    <div class="txt">
      <input type="tel" name="phone" id="phone">
      <label>Mobile</label>
      <div id="phone-error" class="error"></div>
    </div>
    <div class="txt" id="DOB">
      <input type="date" name="birth" id="birth" placeholder="DOB">
      <label>DOB</label>
      <div id="dob-error" class="error"></div>
    </div>
    <div class="txt">
      <input type="password" name="password" id="pass">
      <label>Password</label>
      <div id="password-error" class="error"></div>
    </div>
    <input type="submit" value="Signup" id="submit">
    <div class="signup">
      Already a member? <a href="login.jsp">Login</a>
    </div>
  </form>
</div>

<script type="text/javascript">
function validate() {
  // Reset error messages
  document.getElementById('username-error').innerHTML = '';
  document.getElementById('email-error').innerHTML = '';
  document.getElementById('phone-error').innerHTML = '';
  document.getElementById('dob-error').innerHTML = '';
  document.getElementById('password-error').innerHTML = '';

  var isValid = true;

  // Username validation
  var username = document.getElementById('username').value;
  const usernamePattern = /^[a-zA-Z][a-zA-Z0-9_-]{2,15}$/;
  if(!usernamePattern.test(username))
  {
	  document.getElementById('username-error').innerHTML =  "Invalid username: Must start with a letter, 3-16 characters, and only letters, numbers, underscores, or hyphens.";
      isValid = false;
  }
  // Email validation
  var email = document.getElementById('email').value;
  var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
  if (!emailRegex.test(email)) {
    document.getElementById('email-error').innerHTML = "Please enter a valid email address.";
    isValid = false;
  }

  // Phone validation (optional)
  var phone = document.getElementById('phone').value;
  var phoneRegex = /^[0-9]{10}$/;
  if (!phoneRegex.test(phone)) {
    document.getElementById('phone-error').innerHTML = "Please enter a valid 10-digit phone number.";
    isValid = false;
  }

  // Date of Birth validation
  var birth = document.getElementById('birth').value;
  if (!birth) {
    document.getElementById('dob-error').innerHTML = "Please select your date of birth.";
    isValid = false;
  }

  // Password validation (at least 6 characters)
  var password = document.getElementById('pass').value;
  const passwordPattern = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]{8,}$/;
  if (!passwordPattern.test(password)) {
	  document.getElementById('password-error').innerHTML = "Invalid password: Must be at least 8 characters long, with at least one Uppercase letter, one lowercase letter, special character and one number.";
    return false;
  }
  // If any validation fails, prevent form submission
  return isValid;
}
</script>
</body>
</html>
