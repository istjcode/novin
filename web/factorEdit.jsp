<meta dir="rtl" charset="utf-8" >
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@
        page import="java.sql.* ,javax.servlet.*,java.io.*,java.util.*"
        %>
<link rel="stylesheet" href="calendar/js-persian-cal.css">
<script src="calendar/js-persian-cal.min.js"></script>
<html>
<%
    request.setCharacterEncoding("UTF-8");
%>
<body>
<jsp:include page="header.jsp"/>
<div style="background-image: url('SoftBAck2.jpg'); height: 70%;width: 100%;overflow: scroll">

    <%
        String connectionURL = "jdbc:mysql://localhost:3306/novin?useUnicode=true&characterEncoding=utf8";

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
        %>

    <form id="factorUpdateForm" name="factorUpdateForm" action="factorEditView.jsp" method="post" dir="ltr" accept-charset="utf-8">
        <input type="hidden" id="factorId" name="factorId" value="<%=request.getParameter("sId")%>">
        <table align="center" dir="rtl" style="font-family: tahoma">
            <tr>
                <td>شماره قبض :</td>
                <td><input type="text" id="factorNoUpdate" name="factorNoUpdate" value="<%=request.getParameter("sFactorNo")%>"></td>
                <td>تاریخ قبض :</td>
                <td><input type="text" id="factorDateUpdate" name="factorDateUpdate" value="<%=request.getParameter("sFactorDateString")%>">
                <input type="hidden" id="extraFactorDateUpdate" name="extraFactorDateUpdate"></td>
                <td>نام تعمیرکار :</td>
                <td><input type="text" id="repairmanUpdate" name="repairmanUpdate" value="<%=request.getParameter("sRepairman")%>"></td>
            </tr>
            <tr>
                <td>صاحب دستگاه :</td>
                <td><input type="text" id="productOwnerUpdate" name="productOwnerUpdate" value="<%=request.getParameter("sProductOwner")%>"></td>
                <td>موبایل :</td>
                <td><input type="tel" id="mobileUpdate" name="mobileUpdate" value="<%=request.getParameter("sMobile")%>"></td>
                <td>تلفن :</td>
                <td><input type="text" id="telUpdate" name="telUpdate" value="<%=request.getParameter("sTel")%>"></td>
            </tr>
            <tr>
                <td>مدل دستگاه :</td>
                <td><input type="text" id="modelProductUpdate" name="modelProductUpdate" value="<%=request.getParameter("sModel")%>"></td>
                <td>سریال دستگاه :</td>
                <td><input type="text" id="serialNoProductUpdate" name="serialNoProductUpdate" value="<%=request.getParameter("sSerialNo")%>"></td>
                <td>مبلغ کل :</td>
                <td><input type="text" id="totalAmountUpdate" name="totalAmountUpdate" value="<%=request.getParameter("sTotalAmount")%>"></td>
            </tr>
            <tr>
                <td>تاریخ گارانتی :</td>
                <td><input type="text" id="warrantyDateUpdate" name="warrantyDateUpdate" value="<%=request.getParameter("sWarrantyDateString")%>">
                    <input type="hidden" id="extraWarrantyDateUpdate" name="extraWarrantyDateUpdate"> </td>
                <td>مدت گارانتی :</td>
                <td><input type="text" id="warrantyTermUpdate" name="warrantyTermUpdate" value="<%=request.getParameter("sWarrantyTerm")%>"></td>
                <td>تاریخ خروج :</td>
                <td><input type="text" id="exitDateUpdate" name="exitDateUpdate" value="<%=request.getParameter("sExitDateString")%>">
                <input type="hidden" id="extraExitDateUpdate" name="extraExitDateUpdate"></td>

            </tr>
            <tr>
                <td>فرستنده :</td>
                <td><input type="text" id="senderUpdate" name="senderUpdate" value="<%=request.getParameter("sSender")%>"> </td>
            </tr>
            <tr>
                <td>لوازم جانبی :</td>
            </tr>
            <%
                String sling="";
                String battery="";
                String bag="";
                String memory="";
                String lens="";
                String lensCap="";
                String charger="";
                if(request.getParameterValues("sAccessories")!=null && !request.getParameterValues("sAccessories").equals("")){
                List<String> accessories;
                String accessoriesSt=request.getParameter("sAccessories");
                accessoriesSt =accessoriesSt.replace("[","");
                accessoriesSt =accessoriesSt.replace("]","");
                 accessories=Arrays.asList(accessoriesSt.split("\\s*,\\s*"));
                 for(int i=0;i<accessories.size();i++) {
                     if(accessories.get(i).equals("sling"))
                         sling="sling";
                     if(accessories.get(i).equals("battery"))
                         battery="battery";
                     if(accessories.get(i).equals("bag"))
                         bag="bag";
                     if(accessories.get(i).equals("memory"))
                         memory="memory";
                     if(accessories.get(i).equals("lens"))
                         lens="lens";
                     if(accessories.get(i).equals("lensCap"))
                         lensCap="lensCap";
                     if(accessories.get(i).equals("charger"))
                         charger="charger";
                 }
                }
            %>
            <tr>
                <td>بند<input type="checkbox" id="slingAccessoriesUpdate" name="accessoriesUpdate"  <% if (sling.equals("sling")) {%> checked="" <% }%> value="sling"></td>
                <td>باطری<input type="checkbox" id="batteryAriesUpdate" name="accessoriesUpdate"  <% if (battery.equals("battery")) {%> checked="" <% }%> value="battery"> </td>
                <td>کیف<input type="checkbox" id="bagAccessoriesUpdate" name="accessoriesUpdate"  <% if (bag.equals("bag")) {%> checked="" <% }%> value="bag"> </td>
                <td>حافظه<input type="checkbox" id="memoryAccessoriesUpdate" name="accessoriesUpdate"  <% if (memory.equals("memory")) {%> checked="" <% }%> value="memory"> </td>
                <td>لنز<input type="checkbox" id="lensAccessoriesUpdate" name="accessoriesUpdate"  <% if (lens.equals("lens")) {%> checked="" <% }%> value="lens"> </td>
                <td>درب لنز<input type="checkbox" id="lensCapAccessoriesUpdate" name="accessoriesUpdate" <% if (lensCap.equals("lensCap")) {%> checked="" <% }%> value="lensCap"></td>
                <td>شارژر<input type="checkbox" id="chargerAccessoriesUpdate" name="accessoriesUpdate" <% if (charger.equals("charger")) {%> checked="" <% }%> value="charger"></td>
            </tr>
            <tr>
                <td>وضعیت :</td>
            </tr>
            <%
                String status="";
                if(request.getParameterValues("sStatus")!=null && !request.getParameterValues("sStatus").equals("")){
                    if(request.getParameter("sStatus").equals("ok"))
                        status="ok";
                    if(request.getParameter("sStatus").equals("nok"))
                        status="nok";
                    if(request.getParameter("sStatus").equals("T"))
                        status="T";
                }
            %>
            <tr>
                <td>ok<input type="radio" id="okAdd" name="statusUpdate" <% if (status.equals("ok")) {%> checked="" <% }%> value="ok"> </td>
                <td>nok<input type="radio" id="nokAdd" name="statusUpdate" <% if (status.equals("nok")) {%> checked="" <% }%> value="nok"> </td>
                <td>T<input type="radio" id="tAdd" name="statusUpdate" <% if (status.equals("T")) {%> checked="" <% }%> value="T"> </td>
            </tr>
        </table>
        <table align="center" dir="rtl">
            <tr>
                <td>
                    <table align="center" dir="rtl" style="border: 2px solid black;font-family: tahoma;font-size: large">
                        <caption>عیوب به اظهار مشتری</caption>
                        <tr>
                            <td>1</td>
                            <td><input type="text" id="defects1Update" name="defects1Update" size="60" value="<%=request.getParameter("sDefects1")%>"></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td><input type="text" id="defects2Update" name="defects2Update" size="60" value="<%=request.getParameter("sDefects2")%>"></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td><input type="text" id="defects3Update" name="defects3Update" size="60" value="<%=request.getParameter("sDefects3")%>"></td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td><input type="text" id="defects4Update" name="defects4Update" size="60" value="<%=request.getParameter("sDefects4")%>"></td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table align="center" dir="rtl" style="border: 2px solid black;font-family: tahoma;font-size: large">
                        <caption>شرح تعمیرات</caption>
                        <tr>
                            <td>1</td>
                            <td><input type="text" id="repairs1Update" name="repairs1Update" size="60" value="<%=request.getParameter("sRepairs1")%>"></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td><input type="text" id="repairs2Update" name="repairs2Update" size="60" value="<%=request.getParameter("sRepairs2")%>"></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td><input type="text" id="repairs3Update" name="repairs3Update" size="60" value="<%=request.getParameter("sRepairs3")%>"></td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td><input type="text" id="repairs4Update" name="repairs4Update" size="60" value="<%=request.getParameter("sRepairs4")%>"></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table align="center" dir="rtl">
            <tr>
                <td><a href="#" onclick="document.getElementById('factorUpdateForm').submit()"><img src="50-Folder-Downloads-icon.png"></a></td>
                <td><a href="#" onclick="document.getElementById('factorUpdateForm').reset()"><img src="50-esc-icon.png"></a></td>
                <td><a href="novin.jsp"><img src="50-Places-user-home-icon.png"></a></td>
            </tr>
        </table>
    </form>
    <%
        int id=0;
        if(request.getParameter("factorId") !=null)
            id = Integer.parseInt(request.getParameter("factorId"));
        String factorNoUpdate = request.getParameter("factorNoUpdate");
        String factorDateUpdate = request.getParameter("factorDateUpdate");
        String extraFactorDateUpdate = request.getParameter("extraFactorDateUpdate");
        String productOwnerUpdate = request.getParameter("productOwnerUpdate");
        String telUpdate = request.getParameter("telUpdate");
        String repairmanUpdate = request.getParameter("repairmanUpdate");
        String modelProductUpdate = request.getParameter("modelProductUpdate");
        String serialNoProductUpdate = request.getParameter("serialNoProductUpdate");
        String warrantyDateUpdate = request.getParameter("warrantyDateUpdate");
        String extraWarrantyDateUpdate = request.getParameter("extraWarrantyDateUpdate");
        String exitDateUpdate = request.getParameter("exitDateUpdate");
        String extraExitDateUpdate = request.getParameter("extraExitDateUpdate");
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
            PreparedStatement  factorStatement = null;
            if (connection != null) {
                factorStatement = connection.prepareStatement(factorUpdateSql);
            }
            factorStatement.setString(1, factorNoUpdate);
            if(extraFactorDateUpdate.equals("")) {
                factorStatement.setString(2,null);
            }else {
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
            if(extraExitDateUpdate!=null) {
            if(extraExitDateUpdate.equals("")){
                factorStatement.setString(22,null);
            } else {
                factorStatement.setString(22, extraExitDateUpdate);
            }
            }  else {
                factorStatement.setString(22,null);
            }
            factorStatement.setString(23,exitDateUpdate);
            factorStatement.setString(24, statusUpdate);
            factorStatement.setString(25, mobileUpdate);
            factorStatement.setString(26, senderUpdate);
            factorStatement.executeUpdate();
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
    var objCal1 = new AMIB.persianCalendar( 'factorDateUpdate',
            { extraInputID: "extraFactorDateUpdate", extraInputFormat: "YYYY-MM-DD" }
    );
</script>
<script>
    var objCal1 = new AMIB.persianCalendar( 'warrantyDateUpdate',
            { extraInputID: "extraWarrantyDateUpdate", extraInputFormat: "YYYY-MM-DD" }
    );
</script>
<script>
    var objCal1 = new AMIB.persianCalendar( 'exitDateUpdate',
            { extraInputID: "extraExitDateUpdate", extraInputFormat: "YYYY-MM-DD" }
    );
</script>