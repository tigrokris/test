<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
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
<c:if test="${empty users}">
    There are currently no users in the list. <a href="${addUrl}">Add</a> a user.<br>
</c:if>

<c:url var="mainUrl" value="/" />
<p>Return to <a href="${mainUrl}">Main List</a></p>
</body>
</html>
