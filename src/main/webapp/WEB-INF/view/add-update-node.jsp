<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
    <title>Add new node</title>
</head>
<body>
<form:form action="${pageContext.request.contextPath}/add-note" method="post" modelAttribute="noteForm"
    acceptCharset="utf-8">
    <table>
        <tr>
            <td>Name</td>
            <td><form:input path="name"/></td>
        </tr>
        <tr>
            <td>Description</td>
            <td><form:textarea path="description" rows="5" cols="30"/></td>
        </tr>
        <tr>
            <td><input type="submit" value="Submit"/></td>
        </tr>
    </table>
</form:form>
</body>
</html>
