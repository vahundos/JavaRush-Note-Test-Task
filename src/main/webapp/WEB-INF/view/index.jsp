<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
    <title>Notes</title>
</head>
<body>
<h2>Notes list</h2>
<form action="${pageContext.request.contextPath}/add-note" method="get">
    <input type="submit" value="Add note"/>
</form>
<table>
    <tr>
        <th>
            <select id="filterType">
                <c:forEach var="pair" items="${filterMap}">
                    <option value=${pair.key}>${pair.value}</option>
                </c:forEach>
            </select>
        </th>
        <th>
            <input type="button" value="Submit" onclick="setCookie()">
            <script type="text/javascript">
                setCookie = function () {
                    document.cookie = "filterType=" + document.getElementById("filterType").value;
                    location.reload(true);
                }
            </script>
        </th>
    </tr>
</table>
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
