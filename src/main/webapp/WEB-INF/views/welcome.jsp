<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Welcome</title>
</head>
<body>
    <h2>Welcome, ${username}!</h2>
    <a href="${pageContext.request.contextPath}/logout">Logout</a>
</body>
</html>
