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
    <form id="phoneEditView" name="phoneEditView" action="novinPhoneEditView.jsp" method="post">
        <input type="hidden" id="lastNameEdit" name="lastNameEdit" value="<%=request.getParameter("lastNameEdit")%>">
        <input type="hidden" id="firstNameEdit" name="firstNameEdit" value="<%=request.getParameter("firstNameEdit")%>">
        <input type="hidden" id="companyNameEdit" name="companyNameEdit" value="<%=request.getParameter("companyNameEdit")%>">
        <input type="hidden" id="shopNameEdit" name="shopNameEdit" value="<%=request.getParameter("shopNameEdit")%>">
        <input type="hidden" id="tel1Edit" name="tel1Edit" value="<%=request.getParameter("tel1Edit")%>">
        <input type="hidden" id="tel2Edit" name="tel2Edit" value="<%=request.getParameter("tel2Edit")%>">
        <input type="hidden" id="tel3Edit" name="tel3Edit" value="<%=request.getParameter("tel3Edit")%>">
        <input type="hidden" id="tel4Edit" name="tel4Edit" value="<%=request.getParameter("tel4Edit")%>">
        <input type="hidden" id="fax1Edit" name="fax1Edit" value="<%=request.getParameter("fax1Edit")%>">
        <input type="hidden" id="fax2Edit" name="fax2Edit" value="<%=request.getParameter("fax2Edit")%>">
        <input type="hidden" id="emailEdit" name="emailEdit" value="<%=request.getParameter("emailEdit")%>">
        <input type="hidden" id="addressEdit" name="addressEdit" value="<%=request.getParameter("addressEdit")%>">
        <table align="center" dir="rtl">
            <tr>
                <td>نام خانوادگی :</td>
                <td><%=request.getParameter("lastNameEdit")%></td>
                <td>نام :</td>
                <td><%=request.getParameter("firstNameEdit")%></td>
                <td>نام شرکت :</td>
                <td><%=request.getParameter("companyNameEdit")%></td>
                <td>نام فروشگاه :</td>
                <td><%=request.getParameter("shopNameEdit")%></td>
            </tr>
            <tr>
                <td>تلفن 1:</td>
                <td><%=request.getParameter("tel1Edit")%></td>
                <td>تلفن2 :</td>
                <td><%=request.getParameter("tel2Edit")%></td>
                <td>تلفن 3:</td>
                <td><%=request.getParameter("tel3Edit")%></td>
                <td>تلفن 4 :</td>
                <td><%=request.getParameter("tel4Edit")%></td>
            </tr>
            <tr>
                <td>فکس 1 :</td>
                <td><%=request.getParameter("fax1Edit")%></td>
                <td>فکس 2 :</td>
                <td><%=request.getParameter("fax2Edit")%></td>
                <td>پست الکترونیک :</td>
                <td><%=request.getParameter("emailEdit")%></td>
                <td>آدرس :</td>
                <td><%=request.getParameter("addressEdit")%></td>
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
    </form>
</div>