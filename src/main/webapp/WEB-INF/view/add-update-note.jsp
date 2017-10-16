<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page errorPage="error.jsp" %>
<html>
<head>
    <title>Добавить новую заметку</title>
    <style>
        .main_tables {
            background-color: #ffffff
        }

        a {
            text-decoration: none;
        }
    </style>
</head>
<body  bgcolor="#90ee90">
<div align="center">
    <form:form action="${pageContext.request.contextPath}/${postPath}" method="post" modelAttribute="noteObj"
               acceptCharset="utf-8">
        <table class="main_tables" width="50%">
            <form:hidden path="id"/>
            <tr>
                <td><b>Название</b></td>
                <td><form:input path="name" maxlength="45"/></td>
            </tr>
            <tr>
                <td><b>Описание</b></td>
                <td><form:textarea path="description" rows="40" cols="160" maxlength="150"/></td>
            </tr>
            <tr>
                <td><b>Выполнено</b></td>
                <td><form:checkbox path="done"/></td>
            </tr>
            <tr>
                <form:hidden path="createdDate"/>
            </tr>
            <tr>
                <th colspan="2">
                    <input type="submit" value="Сохранить"/>
                </th>
            </tr>
        </table>
    </form:form>
</div>
</body>
</html>
