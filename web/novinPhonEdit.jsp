<meta dir="rtl" charset="utf-8" >
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
<div style="background-image: url('SoftBAck2.jpg'); height: 70%;width: 100%;overflow: scroll">
    <form id="novinPhoneEdit" name="novinPhoneEdit" action="novinPhoneEditView.jsp" method="post">
        <input type="hidden" id="phoneId" name="phoneId" value="<%=request.getParameter("sId")%>">
        <table align="center" dir="rtl">
            <tr>
                <td>نام خانوادگی :</td>
                <td><input type="text" id="lastName" name="lastNameEdit" value="<%=request.getParameter("sLastName")%>"></td>
                <td>نام :</td>
                <td><input type="text" id="firstNameEdit" name="firstNameEdit" value="<%=request.getParameter("sFirstName")%>"></td>
            </tr>
            <tr>
                <td>شرکت :</td>
                <td><input type="text" id="companyNameEdit" name="companyNameEdit" value="<%=request.getParameter("sCompanyName")%>"></td>
                <td>فروشگاه :</td>
                <td><input type="text" id="shopNameEdit" name="shopNameEdit" value="<%=request.getParameter("sShopName")%>"></td>
            </tr>
            <tr>
                <td>تلفن 1 :</td>
                <td><input type="tel" id="tel1Edit" name="tel1Edit" value="<%=request.getParameter("sTel1")%>"></td>
                <td>تلفن 2 :</td>
                <td><input type="tel" id="tel2Edit" name="tel2Edit" value="<%=request.getParameter("sTel2")%>"></td>
            </tr>
            <tr>
                <td>تلفن 3 :</td>
                <td><input type="tel" id="tel3Edit" name="tel3Edit" value="<%=request.getParameter("sTel3")%>"></td>
                <td>تلفن 4 :</td>
                <td><input type="tel" id="tel4Edit" name="tel4Edit" value="<%=request.getParameter("sTel4")%>"></td>
            </tr>
            <tr>
                <td>فکس 1 :</td>
                <td><input type="tel" id="fax1Edit" name="fax1Edit" value="<%=request.getParameter("sFax1")%>"></td>
                <td>فکس 2 :</td>
                <td><input type="tel" id="fax2Edit" name="fax2Edit" value="<%=request.getParameter("sFax2")%>"></td>
            </tr>
            <tr>
                <td>پست الکترونیک :</td>
                <td><input type="email" id="emailEdit" name="emailEdit" value="<%=request.getParameter("sEmail")%>"></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table align="center" dir="rtl">
            <tr>
                <td>آدرس :</td>
                <td><input id="addressEdit" name="addressEdit" style="width: 450px" value="<%=request.getParameter("sAddress")%>"> </td>
            </tr>
        </table>
        <table align="center" dir="rtl">
            <tr>
                <td><a href="#" onclick="document.getElementById('novinPhoneEdit').submit()"><img src="50-Folder-Downloads-icon.png"></a></td>
                <td><a href="#" onclick="document.getElementById('novinPhoneEdit').reset()"><img src="50-esc-icon.png"></a></td>
                <td><a href="novinPhon.jsp"><img src="50-Address-Book-121-detail.jpg"></a></td>
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
        int id=0;
        if(request.getParameter("phoneId") !=null)
            id = Integer.parseInt(request.getParameter("phoneId"));
        String lastNameEdit=request.getParameter("lastNameEdit");
        String firstNameEdit=request.getParameter("firstNameEdit");
        String companyNameEdit=request.getParameter("companyNameEdit");
        String emailEdit=request.getParameter("emailEdit");
        String addressEdit=request.getParameter("addressEdit");
        String tel1Edit=request.getParameter("tel1Edit");
        String tel2Edit=request.getParameter("tel2Edit");
        String tel3Edit=request.getParameter("tel3Edit");
        String tel4Edit=request.getParameter("tel4Edit");
        String fax1Edit=request.getParameter("fax1Edit");
        String fax2Edit=request.getParameter("fax2Edit");
        String shopNameEdit=request.getParameter("shopNameEdit");
        if(shopNameEdit==null) {
            shopNameEdit="";
        }

        String phoneEditSql="update phone set LAST_NAME=?,FIRST_NAME=?,TEL1=?,TEL2=?,TEL3=?,TEL4=?,FAX1=?,FAX2=?,ADDRESS=?,EMAIL=?,COMPANY_NAME=?,SHOP_NAME=? where id="+id;
        PreparedStatement phoneStatement=connection.prepareStatement(phoneEditSql);
        phoneStatement.setString(1,lastNameEdit);
        phoneStatement.setString(2,firstNameEdit);
        phoneStatement.setString(3,tel1Edit);
        phoneStatement.setString(4,tel2Edit);
        phoneStatement.setString(5,tel3Edit);
        phoneStatement.setString(6,tel4Edit);
        phoneStatement.setString(7,fax1Edit);
        phoneStatement.setString(8,fax2Edit);
        phoneStatement.setString(9,addressEdit);
        phoneStatement.setString(10,emailEdit);
        phoneStatement.setString(11,companyNameEdit);
        phoneStatement.setString(12,shopNameEdit);
        int phoneSt=phoneStatement.executeUpdate();
        if(phoneSt!=0) {

        } else {

        }
        phoneStatement.close();
        connection.close();
    %>
</div>