<meta dir="rtl" charset="utf-8">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@
        page import="java.sql.* ,javax.servlet.*,java.io.*,java.util.*"
        %>
<%@ page import="java.util.Date" %>
<%@ page import="utiles.UtilDate" %>
<html>
<body>
<%--<div>--%>
    <%--<jsp:include page="header.jsp"/>--%>
<%--</div>--%>
<div style="background-image: url('SoftBAck2.jpg'); height: 100%;width: 100%;overflow: scroll">
    <form id="warrantyForm" name="warrantyForm" method="post" action="warranty.jsp">
        <table align="center" dir="rtl" style="font-family: tahoma">
            <tr>
                <td>شماره قبض :</td>
                <td><input type="text" id="factorNoWarrantySearch" name="factorNoWarrantySearch"></td>
                <td><a href="#" onclick="document.getElementById('warrantyForm').submit()"><img src="search-icon.png"></a></td>
                <td><a href="novin.jsp"><img src="50-Places-user-home-icon.png"></a></td>
            </tr>
            </table>
    </form>
<%
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
        request.setCharacterEncoding("UTF-8");
        String factorNoWarrantySearch=request.getParameter("factorNoWarrantySearch");
        String warrantySql="select * from factor f where f.factor_no like '%"+factorNoWarrantySearch+"%'";
        Statement warrantyStatement = null;
        ResultSet resultSet = null;

        warrantyStatement=connection.createStatement();
        resultSet=warrantyStatement.executeQuery(warrantySql);
        %>
    <table align="center" border="2" dir="rtl" >
        <thead style="background-color: #999999">
        <tr>
            <th>ردیف</th>
            <th>شماره قبض</th>
            <th>تاریخ قبض</th>
            <th>نام صاحب دستگاه</th>
            <th>تلفن</th>
            <th>نام تعمیرکار</th>
            <th>مدل دستگاه</th>
            <th>سریال دستگاه</th>
            <th>تاریخ خروج</th>
            <th>مبلغ کل</th>
            <th>وضیت</th>
        </tr>
        </thead>
            <%
                int row=0;
                while (resultSet.next()) {
                    row = row+1;
            %>
        <tr style="background-color: white">
            <td>&nbsp;<%=row%>&nbsp;</td>
            <td>&nbsp;<%=resultSet.getString("factor_no")%>&nbsp;</td>
            <td>&nbsp;<%=resultSet.getString("factor_date_string")%>&nbsp;</td>
            <td>&nbsp;<%=resultSet.getString("product_owner")%>&nbsp;</td>
            <td>&nbsp;<%=resultSet.getString("tel")%>&nbsp;</td>
            <td>&nbsp;<%=resultSet.getString("repairman")%>&nbsp;</td>
            <td>&nbsp;<%=resultSet.getString("model")%>&nbsp;</td>
            <td>&nbsp;<%=resultSet.getString("serial_no")%>&nbsp;</td>
            <td>&nbsp;<%=resultSet.getString("exit_date_string")%>&nbsp;</td>
            <td>&nbsp;<%=resultSet.getString("total_amount")%>&nbsp;</td>
                <% if(resultSet.getString("status")!=null) { %>
            <td>&nbsp;<%=resultSet.getString("status")%>&nbsp;</td>
                <% } else { %>
            <td>&nbsp;</td>
                <% }%>
            <td>
                <form name="sendForm" id="sendForm" action="factorEdit.jsp" method="post" accept-charset="utf8">
                    <input type="hidden" id="sId" name="sId" value="<%=resultSet.getString("id")%>">
                    <input type="hidden" id="sFactorNo" name="sFactorNo" value="<%= resultSet.getString("factor_no")%>">
                    <input type="hidden" id="sFactorDate" name="sFactorDate" value="<%= resultSet.getString("factor_date_string")%>">
                    <input type="hidden" id="sFactorDateString" name="sFactorDateString" value="<%= resultSet.getString("factor_date_string")%>">
                    <input type="hidden" id="sTel" name="sTel" value="<%= resultSet.getString("tel")%>">
                    <input type="hidden" id="sRepairman" name="sRepairman" value="<%= resultSet.getString("repairman")%>">
                    <input type="hidden" id="sModel" name="sModel" value="<%= resultSet.getString("model")%>">
                    <input type="hidden" id="sSerialNo" name="sSerialNo" value="<%= resultSet.getString("serial_no")%>">
                    <input type="hidden" id="sAccessories" name="sAccessories" value="<%= resultSet.getString("accessories")%>">
                    <input type="hidden" id="sTotalAmount" name="sTotalAmount" value="<%= resultSet.getString("total_amount")%>">
                    <input type="hidden" id="sWarrantyDate" name="sWarrantyDate" value="<%= resultSet.getString("warranty_date_string")%>">
                    <input type="hidden" id="sWarrantyDateString" name="sWarrantyDateString" value="<%= resultSet.getString("warranty_date_string")%>">
                    <input type="hidden" id="sWarrantyTerm" name="sWarrantyTerm" value="<%= resultSet.getInt("warranty_term")%>">
                    <input type="hidden" id="sExitDate" name="sExitDate" value="<%= resultSet.getInt("exit_date")%>">
                    <input type="hidden" id="sExitDateString" name="sExitDateString" value="<%= resultSet.getString("exit_date_string")%>">
                    <input type="hidden" id="sDefects1" name="sDefects1" value="<%= resultSet.getString("defects1")%>">
                    <input type="hidden" id="sDefects2" name="sDefects2" value="<%= resultSet.getString("defects2")%>">
                    <input type="hidden" id="sDefects3" name="sDefects3" value="<%= resultSet.getString("defects3")%>">
                    <input type="hidden" id="sDefects4" name="sDefects4" value="<%= resultSet.getString("defects4")%>">
                    <input type="hidden" id="sRepairs1" name="sRepairs1" value="<%= resultSet.getString("repairs1")%>">
                    <input type="hidden" id="sRepairs2" name="sRepairs2" value="<%= resultSet.getString("repairs2")%>">
                    <input type="hidden" id="sRepairs3" name="sRepairs3" value="<%= resultSet.getString("repairs3")%>">
                    <input type="hidden" id="sRepairs4" name="sRepairs4" value="<%= resultSet.getString("repairs4")%>">
                    <input type="hidden" id="sProductOwner" name="sProductOwner" value="<%= resultSet.getString("product_owner")%>">
                    <input type="hidden" id="sStatus" name="sStatus" value="<%= resultSet.getString("status")%>">
                    <input type="hidden" id="sMobile" name="sMobile" value="<%= resultSet.getString("mobile")%>">
                    <input type="hidden" id="sSender" name="sSender" value="<%= resultSet.getString("sender")%>">
                    <input type="submit" id="sendSubmit" name="sendSubmit" value=""  style="background: url('30-Files-Edit-file-icon.png');width: 40px;height: 30px">
                </form>
            </td>
    <%
     }
                        resultSet.close();
                        warrantyStatement.close();
                        connection.close();
                    } catch (NullPointerException e) {
                        e.printStackTrace();
                    }
        %>
</div>
</body>
</html>