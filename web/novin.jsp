<meta dir="rtl" charset="utf-8">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@
        page import="java.sql.* ,javax.servlet.*,java.io.*,java.util.*"
        %>
<%@ page import="java.util.Date" %>
<%@ page import="utiles.UtilDate" %>
<%@ page import="sun.font.TrueTypeFont" %>
<link rel="stylesheet" href="calendar/js-persian-cal.css">
<script src="calendar/js-persian-cal.min.js"></script>
<html>
<head>
    <script>
        function currDate() {
        var d = new Date();
        todayJD = gregorian_to_jd( new Date().getFullYear(),  new Date().getMonth() + 1,  new Date().getDate() );
        document.getElementsByName('extraCurDate').value=jd_to_persian(gregorian_to_jd( new Date().getFullYear(),  new Date().getMonth() + 1,  new Date().getDate() ));
            alert(jd_to_persian(gregorian_to_jd( new Date().getFullYear(),  new Date().getMonth() + 1,  new Date().getDate() )));
        }
    </script>
</head>
<%
    request.setCharacterEncoding("UTF-8");
%>
<body>
<div >
<jsp:include page="header.jsp"/>
<div style="height: 100%;width: 10%;background-color: #fffaf0;float: right; ">
    <table align="center">
        <tr>
             <td></td>
        </tr>
        <tr>
            <td></td>
        </tr>
        <tr>
            <td>
                <%
                    String conURL = "jdbc:mysql://localhost:3306/novin?useUnicode=true&characterEncoding=utf8";

                    Connection con = null;

                    try {
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                    } catch (ClassNotFoundException e) {
                        e.printStackTrace();
                    }
                    try {
                        con = DriverManager.getConnection(conURL, "root", "root");
                    } catch (SQLException e) {

                    }
                    int curSerialNo = 1000;
                    String sql = "select * from factor f order by f.factor_no desc limit 1";
                    Statement st = null;
                    ResultSet rs = null;
                    try {
                        st = con.createStatement();
                        rs = st.executeQuery(sql);
                        if (rs.next()) {
                            curSerialNo = Integer.parseInt(rs.getString("factor_no"));
                            curSerialNo = curSerialNo + 1;
                        }
                        rs.close();
                        st.close();
                        con.close();
                    } catch (NullPointerException e) {
                        e.printStackTrace();
                    }
                    String curDate;
                    curDate= UtilDate.getCurrentShamsidate();
                %>
                <form id="factor" name="factor" action="factor.jsp" method="post">
                    <input type="hidden" id="serialNo" name="serialNo" value="<%=curSerialNo%>">
                    <input type="hidden" id="=extraCurDate" name="extraCurDate" value="<%=curDate%>" >
                    <a href="#" onclick="document.getElementById('factor').submit();"><img src="service.jpg"></a>
                </form>
                </td>
        </tr>
        <tr>
            <td><a href="warranty.jsp"><img src="customer-service.jpg"> </a></td>
        </tr>
        <tr>
            <td><a href="novinPhon.jsp"> <img src="Novin-Address-Book.jpg"></a></td>
        </tr>
        <tr>
            <td><a href="novinHelp.jsp"> <img src="symbol_help.png"></a></td>
        </tr>
    </table>
