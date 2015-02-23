<meta dir="rtl" charset="utf-8">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@
        page import="java.sql.* ,javax.servlet.*,java.io.*,java.util.*"
        %>
<html>
<%
    request.setCharacterEncoding("UTF-8");
%>
<body>
<jsp:include page="header.jsp"/>
<div style="height: 100%;width: 10%;background-color: #fffaf0;float: right; "></div>
<div style="background-image: url('Back.jpg'); height: 100%;width: 90%; border: #000044;background-size: cover">
    <form id="novinLogin" name="novinLogin" action="loginCheck.jsp" method="post">
        <table align="center" dir="rtl">
            <tr>
                <td>نام کاربری</td>
                <td><input type="text" id="novinUserName" name="novinUserName"> </td>
            </tr>
            <tr>
                <td>رمز</td>
                <td><input type="password" id="novinPass" name="novinPass"></td>
            </tr>
            <tr>
                <td><input type="submit" id="novinLoginSubmit" name="novinLoginSubmit" value="ورود"> </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>