<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Group Hub</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <h1 class="my-4">Welcome to the Group Hub</h1>

    <h2>Create a New Group</h2>
    <form action="createGroup" method="post">
        <div class="form-group">
            <label for="groupName">Group Name:</label>
            <input type="text" class="form-control" id="groupName" name="groupName" required>
        </div>
        <button type="submit" class="btn btn-primary">Create Group</button>
    </form>

    <h2 class="my-4">Existing Groups</h2>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th scope="col">Group Name</th>
            <th scope="col">Members</th>
            <th scope="col">Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="group" items="${groups}">
            <tr>
                <td>${group.name}</td>
                <td>${group.members.size()}</td>
                <td>
                    <a href="joinGroup?groupId=${group.id}" class="btn btn-success">Join</a>
                    <a href="viewGroup?groupId=${group.id}" class="btn btn-primary">View</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>


