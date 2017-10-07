<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Notes</title>
</head>
<body>
<h2>Notes list</h2>
<table border="1">
    <tr>
        <th>id</th>
        <th>name</th>
        <th>description</th>
        <th>done</th>
        <th>createdDate</th>
    </tr>
    <c:forEach var="note" items="${notes}">
        <tr>
            <td>${note.id}</td>
            <td>${note.name}</td>
            <td>${note.description}</td>
            <td>${note.done}</td>
            <td>${note.createdDate.format(dateFormatter)}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
