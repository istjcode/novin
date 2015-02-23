<meta dir="rtl" charset="utf-8" >
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@
        page import="java.sql.* ,javax.servlet.*,java.io.*,java.util.*"
        %>
<html>
    <%
    request.setCharacterEncoding("UTF-8");
%>
<body style="font-family: tahoma">
<jsp:include page="header.jsp"/>
<div style="background-image: url('SoftBAck2.jpg'); height: 70%;width: 100%;overflow: scroll">
<form id="phoneView" name="phoneView" action="novinPhoneView.jsp" method="post">
<input type="hidden" id="lastNameAdd" name="lastNameAdd" value="<%=request.getParameter("lastNameAdd")%>">
<input type="hidden" id="firstNameAdd" name="firstNameAdd" value="<%=request.getParameter("firstNameAdd")%>">
<input type="hidden" id="companyNameAdd" name="companyNameAdd" value="<%=request.getParameter("companyNameAdd")%>">
<input type="hidden" id="shopNameAdd" name="shopNameAdd" value="<%=request.getParameter("shopNameAdd")%>">
<input type="hidden" id="tel1Add" name="tel1Add" value="<%=request.getParameter("tel1Add")%>">
<input type="hidden" id="tel2Add" name="tel2Add" value="<%=request.getParameter("tel2Add")%>">
<input type="hidden" id="tel3Add" name="tel3Add" value="<%=request.getParameter("tel3Add")%>">
<input type="hidden" id="tel4Add" name="tel4Add" value="<%=request.getParameter("tel4Add")%>">
<input type="hidden" id="fax1Add" name="fax1Add" value="<%=request.getParameter("fax1Add")%>">
<input type="hidden" id="fax2Add" name="fax2Add" value="<%=request.getParameter("fax2Add")%>">
<input type="hidden" id="emailAdd" name="emailAdd" value="<%=request.getParameter("emailAdd")%>">
<input type="hidden" id="addressAdd" name="addressAdd" value="<%=request.getParameter("addressAdd")%>">
<table align="center" dir="rtl">
    <tr>
        <td>نام خانوادگی :</td>
        <td><%=request.getParameter("lastNameAdd")%></td>
        <td>نام :</td>
        <td><%=request.getParameter("firstNameAdd")%></td>
        <td>نام شرکت :</td>
        <td><%=request.getParameter("companyNameAdd")%></td>
        <td>نام فروشگاه :</td>
        <td><%=request.getParameter("shopNameAdd")%></td>
    </tr>
    <tr>
        <td>تلفن 1:</td>
        <td><%=request.getParameter("tel1Add")%></td>
        <td>تلفن2 :</td>
        <td><%=request.getParameter("tel2Add")%></td>
        <td>تلفن 3:</td>
        <td><%=request.getParameter("tel3Add")%></td>
        <td>تلفن 4 :</td>
        <td><%=request.getParameter("tel4Add")%></td>
        </tr>
    <tr>
        <td>فکس 1 :</td>
        <td><%=request.getParameter("fax1Add")%></td>
        <td>فکس 2 :</td>
        <td><%=request.getParameter("fax2Add")%></td>
        <td>پست الکترونیک :</td>
        <td><%=request.getParameter("emailAdd")%></td>
        <td>آدرس :</td>
        <td><%=request.getParameter("addressAdd")%></td>
    </tr>
</table>
<table dir="rtl" align="center">
    <tr>
        <td><a href="novin.jsp"><img src="50-Places-user-home-icon.png"></a></td>
        <td><a href="novinPhon.jsp"><img src="50-Address-Book-121-detail.jpg"></a></td>
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
</form>
</div>