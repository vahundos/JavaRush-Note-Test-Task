<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Notes</title>
    <style>
        .done {
            color: rgb(57, 156, 96)
        }

        .not_done {
            color: rgba(205, 37, 20, 0.5)
        }

        .main_tables {
            background-color: #ffffff
        }

        a {
            text-decoration: none;
        }
    </style>
</head>
<body bgcolor="#90ee90">
<div align="center">
    <table width="50%" class="main_tables">
        <tr>
            <th colspan="2">
                <h2>Список заметок</h2>
            </th>
        </tr>
        <tr>
            <th colspan="2">
                <form action="${pageContext.request.contextPath}/add-note" method="get">
                    <input type="submit" value="Добавить новую заметку"/>
                </form>
                <hr>
            </th>
        </tr>
        <tr>
        </tr>
        <tr>
            <th>
                Фильтрация
                <select id="filterType">
                    <c:forEach var="pair" items="${filterMap}">
                        <option value="${pair.key}" ${pair.key == currentFilter ? 'selected' : ''}>${pair.value}</option>
                    </c:forEach>
                </select>
            </th>
            <th>
                Сортировка
                <select id="sortType">
                    <c:forEach var="pair" items="${sortMap}">
                        <option value="${pair.key}" ${pair.key == currentSort ? 'selected' : ''}>${pair.value}</option>
                    </c:forEach>
                </select>
            </th>
        </tr>
        <tr>
            <th colspan="2">
                <input type="button" value="Применить" onclick="setCookie()">
                <script type="text/javascript">
                    setCookie = function () {
                        document.cookie = "filterType=" + document.getElementById("filterType").value;
                        document.cookie = "sort=" + document.getElementById("sortType").value;
                        location.reload(true);
                    }
                </script>
                <hr>
            </th>
        </tr>
    </table>
    <table width="50%" class="main_tables">
        <c:forEach var="note" items="${notes}">
            <tr>
                <td>
                    <table width="100%">
                        <tr>
                            <td>
                                <h2>${note.name}</h2>
                            </td>
                            <td>
                                <div align="right">
                                    <a href="/update-note?id=${note.id}">Редактировать</a>
                                    <a href="/remove-note?id=${note.id}">Удалить</a>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>${note.description}
                    <table width="100%">
                        <tr>
                            <td class="${note.done == true ? 'done' : 'not_done'}">
                                    ${note.done == true ? 'Выполнено' : 'Не выполнено'}
                            </td>
                            <td>
                                <div align="right">${note.createdDate.format(dateFormatter)}</div>
                            </td>
                        </tr>
                    </table>
                    <hr>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <th>
                <c:if test="${pageCount >= 1}">
                    Страницы:
                </c:if>
                <c:forEach var="page" begin="1" end="${pageCount}">
                    <a href="${pageContext.request.contextPath}/?page=${page}">${page} </a>
                </c:forEach>
            </th>
        </tr>
    </table>
</div>
</body>
</html>
