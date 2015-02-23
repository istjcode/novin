<meta dir="rtl" charset="utf-8">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@
        page import="java.sql.* ,javax.servlet.*,java.io.*,java.util.*"
        %>
<html>
<body>
<jsp:include page="header.jsp"/>
<div style="background-image: url('SoftBAck2.jpg'); height: 80%;width: 100%">
    <form id="loginForm" name="loginForm" method="post" action="novin.jsp">
        <table align="center" dir="rtl">
            <tr>
                <td></td>
                <td><input type="text" id="userName" name="userName"></td>
                <td></td>
                <td><input type="password" id="password" name="password"></td>
            </tr>
            <tr>
                <td><input type="submit" id="loginSubmit" name="loginSubmit" value="ورود"></td>
            </tr>
        </table>
    </form>
    </div>
<jsp:include page="footer.jsp"/>