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
    <form id="phoneAdd" name="phoneAdd" action="novinPhoneView.jsp" method="post">
        <table align="center" dir="rtl">
            <tr>
                <td>نام خانوادگی :</td>
                <td><input type="text" id="lastNameAdd" name="lastNameAdd"></td>
                <td>نام :</td>
                <td><input type="text" id="firstNameAdd" name="firstNameAdd"></td>
            </tr>
            <tr>
                <td>شرکت :</td>
                <td><input type="text" id="companyNameAdd" name="companyNameAdd"></td>
                <td>فروشگاه :</td>
                <td><input type="text" id="shopNameAdd" name="shopNameAdd"></td>
            </tr>
            <tr>
                <td>تلفن 1 :</td>
                <td><input type="tel" id="tel1Add" name="tel1Add"></td>
                <td>تلفن 2 :</td>
                <td><input type="tel" id="tel2Add" name="tel2Add"></td>
            </tr>
            <tr>
                <td>تلفن 3 :</td>
                <td><input type="tel" id="tel3Add" name="tel3Add"></td>
                <td>تلفن 4 :</td>
                <td><input type="tel" id="tel4Add" name="tel4Add"></td>
            </tr>
            <tr>
                <td>فکس 1 :</td>
                <td><input type="tel" id="fax1Add" name="fax1Add"></td>
                <td>فکس 2 :</td>
                <td><input type="tel" id="fax2Add" name="fax2Add"></td>
            </tr>
            <tr>
                <td>پست الکترونیک :</td>
                <td><input type="email" id="emailAdd" name="emailAdd"></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            </table>
            <table align="center" dir="rtl">
            <tr>
                <td>آدرس :</td>
                <td><textarea id="addressAdd" name="addressAdd" style="width: 450px"></textarea> </td>
            </tr>
        </table>
        <table align="center" dir="rtl">
            <tr>
                <td><a href="#" onclick="document.getElementById('phoneAdd').submit()"><img src="50-Folder-Downloads-icon.png"></a></td>
                <td><a href="#" onclick="document.getElementById('phoneAdd').reset()"><img src="50-esc-icon.png"></a></td>
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
        String lastNameAdd=request.getParameter("lastNameAdd");
        String firstNameAdd=request.getParameter("firstNameAdd");
        String companyNameAdd=request.getParameter("companyNameAdd");
        String emailAdd=request.getParameter("emailAdd");
        String addressAdd=request.getParameter("addressAdd");
        String tel1Add=request.getParameter("tel1Add");
        String tel2Add=request.getParameter("tel2Add");
        String tel3Add=request.getParameter("tel3Add");
        String tel4Add=request.getParameter("tel4Add");
        String fax1Add=request.getParameter("fax1Add");
        String fax2Add=request.getParameter("fax2Add");
        String shopNameAdd=request.getParameter("shopNameAdd");

        if(shopNameAdd==null) {
            shopNameAdd="";
        }
        String phoneAddSql="insert into phone (LAST_NAME,FIRST_NAME,TEL1,TEL2,TEL3,TEL4,FAX1,FAX2,ADDRESS,EMAIL,COMPANY_NAME,SHOP_NAME) values (? ,? ,? ,? ,?,? ,? ,? ,? ,?, ?,?)";
        PreparedStatement phoneStatement=connection.prepareStatement(phoneAddSql);
        phoneStatement.setString(1,lastNameAdd);
        phoneStatement.setString(2,firstNameAdd);
        phoneStatement.setString(3,tel1Add);
        phoneStatement.setString(4,tel2Add);
        phoneStatement.setString(5,tel3Add);
        phoneStatement.setString(6,tel4Add);
        phoneStatement.setString(7,fax1Add);
        phoneStatement.setString(8,fax2Add);
        phoneStatement.setString(9,addressAdd);
        phoneStatement.setString(10,emailAdd);
        phoneStatement.setString(11,companyNameAdd);
        phoneStatement.setString(12,shopNameAdd);
        int phoneSt=phoneStatement.executeUpdate();
        if(phoneSt!=0) {

        } else {

        }
        phoneStatement.close();
        connection.close();
        %>
    </div>