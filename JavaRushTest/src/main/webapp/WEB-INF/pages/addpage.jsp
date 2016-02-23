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

<h2>Create New User</h2>
<c:url var="saveUrl" value="/add" />
<form:form modelAttribute="userAttribute" method="POST" action="${saveUrl}">
    <table>
<%--        <tr>
            <td><form:label path="id">ID:</form:label></td>
            <td><form:input path="id"/></td>
        </tr>--%>
        <tr>
            <td><form:label path="name">Name:</form:label></td>
            <td><form:input path="name"/></td>
        </tr>

        <tr>
            <td><form:label path="age">Age</form:label></td>
            <td><form:input path="age"/></td>
        </tr>

        <tr>
            <td><form:label path="isAdmin">Is Admin</form:label></td>
            <td><form:checkbox path="isAdmin"></form:checkbox></td>
        </tr>
        <tr>
<%--            <td><form:label path="createDate">Created</form:label></td>
            <td><form:input path="createDate" value='<%= new java.util.Date() %>'/></td>--%>
             <td></td><td>Created <%= new java.util.Date() %></td>
        </tr>

    </table>

    <input type="submit" value="Save" />
</form:form>

</body>
</html>
