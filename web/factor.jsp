<meta dir="rtl" charset="utf-8" >
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@
        page import="java.sql.* ,javax.servlet.*,java.io.*,java.util.*"
        %>
<%@ page import="java.util.Date" %>
<link rel="stylesheet" href="calendar/js-persian-cal.css">
<script src="calendar/js-persian-cal.min.js"></script>
<html>
<%
    request.setCharacterEncoding("UTF-8");
%>
<body>
<jsp:include page="header.jsp"/>
<div style="background-image: url('SoftBAck2.jpg'); height: 70%;width: 100%;overflow: scroll">
    <form id="factorAddForm" name="factorAddForm" action="factorView.jsp" method="post" dir="ltr">
        <table align="center" dir="rtl" style="font-family: tahoma">
            <tr>
                <td>شماره قبض :</td>
                <td><input type="text" id="factorNoAdd" name="factorNoAdd" value="<%=request.getParameter("serialNo")%>" ></td>
                <td>تاریخ قبض :</td>
                <td><input type="text" id="factorDateAdd" name="factorDateAdd" value="<%=request.getParameter("extraCurDate")%>">
                <input type="hidden" id="extraFactorDateAdd" name="extraFactorDateAdd"> </td>
                <td>نام تعمیرکار :</td>
                <td><input type="text" id="repairmanAdd" name="repairmanAdd"></td>
            </tr>
            <tr>
                <td>نام صاحب دستگاه :</td>
                <td><input type="text" id="productOwnerAdd" name="productOwnerAdd"></td>
                <td>موبایل :</td>
                <td><input type="tel" id="mobileAdd" name="mobileAdd"></td>
                <<td>تلفن :</td>
                <td><input type="tel" id="telAdd" name="telAdd"></td>
            </tr>
            <tr>
                <td>مدل دستگاه :</td>
                <td><input type="text" id="modelProductAdd" name="modelProductAdd"></td>
                <td>سریال دستگاه :</td>
                <td><input type="text" id="serialNoProductAdd" name="serialNoProductAdd"></td>
                <td>مبلغ کل :</td>
                <td><input type="text" id="totalAmountAdd" name="totalAmountAdd"></td>
            </tr>
            <tr>
                <td>تاریخ گارانتی :</td>
                <td><input type="text" id="warrantyDateAdd" name="warrantyDateAdd">
                    <input type="hidden" id="extraWarrantyDateAdd" name="extraWarrantyDateAdd"> </td>
                <td>مدت گارانتی :</td>
                <td><input type="text" id="warrantyTermAdd" name="warrantyTermAdd"></td>
                <td>تاریخ خروج :</td>
                <td><input type="text" id="exitDateAdd" name="exitDateAdd">
                <input type="hidden" id="extraExitDateAdd" name="extraExitDateAdd"> </td>
            </tr>
            <tr>
                <td>فرستنده :</td>
                <td><input type="text" id="senderAdd" name="senderAdd"></td>
            </tr>
            <tr>
                <td>لوازم جانبی :</td>
            </tr>
            <tr>
                <td>بند<input type="checkbox" id="slingAccessoriesAdd" name="accessoriesAdd" value="sling"></td>
                <td>باطری<input type="checkbox" id="batteryAriesAdd" name="accessoriesAdd" value="battery"></td>
                <td>کیف<input type="checkbox" id="bagAccessoriesAdd" name="accessoriesAdd" value="bag"></td>
                <td>حافظه<input type="checkbox" id="memoryAccessoriesAdd" name="accessoriesAdd"value="memory"></td>
                <td>لنز<input type="checkbox" id="lensAccessoriesAdd" name="accessoriesAdd" value="lens"> </td>
                <td>درب لنز<input type="checkbox" id="lensCapAccessoriesAdd" name="accessoriesAdd" value="lensCap"></td>
                <td>شارژر<input type="checkbox" id="chargerAccessoriesAdd" name="accessoriesAdd" value="charger"></td>
            </tr>
            <tr>
                <td>وضعیت :</td>
            </tr>
            <tr>
                <td>ok<input type="radio" id="okAdd" name="statusAdd" value="ok"> </td>
                <td>nok<input type="radio" id="nokAdd" name="statusAdd" value="nok"> </td>
                <td>T<input type="radio" id="tAdd" name="statusAdd" value="T"> </td>
            </tr>
        </table>
        <table align="center" dir="rtl">
            <tr>
                <td>
                    <table align="center" dir="rtl" style="border: 2px solid black;font-family: tahoma;font-size: large">
                        <caption>عیوب به اظهار مشتری</caption>
                        <tr>
                            <td>1</td>
                            <td><input type="text" id="defects1Add" name="defects1Add" size="60"></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td><input type="text" id="defects2Add" name="defects2Add" size="60"></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td><input type="text" id="defects3Add" name="defects3Add" size="60"></td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td><input type="text" id="defects4Add" name="defects4Add" size="60"></td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table align="center" dir="rtl" style="border: 2px solid black;font-family: tahoma;font-size: large">
                        <caption>شرح تعمیرات</caption>
                        <tr>
                            <td>1</td>
                            <td><input type="text" id="repairs1Add" name="repairs1Add" size="60"></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td><input type="text" id="repairs2Add" name="repairs2Add" size="60"></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td><input type="text" id="repairs3Add" name="repairs3Add" size="60"></td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td><input type="text" id="repairs4Add" name="repairs4Add" size="60"></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table align="center" dir="rtl">
            <tr>
                <td><a href="#" onclick="document.getElementById('factorAddForm').submit()"><img src="50-Folder-Downloads-icon.png"></a></td>
                <td><a href="#" onclick="document.getElementById('factorAddForm').reset()"><img src="50-esc-icon.png"></a></td>
                <td><a href="novinPrint.jsp?factorNoAdd=<%=request.getParameter("factorNoAdd")%>&productOwnerAdd=<%=request.getParameter("productOwnerAdd")%>&factorDateAdd=<%=request.getParameter("factorDateAdd")%>&telAdd=<%=request.getParameter("telAdd")%>
                &repairmanAdd=<%=request.getParameter("repairmanAdd")%>&modelProductAdd=<%=request.getParameter("modelProductAdd")%>&serialNoProductAdd=<%=request.getParameter("serialNoProductAdd")%>&accessoriesAdd=<%=request.getParameter("accessoriesAdd")%>
                &defects1Add=<%=request.getParameter("defects1Add")%>&defects2Add=<%=request.getParameter("defects2Add")%>&defects3Add=<%=request.getParameter("defects3Add")%>&defects4Add=<%=request.getParameter("defects4Add")%>
                &repairs1Add=<%=request.getParameter("repairs1Add")%>&repairs2Add=<%=request.getParameter("repairs2Add")%>&repairs3Add=<%=request.getParameter("repairs3Add")%>&repairs4Add=<%=request.getParameter("repairs4Add")%>
                &warrantyDateAdd=<%=request.getParameter("warrantyDateAdd")%>&warrantyTermAdd=<%=request.getParameter("warrantyTermAdd")%>&totalAmountAdd=<%=request.getParameter("totalAmountAdd")%>&exitDateAdd=<%=request.getParameter("exitDateAdd")%>&statusAdd=<%=request.getParameter("statusAdd")%>&mobileAdd=<%=request.getParameter("mobileAdd")%>&senderAdd=<%=request.getParameter("senderAdd")%>)%>"><img  src="50-Hot-Printer-icon.png"></a></td>
                <td><a href="novin.jsp"><img src="50-Places-user-home-icon.png"></a></td>
            </tr>
        </table>
        </form>
    <%
        String connectionURL = "jdbc:mysql://localhost:3306/novin?useUnicode=true&characterEncoding=UTF-8";

        Connection connection = null;

        PrintWriter printWriter=response.getWriter();
        System.setProperty("file.encoding" , "UTF-8");
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            connection= DriverManager.getConnection(connectionURL, "root", "root");
        } catch (SQLException e) {

        }
        request.setCharacterEncoding("utf-8");
        String factorNoAdd = request.getParameter("factorNoAdd");
        String factorDateAdd = request.getParameter("factorDateAdd");
        String extraFactorDateAdd = request.getParameter("extraFactorDateAdd");
        String productOwnerAdd = request.getParameter("productOwnerAdd");
        String telAdd = request.getParameter("telAdd");
        String repairmanAdd = request.getParameter("repairmanAdd");
        String modelProductAdd = request.getParameter("modelProductAdd");
        String serialNoProductAdd = request.getParameter("serialNoProductAdd");
        String warrantyDateAdd = request.getParameter("warrantyDateAdd");
        String extraWarrantyDateAdd = request.getParameter("extraWarrantyDateAdd");
        String exitDateAdd=request.getParameter("exitDateAdd");
        String extraExitDateAdd=request.getParameter("extraExitDateAdd");
        int warrantyTermAdd = 0;
        if (request.getParameter("warrantyTermAdd") != null)
            if( !request.getParameter("warrantyTermAdd").equals(""))
            warrantyTermAdd = Integer.parseInt(request.getParameter("warrantyTermAdd"));
        String totalAmountAdd = request.getParameter("totalAmountAdd");
        String mobileAdd = request.getParameter("mobileAdd");
        String senderAdd = request.getParameter("senderAdd");
        String[] accessoriesAdd = request.getParameterValues("accessoriesAdd");
        String defects1Add = request.getParameter("defects1Add");
        String defects2Add = request.getParameter("defects2Add");
        String defects3Add = request.getParameter("defects3Add");
        String defects4Add = request.getParameter("defects4Add");
        String repairs1Add = request.getParameter("repairs1Add");
        String repairs2Add = request.getParameter("repairs2Add");
        String repairs3Add = request.getParameter("repairs3Add");
        String repairs4Add = request.getParameter("repairs4Add");
        String statusAdd=request.getParameter("statusAdd");
        String factorAddSql = "insert into factor  (FACTOR_NO,FACTOR_DATE,TOTAL_AMOUNT,PRODUCT_OWNER,TEL,REPAIRMAN,MODEL,SERIAL_NO,ACCESSORIES,WARRANTY_DATE,WARRANTY_TERM,DEFECTS1,DEFECTS2,DEFECTS3,DEFECTS4,REPAIRS1,REPAIRS2,REPAIRS3,REPAIRS4,FACTOR_DATE_STRING,WARRANTY_DATE_STRING,EXIT_DATE,EXIT_DATE_STRING,STATUS,MOBILE,SENDER) values (?, ? , ? , ? ,?, ? , ? , ?,?, ? , ?, ? , ? ,?, ? , ? , ?,?, ? ,?,?,?,?,?,?,?,?)";
        try {
        PreparedStatement factorStatement = connection.prepareStatement(factorAddSql);
        factorStatement.setString(1, factorNoAdd);
        if(extraFactorDateAdd==null)
            extraFactorDateAdd= String.valueOf(new Date());
        if(extraFactorDateAdd.equals("")){
            factorStatement.setString(2,null);
        } else {
            factorStatement.setString(2, extraFactorDateAdd);
        }
        factorStatement.setString(3, totalAmountAdd);
        factorStatement.setString(4, productOwnerAdd);
        factorStatement.setString(5, telAdd);
        factorStatement.setString(6, repairmanAdd);
        factorStatement.setString(7, modelProductAdd);
        factorStatement.setString(8, serialNoProductAdd);
        ArrayList accessories=new ArrayList();
        if (accessoriesAdd != null) {
            for (int i = 0; i < accessoriesAdd.length; i++) {
                accessories.add(accessoriesAdd[i]);
            }
            factorStatement.setString(9, String.valueOf(accessories));
        }
        if(extraWarrantyDateAdd.equals("")) {
            factorStatement.setString(10,null);
        } else {
        factorStatement.setString(10, extraWarrantyDateAdd);
        }
        factorStatement.setInt(11, warrantyTermAdd);
        factorStatement.setString(12, defects1Add);
        factorStatement.setString(13, defects2Add);
        factorStatement.setString(14, defects3Add);
        factorStatement.setString(15, defects4Add);
        factorStatement.setString(16, repairs1Add);
        factorStatement.setString(17, repairs2Add);
        factorStatement.setString(18, repairs3Add);
        factorStatement.setString(19, repairs4Add);
        factorStatement.setString(20, factorDateAdd);
        factorStatement.setString(21, warrantyDateAdd);
        factorStatement.setString(23, exitDateAdd);
        if(extraExitDateAdd.equals("")) {
            factorStatement.setString(22,null);
        } else {
            factorStatement.setString(22, extraExitDateAdd);
        }
        factorStatement.setString(24,exitDateAdd);
        factorStatement.setString(25,statusAdd);
        factorStatement.setString(26,mobileAdd);
        factorStatement.setString(27,senderAdd);
        int customerSt = factorStatement.executeUpdate();
        if(customerSt != 0) {

        } else {

        }
        factorStatement.close();
        connection.close();
        } catch (NullPointerException e) {
            e.printStackTrace();
        }
    %>
    </div>
</body>
</html>
<script>
    var objCal1 = new AMIB.persianCalendar( 'factorDateAdd',
            { extraInputID: "extraFactorDateAdd", extraInputFormat: "YYYY-MM-DD" }
    );
</script>
<script>
    var objCal1 = new AMIB.persianCalendar( 'warrantyDateAdd',
            { extraInputID: "extraWarrantyDateAdd", extraInputFormat: "YYYY-MM-DD" }
    );
</script>
<script>
    var objCal1 = new AMIB.persianCalendar( 'exitDateAdd',
            { extraInputID: "extraExitDateAdd", extraInputFormat: "YYYY-MM-DD" }
    );
</script>