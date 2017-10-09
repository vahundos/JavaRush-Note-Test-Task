<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Notes</title>
</head>
<body>
<h2>Notes list</h2>
<form action="${pageContext.request.contextPath}/add-note" method="get">
    <button type="submit">Add note</button>
</form>
<table border="1">
    <tr>
        <th>id</th>
        <th>name</th>
        <th>description</th>
        <th>done</th>
        <th>createdDate</th>
        <th></th>
        <th>remove</th>
    </tr>
    <c:forEach var="note" items="${notes}">
        <tr>
            <td>${note.id}</td>
            <td>${note.name}</td>
            <td>${note.description}</td>
            <td>${note.done}</td>
            <td>${note.createdDate.format(dateFormatter)}</td>
            <td><a href="/update-note?id=${note.id}">edit</a></td>
            <td><a href="/remove-note?id=${note.id}">X</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
