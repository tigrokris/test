<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All users.</title>
</head>
<body>
<h1>Users</h1>

<h4>Find user by name.</h4>
<form method="POST" action="/find">
    <input type="text" name="name"/>
    <input class="btn-default btn btn1" type="submit" name="submit"
           value="Find">
</form>

<c:url var="addUrl" value="/add"/>
<table style="border: 1px solid; width: 500px; text-align:center">
    <thead style="background:#fcf">
    <tr>
        <th>id</th>
        <th>name</th>
        <th>age</th>
        <th>is admin</th>
        <th>created</th>
        <th>
            <button><a href="${addUrl}">Add</a></button>
        </th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${users}" var="user">
        <c:url var="editUrl" value="/edit?id=${user.id}"/>
        <c:url var="deleteUrl" value="/delete?id=${user.id}"/>
        <tr>
            <td><c:out value="${user.id}"/></td>
            <td><c:out value="${user.name}"/></td>
            <td><c:out value="${user.age}"/></td>
            <td><c:out value="${user.isAdmin}"/></td>
            <td><c:out value="${user.createDate}"/></td>
            <td><a href="${editUrl}">Edit</a></td>
            <td><a href="${deleteUrl}">Delete</a></td>
        </tr>

    </c:forEach>
    </tbody>
</table>
<div class="pagination">
    <ul>
        <li><c:forEach begin="${startpage}" end="${endpage}" var="p"><a href="<c:url value="/" ><c:param name="page" value="${p}"/>${p}</c:url>">${p}</a></c:forEach></li>
    </ul>
</div>
<c:if test="${empty users}">
    There are currently no users in the list. <a href="${addUrl}">Add</a> a user.<br>
</c:if>

</body>
</html>
