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
    <form id="phoneSearchForm" name="phoneSearchForm" action="novinPhon.jsp" method="post">
        <table align="center" dir="rtl">
            <tr>
                <td>نام خانوادگی :</td>
                <td><input type="text" id="lastNameSearch" name="lastNameSearch"></td>
                <td>نام :</td>
                <td><input type="text" id="firstNameSearch" name="firstNameSearch"></td>
                <td>نام شرکت :</td>
                <td><input type="text" id="companyNameSearch" name="companyNameSearch"></td>
                <td>نام فروشگاه :</td>
                <td><input type="text" id="shopNameSearch" name="shopNameSearch"> </td>
            </tr>
            <tr>
                <td>تلفن :</td>
                <td><input type="tel" id="telSearch" name="telSearch"></td>
                <td>فکس :</td>
                <td><input type="tel" id="faxSearch" name="faxSearch"></td>
                <td>پست الکترونیک :</td>
                <td><input type="email" id="emailSearch" name="emailSearch"></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            </table>
        <table align="center" dir="rtl">
            <tr>
                <td>آدرس :</td>
                <td><input type="text" id="addressSearch" name="addressSearch" size="135"></td>
            </tr>
        </table>
        <table align="center" dir="rtl">
            <tr>
                <td>
                    <a href="novinPhoneInsert.jsp"><img src="plus50x50.png"></a>
                </td>
                <td><a href="#" onclick="document.getElementById('phoneSearchForm').submit()"><img src="search-icon.png"></a></td>
                <td><a href="novin.jsp"><img src="50-Places-user-home-icon.png"></a></td>
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
    String lastNameSearch=request.getParameter("lastNameSearch");
    String firstNameSearch=request.getParameter("firstNameSearch");
    String companyNameSearch=request.getParameter("companyNameSearch");
    String telSearch=request.getParameter("telSearch");
    String faxSearch=request.getParameter("faxSearch");
    String emailSearch=request.getParameter("emailSearch");
    String addressSearch=request.getParameter("addressSearch");
    String shopNameSearch=request.getParameter("shopNameSearch");

    String phoneSearchSql="select * from phone f where f.last_name like '%"+lastNameSearch+"%' and f.first_name like'%"+firstNameSearch+"%' and f.company_name like '%"+
    companyNameSearch+"%' and  f.email like '%"+emailSearch+"%' and   f.shop_name like '%"+shopNameSearch+"%'  and f.address like '%"+addressSearch+"%' and ('"+telSearch+"' in (f.tel1,f.tel2,f.tel3,f.tel4) or '"+telSearch+"' like '')"+
            "  and ('"+faxSearch+"' in (f.fax1,f.fax2) or '"+faxSearch+"' like '') order by last_name,company_name desc limit 20";
    Statement phoneStatement=connection.createStatement();
    ResultSet phoneResultSet=phoneStatement.executeQuery(phoneSearchSql);
        %>

    <table align="center" border="2" dir="rtl">
        <thead style="background-color: #999999">
        <tr>
            <th>نام خانوادگی</th>
            <th>نام</th>
            <th>نام شرکت</th>
            <th>نام فروشگاه</th>
            <th>تلفن 1</th>
            <th>تلفن 2</th>
            <th>تلفن 3</th>
            <th>تلفن 4</th>
            <th>فکس 1</th>
            <th>فکس 2</th>
        </tr>
        </thead>
        <tbody>
        <% while (phoneResultSet.next()){
           %>
        <tr style="background-color: white">
            <td>&nbsp;<%=phoneResultSet.getString("last_name")%>&nbsp;</td>
            <td>&nbsp;<%=phoneResultSet.getString("first_name")%>&nbsp;</td>
            <td>&nbsp;<%=phoneResultSet.getString("company_name")%>&nbsp;</td>
            <td>&nbsp;<%=phoneResultSet.getString("shop_name")%>&nbsp;</td>
            <td>&nbsp;<%=phoneResultSet.getString("tel1")%>&nbsp;</td>
            <td>&nbsp;<%=phoneResultSet.getString("tel2")%>&nbsp;</td>
            <td>&nbsp;<%=phoneResultSet.getString("tel3")%>&nbsp;</td>
            <td>&nbsp;<%=phoneResultSet.getString("tel4")%>&nbsp;</td>
            <td>&nbsp;<%=phoneResultSet.getString("fax1")%>&nbsp;</td>
            <td>&nbsp;<%=phoneResultSet.getString("fax2")%>&nbsp;</td>
            <td>
                <form id="sendForm" name="sendForm" action="novinPhonEdit.jsp" method="post">
                    <input type="hidden" id="sId" name="sId" value="<%=phoneResultSet.getInt("id")%>">
                    <input type="hidden" id="sLastName" name="sLastName" value="<%=phoneResultSet.getString("last_name")%>">
                    <input type="hidden" id="sFirstName" name="sFirstName" value="<%=phoneResultSet.getString("first_name")%>">
                    <input type="hidden" id="sCompanyName" name="sCompanyName" value="<%=phoneResultSet.getString("company_name")%>">
                    <input type="hidden" id="sAddress" name="sAddress" value="<%=phoneResultSet.getString("address")%>">
                    <input type="hidden" id="sEmail" name="sEmail" value="<%=phoneResultSet.getString("email")%>">
                    <input type="hidden" id="sTel1" name="sTel1" value="<%=phoneResultSet.getString("tel1")%>">
                    <input type="hidden" id="sTel2" name="sTel2" value="<%=phoneResultSet.getString("tel2")%>">
                    <input type="hidden" id="sTel3" name="sTel3" value="<%=phoneResultSet.getString("tel3")%>">
                    <input type="hidden" id="sTel4" name="sTel4" value="<%=phoneResultSet.getString("tel4")%>">
                    <input type="hidden" id="sFax1" name="sFax1" value="<%=phoneResultSet.getString("fax1")%>">
                    <input type="hidden" id="sFax2" name="sFax2" value="<%=phoneResultSet.getString("fax2")%>">
                    <input type="hidden" id="sShopName" name="sShopName" value="<%=phoneResultSet.getString("shop_name")%>">
                    <input type="submit" id="sSubmit" name="sSubmit" value=""  style="background: url('30-Files-Edit-file-icon.png');width: 40px;height: 30px">
                </form>
            </td>
        </tr>
        <%
            }
            phoneResultSet.close();
            phoneStatement.close();
            connection.close();
        %>
        </tbody>
        </table>
    </div>