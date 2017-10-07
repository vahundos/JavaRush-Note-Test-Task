<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add new node</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/add-node" method="post">
    <br>Name
    <br><input type="text" id="name">
    <br>Description
    <br><textarea id="description"></textarea>
    <br>
    <button type="submit">add</button>
</form>
</body>
</html>
