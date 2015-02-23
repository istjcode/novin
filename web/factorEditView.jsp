<meta dir="rtl" charset="utf-8" >
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@
        page import="java.io.PrintWriter ,java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement"
        %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<html>
<head>
    <script type="text/javascript">
        function printExternal() {
            printWindow = new Object();
            printWindow.window.location = "novinPrint.jsp";
            printWindow.window.print();
        }
    </script>
</head>
    <%
    request.setCharacterEncoding("UTF-8");
%>
<body style="font-family: tahoma">
<jsp:include page="header.jsp"/>
<div style="background-image: url('SoftBAck2.jpg'); height: 70%;width: 100%;overflow: scroll">
<form id="factorEditView" name="factorEditView" action="novinPrint.jsp" method="post">
<table align="center" dir="rtl">
    <tr>
        <td>شماره قبض:</td>
        <td><%=request.getParameter("factorNoUpdate")%></td>
        <td>تاریخ قبض:</td>
        <td><%=request.getParameter("factorDateUpdate")%></td>
        <td>صاحب دستگاه:</td>
        <td><%=request.getParameter("productOwnerUpdate")%></td>
        <td>تلفن:</td>
        <td><%=request.getParameter("telUpdate")%></td>
    </tr>
    <tr>
        <td>نام تعمیرکار:</td>
        <td><%=request.getParameter("repairmanUpdate")%></td>
        <td>مدل:</td>
        <td><%=request.getParameter("modelProductUpdate")%></td>
        <td>سریال دستگاه:</td>
        <td><%=request.getParameter("serialNoProductUpdate")%></td>
        <td>تاریخ گارانتی:</td>
        <td><%=request.getParameter("warrantyDateUpdate")%></td>
    </tr>
    <tr>
        <td>مدت گارانتی:</td>
        <td><%=request.getParameter("warrantyTermUpdate")%></td>
        <td>مبلغ کل:</td>
        <td><%=request.getParameter("totalAmountUpdate")%></td>
        <%
            String sling="";
            String battery="";
            String bag="";
            String memory="";
            String lens="";
            String lensCap="";
            String charger="";
            if(request.getParameterValues("accessoriesUpdate")!=null && !request.getParameterValues("accessoriesUpdate").equals("")){
                String[] accessories;
                accessories=request.getParameterValues("accessoriesUpdate");
                for(int i=0;i< accessories.length;i++) {
                    if(accessories[i].equals("sling"))
                        sling="sling";
                    if(accessories[i].equals("battery"))
                        battery="battery";
                    if(accessories[i].equals("bag"))
                        bag="bag";
                    if(accessories[i].equals("memory"))
                        memory="memory";
                    if(accessories[i].equals("lens"))
                        lens="lens";
                    if(accessories[i].equals("lensCap"))
                        lensCap="lensCap";
                    if(accessories[i].equals("charger"))
                        charger="charger";
                }
            }
        %>
        <td>لوازم جانبی:</td>
        <%
            if(sling.equals("sling")) {
        %>
        <td>بند</td>
        <% } %>
        <%
            if(battery.equals("battery"))  {
        %>
        <td>باطری</td>
        <% } %>
        <%
            if(bag.equals("bag")) {
        %>
        <td>کیف</td>
        <% } %>
        <%
            if(memory.equals("memory"))  {
        %>
        <td>حافظه</td>
        <% } %>

        <%
            if(lens.equals("lens"))   {
        %>
        <td>لنز</td>
        <% } %>

        <%
            if(lensCap.equals("lensCap"))   {
        %>
        <td>درب لنز</td>
        <% } %>

        <%
            if(charger.equals("charger"))   {
        %>
        <td>شارژر</td>
        <% } %>
    </tr>
    <tr>
        <td>موبایل:</td>
        <td><%=request.getParameter("mobileUpdate")%></td>
        <td>فرستنده:</td>
        <td><%=request.getParameter("senderUpdate")%></td>
    </tr>