</div>
<div style="background-image: url('Back.jpg'); height: 100%;width: 90%; border: #000044;background-size: cover;overflow-y: scroll">

    <div style="border: #555555; background-size: cover;">

    </div>
    <div style="height: 100%;width: 90%;border: #555555 ;background-size: cover; " >
        <form id="factorSearchForm" name="factorSearchForm" action="novin.jsp" method="post" accept-charset="utf-8">
            <table align="center" dir="rtl" style="font-family: tahoma">
                <tr>
                    <td>شماره قبض :</td>
                    <td><input type="text" id="factorNoSearch" name="factorNoSearch"></td>
                    <td>صاحب دستگاه :</td>
                    <td><input type="text" id="productOwnerSearch" name="productOwnerSearch"></td>
                    <td>تلفن :</td>
                    <td><input type="text" id="telSearch" name="telSearch"></td>
                </tr>
                <tr>
                    <td>نام تعمیرکار :</td>
                    <td><input type="text" id="repairmanSearch" name="repairmanSearch"></td>
                    <td>مدل دستگاه :</td>
                    <td><input type="text" id="modelProductSearch" name="modelProductSearch"></td>
                    <td>سریال دستگاه :</td>
                    <td><input type="text" id="serialNoProductSearch" name="serialNoProductSearch"></td>
                </tr>
                <tr>
                    <td>تاریخ قبض از :</td>
                    <td><input type="text" id="fromFactorDateSearch" name="fromFactorDateSearch">
                        <input type="hidden" id="extraFromFactorDateSearch" name="extraFromFactorDateSearch"></td>
                    <td>تاریخ قبض تا :</td>
                    <td><input type="text" id="toFactorDateSearch" name="toFactorDateSearch">
                        <input type="hidden" id="extraToFactorDateSearch" name="extraToFactorDateSearch"></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>تاریخ گارانتی از :</td>
                    <td><input type="text" id="fromWarrantyDateSearch" name="fromWarrantyDateSearch">
                        <input type="hidden" id="extraFromWarrantyDateSearch" name="extraFromWarrantyDateSearch"></td>
                    <td>تاریخ گارانتی تا :</td>
                    <td><input type="text" id="toWarrantyDateSearch" name="toWarrantyDateSearch">
                        <input type="hidden" id="extraToWarrantyDateSearch" name="extraToWarrantyDateSearch"></td>
                    <td></td>
                    <td><a href="#" onclick="document.getElementById('factorSearchForm').submit()"><img src="search-icon.png"></a></td>
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
                String factorNoSearch=request.getParameter("factorNoSearch");
                String fromFactorDateSearch=request.getParameter("fromFactorDateSearch");
                String extraFromFactorDateSearch=request.getParameter("extraFromFactorDateSearch");
                String extraToFactorDateSearch=request.getParameter("extraToFactorDateSearch");
                String toFactorDateSearch=request.getParameter("toFactorDateSearch");
                String fromWarrantyDateSearch=request.getParameter("fromWarrantyDateSearch");
                String toWarrantyDateSearch=request.getParameter("toWarrantyDateSearch");
                String extraFromWarrantyDateSearch=request.getParameter("extraFromWarrantyDateSearch");
                String extraToWarrantyDateSearch=request.getParameter("extraToWarrantyDateSearch");
                String productOwnerSearch=request.getParameter("productOwnerSearch");
                String telSearch=request.getParameter("telSearch");
                String repairmanSearch=request.getParameter("repairmanSearch");
                String modelProductSearch=request.getParameter("modelProductSearch");
                String serialNoProductSearch=request.getParameter("serialNoProductSearch");
                String factorSql="";
                factorSql = "select * from factor f where f.factor_no like '%"+factorNoSearch+"%' and f.product_owner like '%"+productOwnerSearch+"%' and f.tel like '%"+telSearch+"%' and f.repairman like '%"+repairmanSearch+"%' and f.model like '%"
                        +modelProductSearch+"%' and f.serial_no like '%"+serialNoProductSearch+"%' and (f.factor_date >= '"+extraFromFactorDateSearch+"' or '"+extraFromFactorDateSearch+"' ='') and (f.factor_date <= '"+extraToFactorDateSearch+"' or '"+extraToFactorDateSearch+"' ='') and " +
                        " (f.warranty_date >= '"+extraFromWarrantyDateSearch+"' or '"+extraFromWarrantyDateSearch+"'='') and (f.warranty_date <= '"+extraToWarrantyDateSearch+"' or '"+extraToWarrantyDateSearch+"'='')";
                Statement factorStatement = null;
                ResultSet resultSet = null;
                ArrayList selected=new ArrayList();

                factorStatement=connection.createStatement();
                resultSet=factorStatement.executeQuery(factorSql);

        %>
        <table align="center" border="2" dir="rtl" >
            <thead style="background-color: #999999">
            <tr>
                <th></th>
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
                <th></th>
            </tr>
            </thead>
            <%
                int row=0;
                while (resultSet.next()) {
                    row = row+1;
            %>
            <form name="sendSelectedForm" id="sendSelectedForm" action="printTable.jsp" method="post" accept-charset="utf8">
            <tr style="background-color: white">
                <td>&nbsp;<input type="checkbox"  id="factorNoSelect" name="factorNoSelect" value="<%=resultSet.getString("factor_no")%>" > &nbsp;</td>
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
                            selected.add(resultSet.getString("factor_no"));

                        }

                        %>

                    <input type="hidden" id="ssId" name="ssId" value="<%=selected%>">
                    <%
                        String select[] = request.getParameterValues("factorNoSelect");
                    %>

                <input type="submit" id="sendSelectedSubmit" name="sendSelectedSubmit" value=""  style="background: url('50-Hot-Printer-icon.png');width: 50px;height: 50px">
            </form>

                <%
                        resultSet.close();
                        factorStatement.close();
                        connection.close();
                    } catch (NullPointerException e) {
                        e.printStackTrace();
                    }
                %>
            </tr>

        </table>
    </div>
    </div>

</div>
</body>
</html>
<script>
    var objCal1 = new AMIB.persianCalendar( 'fromFactorDateSearch',
            { extraInputID: "extraFromFactorDateSearch", extraInputFormat: "YYYY-MM-DD" }
    );
</script>
<script>
    var objCal1 = new AMIB.persianCalendar( 'toFactorDateSearch',
            { extraInputID: "extraToFactorDateSearch", extraInputFormat: "YYYY-MM-DD" }
    );
</script>
<script>
    var objCal1 = new AMIB.persianCalendar( 'fromWarrantyDateSearch',
            { extraInputID: "extraFromWarrantyDateSearch", extraInputFormat: "YYYY-MM-DD" }
    );
</script>
<script>
    var objCal1 = new AMIB.persianCalendar( 'toWarrantyDateSearch',
            { extraInputID: "extraToWarrantyDateSearch", extraInputFormat: "YYYY-MM-DD" }
    );
</script>
<script>
    var objCal1 = new AMIB.persianCalendar( jd_to_persian(gregorian_to_jd( new Date().getFullYear(),  new Date().getMonth() + 1,  new Date().getDate() )),
            { extraInputID: "extraCurDate", extraInputFormat: "YYYY-MM-DD" }
    );
</script>
<script>
    var d = new Date();
     todayJD = gregorian_to_jd( d.getFullYear(), d.getMonth() + 1, d.getDate() );
    document.getElementsByName('extraCurDate').value=todayJD;
</script>
