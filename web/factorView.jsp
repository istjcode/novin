<meta dir="rtl" charset="utf-8" >
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@
        page import="com.sun.org.apache.xalan.internal.xsltc.compiler.util.ErrorMessages ,java.io.PrintWriter,java.sql.*,java.text.SimpleDateFormat"
        %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<html>
    <%
    request.setCharacterEncoding("UTF-8");
%>
<body style="font-family: tahoma">
<jsp:include page="header.jsp"/>
<div style="background-image: url('SoftBAck2.jpg'); height: 70%;width: 100%;overflow: scroll">
    <form id="factorView" name="factorView" action="novinPrintAdd.jsp" method="post">

        <table align="center" dir="rtl">
            <tr>
                <td>شماره قبض:</td>
                <td><%=request.getParameter("factorNoAdd")%></td>
                <td>تاریخ قبض:</td>
                <td><%=request.getParameter("factorDateAdd")%></td>
                <td>صاحب دستگاه:</td>
                <td><%=request.getParameter("productOwnerAdd")%></td>
                <td>تلفن:</td>
                <td><%=request.getParameter("telAdd")%></td>
            </tr>
            <tr>
                <td>نام تعمیرکار:</td>
                <td><%=request.getParameter("repairmanAdd")%></td>
                <td>مدل:</td>
                <td><%=request.getParameter("modelProductAdd")%></td>
                <td>سریال دستگاه:</td>
                <td><%=request.getParameter("serialNoProductAdd")%></td>
                <td>تاریخ گارانتی:</td>
                <td><%=request.getParameter("warrantyDateAdd")%></td>
            </tr>
            <tr>
                <td>مدت گارانتی:</td>
                <td><%=request.getParameter("warrantyTermAdd")%></td>
                <td>مبلغ کل:</td>
                <td><%=request.getParameter("totalAmountAdd")%></td>
                <%
                    String sling="";
                    String battery="";
                    String bag="";
                    String memory="";
                    String lens="";
                    String lensCap="";
                    String charger="";
                    if(request.getParameterValues("accessoriesAdd")!=null && !request.getParameterValues("accessoriesAdd").equals("")){
                        String[] accessoriesArr;
                        accessoriesArr=request.getParameterValues("accessoriesAdd");
                        for(int i=0;i< accessoriesArr.length;i++) {
                            if(accessoriesArr[i].equals("sling"))
                                sling="sling";
                            if(accessoriesArr[i].equals("battery"))
                                battery="battery";
                            if(accessoriesArr[i].equals("bag"))
                                bag="bag";
                            if(accessoriesArr[i].equals("memory"))
                                memory="memory";
                            if(accessoriesArr[i].equals("lens"))
                                lens="lens";
                            if(accessoriesArr[i].equals("lensCap"))
                                lensCap="lensCap";
                            if(accessoriesArr[i].equals("charger"))
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
                <td><%=request.getParameter("mobileAdd")%></td>
                <td>فرستنده:</td>
                <td><%=request.getParameter("senderAdd")%></td>
            </tr>
        </table>
        <table align="center" dir="rtl">
            <tr>
                <td>عیوب به اظهار مشتری:</td>
                <td><%=request.getParameter("defects1Add")%></td>
            </tr>
            <tr>
                <td>عیوب به اظهار مشتری:</td>
                <td><%=request.getParameter("defects2Add")%></td>
            </tr>
            <tr>
                <td>عیوب به اظهار مشتری:</td>
                <td><%=request.getParameter("defects3Add")%></td>
            </tr>
            <tr>
                <td>عیوب به اظهار مشتری:</td>
                <td><%=request.getParameter("defects4Add")%></td>
            </tr>
            <tr>
                <td>شرح تعمیرات:</td>
                <td><%=request.getParameter("repairs1Add")%></td>
            </tr>
            <tr>
                <td>شرح تعمیرات:</td>
                <td><%=request.getParameter("repairs2Add")%></td>
            </tr>
            <tr>
                <td>شرح تعمیرات:</td>
                <td><%=request.getParameter("repairs3Add")%></td>
            </tr>
            <tr>
                <td>شرح تعمیرات:</td>
                <td><%=request.getParameter("repairs4Add")%></td>
            </tr>
            <table dir="rtl" align="center">
            <tr>
            <td><a href="#" onclick="document.getElementById('factorView').submit();"  target="_blank" style="width: 10px;height: 20px"><img src="50-Hot-Printer-icon.png"></a></td>
            <td><a href="novin.jsp"><img src="50-Places-user-home-icon.png"></a></td>
            </tr>
                </table>
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
            request.setCharacterEncoding("utf-8");
            String factorNoAdd = request.getParameter("factorNoAdd");
            String checkSql="select * from factor f where f.factor_no="+factorNoAdd;
            Statement checkSt=connection.createStatement();
            ResultSet checkRs=checkSt.executeQuery(checkSql);
            if(checkRs.next())
                %>
               <p></p>
           <%
            String factorDateAdd = request.getParameter("factorDateAdd");
            String extraFactorDateAdd = request.getParameter("extraFactorDateAdd");
            if(extraFactorDateAdd==null || extraFactorDateAdd.equals("")) {
                Date factorDate=new Date();
                extraFactorDateAdd=new SimpleDateFormat("yyyy-MM-dd").format(factorDate);
            }
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
            String factorAddSql = "insert into factor  (FACTOR_NO,FACTOR_DATE,TOTAL_AMOUNT,PRODUCT_OWNER,TEL,REPAIRMAN,MODEL,SERIAL_NO,ACCESSORIES,WARRANTY_DATE,WARRANTY_TERM,DEFECTS1,DEFECTS2,DEFECTS3,DEFECTS4,REPAIRS1,REPAIRS2,REPAIRS3,REPAIRS4,FACTOR_DATE_STRING,WARRANTY_DATE_STRING,EXIT_DATE,EXIT_DATE_STRING,STATUS,MOBILE,SENDER) values (?, ? , ? , ? ,?, ? , ? , ?,?, ? , ?, ? , ? ,?, ? , ? , ?,?, ? ,?,?,?,?,?,?,?)";
            try {
                PreparedStatement factorStatement = connection.prepareStatement(factorAddSql);
                factorStatement.setString(1, factorNoAdd);
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
                }  else {
                    factorStatement.setString(9, null);
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
                factorStatement.setString(24, statusAdd);
                factorStatement.setString(25, mobileAdd);
                factorStatement.setString(26, senderAdd);
                int customerSt = factorStatement.executeUpdate();
                if(customerSt != 0) {

                } else {

                }
                %>
        <table dir="rtl" align="center">
            <tr>
                <input type="hidden" id="factorNoAdd" name="factorNoAdd" value="<%=request.getParameter("factorNoAdd")%>">
                <input type="hidden" id="factorDateAdd" name="factorDateAdd" value="<%=request.getParameter("factorDateAdd")%>">
                <input type="hidden" id="productOwnerAdd" name="productOwnerAdd" value="<%=request.getParameter("productOwnerAdd")%>">
                <input type="hidden" id="telAdd" name="telAdd" value="<%=request.getParameter("telAdd")%>">
                <input type="hidden" id="repairmanAdd" name="repairmanAdd" value="<%=request.getParameter("repairmanAdd")%>">
                <input type="hidden" id="modelProductAdd" name="modelProductAdd" value="<%=request.getParameter("modelProductAdd")%>">
                <input type="hidden" id="serialNoProductAdd" name="serialNoProductAdd" value="<%=request.getParameter("serialNoProductAdd")%>">
                <input type="hidden" id="warrantyDateAdd" name="warrantyDateAdd" value="<%=request.getParameter("warrantyDateAdd")%>">
                <input type="hidden" id="exitDateAdd" name="exitDateAdd" value="<%=request.getParameter("exitDateAdd")%>">
                <input type="hidden" id="warrantyTermAdd" name="warrantyTermAdd" value="<%=request.getParameter("warrantyTermAdd")%>">
                <input type="hidden" id="totalAmountAdd" name="totalAmountAdd" value="<%=request.getParameter("totalAmountAdd")%>">
                <input type="hidden" id="mobileAdd" name="mobileAdd" value="<%=request.getParameter("mobileAdd")%>">
                <input type="hidden" id="senderAdd" name="senderAdd" value="<%=request.getParameter("senderAdd")%>">
                <input type="hidden" id="slingAccessoriesAdd" name="slingAccessoriesAdd" value="<%=sling%>">
                <input type="hidden" id="bagAccessoriesAdd" name="bagAccessoriesAdd" value="<%=bag%>">
                <input type="hidden" id="batteryAccessoriesAdd" name="batteryAccessoriesAdd" value="<%=battery%>">
                <input type="hidden" id="memoryAccessoriesAdd" name="memoryAccessoriesAdd" value="<%=memory%>">
                <input type="hidden" id="lensAccessoriesAdd" name="lensAccessoriesAdd" value="<%=lens%>">
                <input type="hidden" id="lensCapAccessoriesAdd" name="lensCapAccessoriesAdd" value="<%=lensCap%>">
                <input type="hidden" id="chargerAccessoriesAdd" name="chargerAccessoriesAdd" value="<%=charger%>">
                <input type="hidden" id="defects1Add" name="defects1Add" value="<%=request.getParameter("defects1Add")%>">
                <input type="hidden" id="defects2Add" name="defects2Add" value="<%=request.getParameter("defects2Add")%>">
                <input type="hidden" id="defects3Add" name="defects3Add" value="<%=request.getParameter("defects3Add")%>">
                <input type="hidden" id="defects4Add" name="defects4Add" value="<%=request.getParameter("defects4Add")%>">
                <input type="hidden" id="repairs1Add" name="repairs1Add" value="<%=request.getParameter("repairs1Add")%>">
                <input type="hidden" id="repairs2Add" name="repairs2Add" value="<%=request.getParameter("repairs2Add")%>">
                <input type="hidden" id="repairs3Add" name="repairs3Add" value="<%=request.getParameter("repairs3Add")%>">
                <input type="hidden" id="repairs4Add" name="repairs4Add" value="<%=request.getParameter("repairs4Add")%>">
                <input type="hidden" id="statusAdd" name="statusAdd" value="<%=request.getParameter("statusAdd")%>">

            </tr>
        </table>
        <%
                factorStatement.close();
                connection.close();
            } catch (NullPointerException e) {
                e.printStackTrace();
            }
        %>
    </form>
    </div>