</table>
<table align="center" dir="rtl">
    <tr>
        <td>عیوب به اظهار مشتری:</td>
        <td><%=request.getParameter("defects1Update")%></td>
    </tr>
    <tr>
        <td>عیوب به اظهار مشتری:</td>
        <td><%=request.getParameter("defects2Update")%></td>
    </tr>
    <tr>
        <td>عیوب به اظهار مشتری:</td>
        <td><%=request.getParameter("defects3Update")%></td>
    </tr>
    <tr>
        <td>عیوب به اظهار مشتری:</td>
        <td><%=request.getParameter("defects4Update")%></td>
    </tr>
    <tr>
        <td>شرح تعمیرات:</td>
        <td><%=request.getParameter("repairs1Update")%></td>
    </tr>
    <tr>
        <td>شرح تعمیرات:</td>
        <td><%=request.getParameter("repairs2Update")%></td>
    </tr>
    <tr>
        <td>شرح تعمیرات:</td>
        <td><%=request.getParameter("repairs3Update")%></td>
    </tr>
    <tr>
        <td>شرح تعمیرات:</td>
        <td><%=request.getParameter("repairs4Update")%></td>
    </tr>
</table>
<table dir="rtl" align="center">
    <tr>
        <td><a href="#" onclick="document.getElementById('factorEditView').submit();" target="_blank" style="width: 10px;height: 20px"><img src="50-Hot-Printer-icon.png"></a></td>
        <td><a href="novin.jsp"><img src="50-Places-user-home-icon.png"></a></td>
    </tr>
