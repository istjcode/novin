<meta dir="rtl" charset="utf-8">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@
        page import="java.sql.* ,javax.servlet.*,java.io.*,java.util.*"
        %>
<html>
<body>
<%
    String novinUserName=request.getParameter("novinUserName");
    String novinPass=request.getParameter("novinPass");
    response.setContentType("text/html");
    if (novinUserName != null && novinPass != null) {
        if (!novinPass.equals("") && !novinUserName.equals("")) {
            if (novinUserName.equals("novin") && novinPass.equals("3681")) {
                session.setAttribute("novinUserName",novinPass);
                response.sendRedirect("novin.jsp");
            } else {
                String errMessage = "invalid";
                response.sendRedirect("novinLogin.jsp");
            }
        }
    }
    request.setCharacterEncoding("UTF-8");
    String connectionURL = "jdbc:mysql://localhost:3306/novin?useUnicode=true&characterEncoding=utf8";

    Connection connection = null;

    PrintWriter printWriter=response.getWriter();
    try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    try {
        connection= DriverManager.getConnection(connectionURL, "root", "root");
    } catch (SQLException e) {

    }
    try {
        String factorSql="";
            factorSql = "select * from factor f where f.warranty_date is null order by  f.factor_no desc limit 15";

        Statement factorStatement = null;
        ResultSet resultSet = null;

        factorStatement=connection.createStatement();
        resultSet=factorStatement.executeQuery(factorSql);
    } catch (NullPointerException e) {
        e.printStackTrace();
    }

%>
<form id="factorSearchForm" name="factorSearchForm" action="novin.jsp" method="post" accept-charset="utf-8">
    </form>
</body>
</html>