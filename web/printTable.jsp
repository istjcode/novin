<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript">
        document.forms.selectedItems.submit();
    </script>
</head>
<body>
 <%
     String selected[]=null;
     List selectedItems=new ArrayList();
     if (request.getParameterValues("factorNoSelect") != null) {
         selected = request.getParameterValues("factorNoSelect");
     } else {
         selected = request.getParameterValues("ssId");
     }
     for (int i = 0; i < selected.length; i++) {
         selectedItems.add(selected[i]);
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
     String sql="";
     sql="select * from factor f where f.factor_no in("+selectedItems+")";
     sql=sql.replace("[","");
     sql=sql.replace("]","");
     Statement factorStatement = null;
     ResultSet resultSet = null;
     factorStatement=connection.createStatement();
     resultSet=factorStatement.executeQuery(sql);
 %>
 <form id="selectedItems" name="selectedItems" action="printTable.jsp" method="post" onsubmit="document.forms.selectedItems.submit();">
 <table align="center" border="2" dir="rtl" >
     <thead style="background-color: #999999">
     <tr>
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
             <% }
                   %>
         </tr>
     <%
         }
     %>
     </table>

     </form>
<table>
    <tr>
        <td><a href="novin.jsp"><img src="50-Places-user-home-icon.png"></a></td>
    </tr>
</table>
</body>
</html>