</table>
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
    int id=0;
    if(request.getParameter("factorId") !=null)
        id = Integer.parseInt(request.getParameter("factorId"));
    request.setCharacterEncoding("utf-8");
    String factorNoUpdate = request.getParameter("factorNoUpdate");
    String factorDateUpdate = request.getParameter("factorDateUpdate");
    String extraFactorDateUpdate = request.getParameter("extraFactorDateUpdate");
    if(extraFactorDateUpdate==null || extraFactorDateUpdate.equals("")) {
        Date factorDate=new Date();
        extraFactorDateUpdate=new SimpleDateFormat("yyyy-MM-dd").format(factorDate);
    }
    String productOwnerUpdate = request.getParameter("productOwnerUpdate");
    String telUpdate = request.getParameter("telUpdate");
    String repairmanUpdate = request.getParameter("repairmanUpdate");
    String modelProductUpdate = request.getParameter("modelProductUpdate");
    String serialNoProductUpdate = request.getParameter("serialNoProductUpdate");
    String warrantyDateUpdate = request.getParameter("warrantyDateUpdate");
    String extraWarrantyDateUpdate = request.getParameter("extraWarrantyDateUpdate");
    String exitDateUpdate=request.getParameter("exitDateUpdate");
    String extraExitDateUpdate=request.getParameter("extraExitDateUpdate");
    int warrantyTermUpdate = 0;
    if (request.getParameter("warrantyTermUpdate") != null)
        if( !request.getParameter("warrantyTermUpdate").equals(""))
            warrantyTermUpdate = Integer.parseInt(request.getParameter("warrantyTermUpdate"));
    String totalAmountUpdate = request.getParameter("totalAmountUpdate");
    String mobileUpdate = request.getParameter("mobileUpdate");
    String senderUpdate = request.getParameter("senderUpdate");
    String[] accessoriesUpdate = request.getParameterValues("accessoriesUpdate");
    String defects1Update = request.getParameter("defects1Update");
    String defects2Update = request.getParameter("defects2Update");
    String defects3Update = request.getParameter("defects3Update");
    String defects4Update = request.getParameter("defects4Update");
    String repairs1Update = request.getParameter("repairs1Update");
    String repairs2Update = request.getParameter("repairs2Update");
    String repairs3Update = request.getParameter("repairs3Update");
    String repairs4Update = request.getParameter("repairs4Update");
    String statusUpdate=request.getParameter("statusUpdate");
    String factorUpdateSql = "update factor set factor_no=?,factor_date=?,total_amount=?,product_owner=?,tel=?,repairman=?,model=?,serial_no=?,accessories=?,warranty_date=?,warranty_term=?,defects1=?,defects2=?,defects3=?,defects4=?,repairs1=?,repairs2=?,repairs3=?,repairs4=?,factor_date_string=?,warranty_date_string=?,exit_date=?,exit_date_string=?,status=?,mobile=?,sender=?  where id="+id;
    try {
        PreparedStatement factorStatement = connection.prepareStatement(factorUpdateSql);
        factorStatement.setString(1, factorNoUpdate);
        if(extraFactorDateUpdate.equals("")){
            factorStatement.setString(2,null);
        } else {
            factorStatement.setString(2, extraFactorDateUpdate);
        }
        factorStatement.setString(3, totalAmountUpdate);
        factorStatement.setString(4, productOwnerUpdate);
        factorStatement.setString(5, telUpdate);
        factorStatement.setString(6, repairmanUpdate);
        factorStatement.setString(7, modelProductUpdate);
        factorStatement.setString(8, serialNoProductUpdate);
        ArrayList accessoriesUp=new ArrayList();
        if(accessoriesUpdate!=null){
            for (int i = 0; i < accessoriesUpdate.length; i++)
                accessoriesUp.add(accessoriesUpdate[i]);
            factorStatement.setString(9,  String.valueOf(accessoriesUp));
        } else {
            factorStatement.setString(9, String.valueOf(accessoriesUpdate));
        }
        if(extraWarrantyDateUpdate!=null){
            if(extraWarrantyDateUpdate.equals("")){
                factorStatement.setString(10,null);
            } else {
                factorStatement.setString(10, extraWarrantyDateUpdate);
            }
        } else {
            factorStatement.setString(10,null);
        }
        factorStatement.setInt(11, warrantyTermUpdate);
        factorStatement.setString(12, defects1Update);
        factorStatement.setString(13, defects2Update);
        factorStatement.setString(14, defects3Update);
        factorStatement.setString(15, defects4Update);
        factorStatement.setString(16, repairs1Update);
        factorStatement.setString(17, repairs2Update);
        factorStatement.setString(18, repairs3Update);
        factorStatement.setString(19, repairs4Update);
        factorStatement.setString(20, factorDateUpdate);
        factorStatement.setString(21, warrantyDateUpdate);
        factorStatement.setString(23, exitDateUpdate);
        if(extraExitDateUpdate!=null) {
            if(extraExitDateUpdate.equals("")){
                factorStatement.setString(22,null);
            } else {
                factorStatement.setString(22, extraExitDateUpdate);
            }
        }  else {
            factorStatement.setString(22,null);
        }
        factorStatement.setString(24, statusUpdate);
        factorStatement.setString(25, mobileUpdate);
        factorStatement.setString(26, senderUpdate);
        int customerSt = factorStatement.executeUpdate();
        if(customerSt != 0) {

        } else {

        }
        %>
<input type="hidden" id="factorNoUpdate" name="factorNoUpdate" value="<%=request.getParameter("factorNoUpdate")%>">
<input type="hidden" id="factorDateUpdate" name="factorDateUpdate" value="<%=request.getParameter("factorDateUpdate")%>">
<input type="hidden" id="productOwnerUpdate" name="productOwnerUpdate" value="<%=request.getParameter("productOwnerUpdate")%>">
<input type="hidden" id="telUpdate" name="telUpdate" value="<%=request.getParameter("telUpdate")%>">
<input type="hidden" id="repairmanUpdate" name="repairmanUpdate" value="<%=request.getParameter("repairmanUpdate")%>">
<input type="hidden" id="modelProductUpdate" name="modelProductUpdate" value="<%=request.getParameter("modelProductUpdate")%>">
<input type="hidden" id="serialNoProductUpdate" name="serialNoProductUpdate" value="<%=request.getParameter("serialNoProductUpdate")%>">
<input type="hidden" id="warrantyDateUpdate" name="warrantyDateUpdate" value="<%=request.getParameter("warrantyDateUpdate")%>">
<input type="hidden" id="exitDateUpdate" name="exitDateUpdate" value="<%=request.getParameter("exitDateUpdate")%>">
<input type="hidden" id="warrantyTermUpdate" name="warrantyTermUpdate" value="<%=request.getParameter("warrantyTermUpdate")%>">
<input type="hidden" id="totalAmountUpdate" name="totalAmountUpdate" value="<%=request.getParameter("totalAmountUpdate")%>">
<input type="hidden" id="mobileUpdate" name="mobileUpdate" value="<%=request.getParameter("mobileUpdate")%>">
<input type="hidden" id="senderUpdate" name="senderUpdate" value="<%=request.getParameter("senderUpdate")%>">
<input type="hidden" id="slingAccessoriesUpdate" name="slingAccessoriesUpdate" value="<%=sling%>">
<input type="hidden" id="bagAccessoriesUpdate" name="bagAccessoriesUpdate" value="<%=bag%>">
<input type="hidden" id="batteryAccessoriesUpdate" name="batteryAccessoriesUpdate" value="<%=battery%>">
<input type="hidden" id="memoryAccessoriesUpdate" name="memoryAccessoriesUpdate" value="<%=memory%>">
<input type="hidden" id="lensAccessoriesUpdate" name="lensAccessoriesUpdate" value="<%=lens%>">
<input type="hidden" id="lensCapAccessoriesUpdate" name="lensCapAccessoriesUpdate" value="<%=lensCap%>">
<input type="hidden" id="chargerAccessoriesUpdate" name="chargerAccessoriesUpdate" value="<%=charger%>">
<input type="hidden" id="defects1Update" name="defects1Update" value="<%=request.getParameter("defects1Update")%>">
<input type="hidden" id="defects2Update" name="defects2Update" value="<%=request.getParameter("defects2Update")%>">
<input type="hidden" id="defects3Update" name="defects3Update" value="<%=request.getParameter("defects3Update")%>">
<input type="hidden" id="defects4Update" name="defects4Update" value="<%=request.getParameter("defects4Update")%>">
<input type="hidden" id="repairs1Update" name="repairs1Update" value="<%=request.getParameter("repairs1Update")%>">
<input type="hidden" id="repairs2Update" name="repairs2Update" value="<%=request.getParameter("repairs2Update")%>">
<input type="hidden" id="repairs3Update" name="repairs3Update" value="<%=request.getParameter("repairs3Update")%>">
<input type="hidden" id="repairs4Update" name="repairs4Update" value="<%=request.getParameter("repairs4Update")%>">
<input type="hidden" id="statusUpdate" name="statusUpdate" value="<%=request.getParameter("statusUpdate")%>">

</form>

<table align="center">
    <form id="primaryFactorEditView" name="primaryFactorEditView" action="primaryNovinPrint.jsp" method="post">
        <input type="hidden" id="pFactorNoUpdate" name="pFactorNoUpdate" value="<%=request.getParameter("factorNoUpdate")%>">
        <input type="hidden" id="pFactorDateUpdate" name="pFactorDateUpdate" value="<%=request.getParameter("factorDateUpdate")%>">
        <input type="hidden" id="pProductOwnerUpdate" name="pProductOwnerUpdate" value="<%=request.getParameter("productOwnerUpdate")%>">
        <input type="hidden" id="pTelUpdate" name="pTelUpdate" value="<%=request.getParameter("telUpdate")%>">
        <input type="hidden" id="pRepairmanUpdate" name="pRepairmanUpdate" value="<%=request.getParameter("repairmanUpdate")%>">
        <input type="hidden" id="pModelProductUpdate" name="pModelProductUpdate" value="<%=request.getParameter("modelProductUpdate")%>">
        <input type="hidden" id="pSerialNoProductUpdate" name="pSerialNoProductUpdate" value="<%=request.getParameter("serialNoProductUpdate")%>">
        <input type="hidden" id="pMobileUpdate" name="pMobileUpdate" value="<%=request.getParameter("mobileUpdate")%>">
        <input type="hidden" id="pSenderUpdate" name="pSenderUpdate" value="<%=request.getParameter("senderUpdate")%>">
        <input type="hidden" id="pSlingAccessoriesUpdate" name="pSlingAccessoriesUpdate" value="<%=sling%>">
        <input type="hidden" id="pBagAccessoriesUpdate" name="pBagAccessoriesUpdate" value="<%=bag%>">
        <input type="hidden" id="pBatteryAccessoriesUpdate" name="pBatteryAccessoriesUpdate" value="<%=battery%>">
        <input type="hidden" id="pMemoryAccessoriesUpdate" name="pMemoryAccessoriesUpdate" value="<%=memory%>">
        <input type="hidden" id="pLensAccessoriesUpdate" name="pLensAccessoriesUpdate" value="<%=lens%>">
        <input type="hidden" id="pLensCapAccessoriesUpdate" name="pLensCapAccessoriesUpdate" value="<%=lensCap%>">
        <input type="hidden" id="pChargerAccessoriesUpdate" name="pChargerAccessoriesUpdate" value="<%=charger%>">
        <input type="hidden" id="pDefects1Update" name="pDefects1Update" value="<%=request.getParameter("defects1Update")%>">
        <input type="hidden" id="pDefects2Update" name="pDefects2Update" value="<%=request.getParameter("defects2Update")%>">
        <input type="hidden" id="pDefects3Update" name="pDefects3Update" value="<%=request.getParameter("defects3Update")%>">
        <input type="hidden" id="pDefects4Update" name="pDefects4Update" value="<%=request.getParameter("defects4Update")%>">
        <table>
            <tr>
                <td><a href="#" onclick="document.getElementById('primaryFactorEditView').submit();" target="_blank" style="width: 10px;height: 20px"><img src="primary_printer.png"></a></td>
            </tr>
        </table>
    </form>
    </table>


<%
        factorStatement.close();
        connection.close();
    } catch (NullPointerException e) {
        e.printStackTrace();
    }
%>
</div>