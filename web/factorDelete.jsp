<meta dir="rtl" charset="utf-8" >
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@
        page import="java.sql.* ,javax.servlet.*,java.io.*,java.util.*"
        %>
<link rel="stylesheet" href="calendar/js-persian-cal.css">
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

    <form id="factorDeleteForm" name="factorDeleteForm" action="novin.jsp" method="post" dir="ltr" accept-charset="utf-8">
        <input type="hidden" id="factorId" name="factorId" value="<%=request.getParameter("dId")%>">
        <table align="center" dir="rtl" style="font-family: tahoma">
            <tr>
                <td>شماره قبض :</td>
                <td><input type="text" id="factorNoDelete" name="factorNoDelete" value="<%=request.getParameter("dFactorNo")%>" readonly="true"></td>
                <td>تاریخ قبض :</td>
                <td><input type="text" id="factorDateDelete" name="factorDateDelete" value="<%=request.getParameter("dFactorDateString")%>" readonly="true">
                </td>
                <td>نام تعمیرکار :</td>
                <td><input type="text" id="repairmanDelete" name="repairmanDelete" value="<%=request.getParameter("dRepairman")%>" readonly="true"></td>
            </tr>
            <tr>
                <td>صاحب دستگاه :</td>
                <td><input type="text" id="productOwnerDelete" name="productOwnerDelete" value="<%=request.getParameter("dProductOwner")%>" readonly="true"></td>
                <td>موبایل :</td>
                <td><input type="tel" id="mobileDelete" name="mobileDelete" value="<%=request.getParameter("dMobile")%>" readonly="true"></td>
                <td>تلفن :</td>
                <td><input type="text" id="telDelete" name="telDelete" value="<%=request.getParameter("dTel")%>" readonly="true"></td>
            </tr>
            <tr>
                <td>مدل دستگاه :</td>
                <td><input type="text" id="modelProductDelete" name="modelProductDelete" value="<%=request.getParameter("dModel")%>" readonly="true"></td>
                <td>سریال دستگاه :</td>
                <td><input type="text" id="serialNoProductDelete" name="serialNoProductDelete" value="<%=request.getParameter("dSerialNo")%>" readonly="true"></td>
                <td>مبلغ کل :</td>
                <td><input type="text" id="totalAmountDelete" name="totalAmountDelete" value="<%=request.getParameter("dTotalAmount")%>" readonly="true"></td>
            </tr>
            <tr>
                <td>تاریخ گارانتی :</td>
                <td><input type="text" id="warrantyDateDelete" name="warrantyDateDelete" value="<%=request.getParameter("dWarrantyDateString")%>" readonly="true">
                  </td>
                <td>مدت گارانتی :</td>
                <td><input type="text" id="warrantyTermDelete" name="warrantyTermDelete" value="<%=request.getParameter("dWarrantyTerm")%>" readonly="true"></td>
                <td>تاریخ خروج :</td>
                <td><input type="text" id="exitDateDelete" name="exitDateDelete" value="<%=request.getParameter("dExitDateString")%>" readonly="true">
                </td>

            </tr>
            <tr>
                <td>فرستنده :</td>
                <td><input type="text" id="senderDelete" name="senderDelete" value="<%=request.getParameter("dSender")%>" readonly="true"> </td>
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
                if(request.getParameterValues("dAccessories")!=null && !request.getParameterValues("dAccessories").equals("")){
                List<String> accessories;
                String accessoriesSt=request.getParameter("dAccessories");
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
                <td>بند<input type="checkbox" id="slingAccessoriesDelete" name="accessoriesDelete"  <% if (sling.equals("sling")) {%> checked="" <% }%> value="sling" readonly="true"></td>
                <td>باطری<input type="checkbox" id="batteryAriesDelete" name="accessoriesDelete"  <% if (battery.equals("battery")) {%> checked="" <% }%> value="battery" readonly="true"> </td>
                <td>کیف<input type="checkbox" id="bagAccessoriesDelete" name="accessoriesDelete"  <% if (bag.equals("bag")) {%> checked="" <% }%> value="bag" readonly="true"> </td>
                <td>حافظه<input type="checkbox" id="memoryAccessoriesDelete" name="accessoriesDelete"  <% if (memory.equals("memory")) {%> checked="" <% }%> value="memory" readonly="true"> </td>
                <td>لنز<input type="checkbox" id="lensAccessoriesDelete" name="accessoriesDelete"  <% if (lens.equals("lens")) {%> checked="" <% }%> value="lens" readonly="true"> </td>
                <td>درب لنز<input type="checkbox" id="lensCapAccessoriesDelete" name="accessoriesDelete" <% if (lensCap.equals("lensCap")) {%> checked="" <% }%> value="lensCap" readonly="true"></td>
                <td>شارژر<input type="checkbox" id="chargerAccessoriesDelete" name="accessoriesDelete" <% if (charger.equals("charger")) {%> checked="" <% }%> value="charger" readonly="true"></td>
            </tr>
            <tr>
                <td>وضعیت :</td>
            </tr>
            <%
                String status="";
                if(request.getParameterValues("dStatus")!=null && !request.getParameterValues("dStatus").equals("")){
                    if(request.getParameter("dStatus").equals("ok"))
                        status="ok";
                    if(request.getParameter("dStatus").equals("nok"))
                        status="nok";
                    if(request.getParameter("dStatus").equals("T"))
                        status="T";
                }
            %>
            <tr>
                <td>ok<input type="radio" id="okAdd" name="statusDelete" <% if (status.equals("ok")) {%> checked="" <% }%> value="ok" readonly="true"> </td>
                <td>nok<input type="radio" id="nokAdd" name="statusDelete" <% if (status.equals("nok")) {%> checked="" <% }%> value="nok" readonly="true"> </td>
                <td>T<input type="radio" id="tAdd" name="statusDelete" <% if (status.equals("T")) {%> checked="" <% }%> value="T" readonly="true"> </td>
            </tr>
        </table>
        <table align="center" dir="rtl">
            <tr>
                <td>
                    <table align="center" dir="rtl" style="border: 2px solid black;font-family: tahoma;font-size: large">
                        <caption>عیوب به اظهار مشتری</caption>
                        <tr>
                            <td>1</td>
                            <td><input type="text" id="defects1Delete" name="defects1Delete" size="60" value="<%=request.getParameter("dDefects1")%>" readonly="true"></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td><input type="text" id="defects2Delete" name="defects2Delete" size="60" value="<%=request.getParameter("dDefects2")%>" readonly="true"></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td><input type="text" id="defects3Delete" name="defects3Delete" size="60" value="<%=request.getParameter("dDefects3")%>" readonly="true"></td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td><input type="text" id="defects4Delete" name="defects4Delete" size="60" value="<%=request.getParameter("dDefects4")%>" readonly="true"></td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table align="center" dir="rtl" style="border: 2px solid black;font-family: tahoma;font-size: large">
                        <caption>شرح تعمیرات</caption>
                        <tr>
                            <td>1</td>
                            <td><input type="text" id="repairs1Delete" name="repairs1Delete" size="60" value="<%=request.getParameter("dRepairs1")%>" readonly="true"></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td><input type="text" id="repairs2Delete" name="repairs2Delete" size="60" value="<%=request.getParameter("dRepairs2")%>" readonly="true"></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td><input type="text" id="repairs3Delete" name="repairs3Delete" size="60" value="<%=request.getParameter("dRepairs3")%>" readonly="true"></td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td><input type="text" id="repairs4Delete" name="repairs4Delete" size="60" value="<%=request.getParameter("dRepairs4")%>" readonly="true"></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table align="center" dir="rtl">
            <tr>
                <td><a href="#" onclick="document.getElementById('factorDeleteForm').submit()"><img src="50-delete-icon.png"></a></td>
                <td><a href="novin.jsp"><img src="50-Places-user-home-icon.png"></a></td>
            </tr>
        </table>
    </form>
    <%
        int id=0;
        if(request.getParameter("dId") !=null)
            id = Integer.parseInt(request.getParameter("dId"));
        /*String factorNoDelete = request.getParameter("factorNoDelete");
        String factorDateDelete = request.getParameter("factorDateDelete");
        String extraFactorDateDelete = request.getParameter("extraFactorDateDelete");
        String productOwnerDelete = request.getParameter("productOwnerDelete");
        String telDelete = request.getParameter("telDelete");
        String repairmanDelete = request.getParameter("repairmanDelete");
        String modelProductDelete = request.getParameter("modelProductDelete");
        String serialNoProductDelete = request.getParameter("serialNoProductDelete");
        String warrantyDateDelete = request.getParameter("warrantyDateDelete");
        String extraWarrantyDateDelete = request.getParameter("extraWarrantyDateDelete");
        String exitDateDelete = request.getParameter("exitDateDelete");
        String extraExitDateDelete = request.getParameter("extraExitDateDelete");
        int warrantyTermDelete = 0;
        if (request.getParameter("warrantyTermDelete") != null)
            if( !request.getParameter("warrantyTermDelete").equals(""))
                warrantyTermDelete = Integer.parseInt(request.getParameter("warrantyTermDelete"));
        String totalAmountDelete = request.getParameter("totalAmountDelete");
        String mobileDelete = request.getParameter("mobileDelete");
        String senderDelete = request.getParameter("senderDelete");
        String[] accessoriesDelete = request.getParameterValues("accessoriesDelete");
        String defects1Delete = request.getParameter("defects1Delete");
        String defects2Delete = request.getParameter("defects2Delete");
        String defects3Delete = request.getParameter("defects3Delete");
        String defects4Delete = request.getParameter("defects4Delete");
        String repairs1Delete = request.getParameter("repairs1Delete");
        String repairs2Delete = request.getParameter("repairs2Delete");
        String repairs3Delete = request.getParameter("repairs3Delete");
        String repairs4Delete = request.getParameter("repairs4Delete");
        String statusDelete=request.getParameter("statusDelete");*/
        String factorDeleteSql = "Delete from factor  where id="+id;
        try {
            PreparedStatement  factorStatement = null;
            if (connection != null) {
                factorStatement = connection.prepareStatement(factorDeleteSql);
            }
//            factorStatement.setString(1, factorNoDelete);
//            if(extraFactorDateDelete.equals("")) {
//                factorStatement.setString(2,null);
//            }else {
//                factorStatement.setString(2, extraFactorDateDelete);
//            }
//            factorStatement.setString(3, totalAmountDelete);
//            factorStatement.setString(4, productOwnerDelete);
//            factorStatement.setString(5, telDelete);
//            factorStatement.setString(6, repairmanDelete);
//            factorStatement.setString(7, modelProductDelete);
//            factorStatement.setString(8, serialNoProductDelete);
//            ArrayList accessoriesUp=new ArrayList();
//            if(accessoriesDelete!=null){
//                for (int i = 0; i < accessoriesDelete.length; i++)
//                    accessoriesUp.add(accessoriesDelete[i]);
//                    factorStatement.setString(9,  String.valueOf(accessoriesUp));
//            } else {
//                factorStatement.setString(9, String.valueOf(accessoriesDelete));
//            }
//            if(extraWarrantyDateDelete!=null){
//            if(extraWarrantyDateDelete.equals("")){
//                factorStatement.setString(10,null);
//            } else {
//                factorStatement.setString(10, extraWarrantyDateDelete);
//            }
//            } else {
//                factorStatement.setString(10,null);
//            }
//            factorStatement.setInt(11, warrantyTermDelete);
//            factorStatement.setString(12, defects1Delete);
//            factorStatement.setString(13, defects2Delete);
//            factorStatement.setString(14, defects3Delete);
//            factorStatement.setString(15, defects4Delete);
//            factorStatement.setString(16, repairs1Delete);
//            factorStatement.setString(17, repairs2Delete);
//            factorStatement.setString(18, repairs3Delete);
//            factorStatement.setString(19, repairs4Delete);
//            factorStatement.setString(20, factorDateDelete);
//            factorStatement.setString(21, warrantyDateDelete);
//            if(extraExitDateDelete!=null) {
//            if(extraExitDateDelete.equals("")){
//                factorStatement.setString(22,null);
//            } else {
//                factorStatement.setString(22, extraExitDateDelete);
//            }
//            }  else {
//                factorStatement.setString(22,null);
//            }
//            factorStatement.setString(23,exitDateDelete);
//            factorStatement.setString(24, statusDelete);
//            factorStatement.setString(25, mobileDelete);
//            factorStatement.setString(26, senderDelete);
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
