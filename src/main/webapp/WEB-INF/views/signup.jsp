<!DOCTYPE html>
<html>
<head>
    <title>Signup</title>
</head>
<body>
    <h2>Signup</h2>
    <form action="/signup" method="post">

        <label for="firstName">First Name:</label>
                <input type="text" name="firstName" required />

        <label for="lastName">Last Name:</label>
                <input type="text" name="lastName" required />

        <label for="phoneNumber">Phone Number:</label>
                        <input type="text" name="phoneNumber" required />

        <label for="username">Username:</label>
        <input type="text" name="email" required />
        <label for="password">Password:</label>
        <input type="password" name="password" required />
        <button type="submit">Sign Up</button>
    </form>
    <a href="/login">Already have an account? Login</a>
</body>
</html>
