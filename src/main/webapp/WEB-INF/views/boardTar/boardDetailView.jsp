<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="currentPage" value="${ requestScope.currentPage }"/>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title></title>

    <style>
        table {
            border-collapse: collapse;
            width: 40%;
            margin: auto;
        }

        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        td:first-child {
            font-weight: bold;
        }

        button {
            -moz-appearance: none;
            -webkit-appearance: none;
            -ms-appearance: none;
            appearance: none;
            -moz-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
            -webkit-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
            -ms-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
            transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
            background-color: transparent;
            border-radius: 0.375em;
            border: 0;
            box-shadow: inset 0 0 0 2px #f56a6a;
            color: #f56a6a !important;
            cursor: pointer;
            display: inline-block;
            font-family: "Roboto Slab", serif;
            font-size: 0.8em;
            font-weight: 700;
            height: 3.5em;
            letter-spacing: 0.075em;
            line-height: 3.5em;
            padding: 0 2.25em;
            text-align: center;
            text-decoration: none;
            text-transform: uppercase;
            white-space: nowrap;
        }


        a {
            background-color: #008CBA;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            margin: 4px 2px;
            cursor: pointer;
        }

    </style>

</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp"/>
<br>
<br>
<form action="tarboard.do" method="post" enctype="multipart/form-data">
    <input type="hidden" name="appid" value="${appid}">


</form>
<br>
<br>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>