<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page errorPage="error.jsp" %>
<html>
<head>
    <title>Add new node</title>
</head>
<body>
<div align="center">
    <form:form action="${pageContext.request.contextPath}/${postPath}" method="post" modelAttribute="noteObj"
               acceptCharset="utf-8">
        <table>
            <form:hidden path="id"/>
            <tr>
                <td>Name</td>
                <td><form:input path="name" maxlength="45"/></td>
            </tr>
            <tr>
                <td>Description</td>
                <td><form:textarea path="description" rows="5" cols="30" maxlength="300"/></td>
            </tr>
            <tr>
                <td>Done</td>
                <td><form:checkbox path="done"/></td>
            </tr>
            <tr>
                <form:hidden path="createdDate"/>
            </tr>
        </table>
        <input type="submit" value="Submit"/>
    </form:form>
</div>
</body>
</html>
