<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html >
<%
    request.setCharacterEncoding("UTF-8");
%>
<head>
    <style type="text/css" media="all">
        @page {
            margin-top: 1000px;
            margin-bottom: 1000px;
            margin-left: 2000px;
            margin-right: 2000px;
        }

        table.ex1 {table-layout:auto}

    </style>
</head>
<body style="background-image: url('/noname.jpg');background-size: cover;background-position: inherit;background-repeat: no-repeat;font-family: tahoma ;font-size: 20px;" onload="window.print();window.close()">

<table class="ex1"  align="center" style="width: 100%" dir="rlt">
    <tr>
    <td style="width: 50px"><%=request.getParameter("factorNoUpdate")%></td>
    <td style="width: 50px">&nbsp;</td>
    <td style="width: 50px">&nbsp;</td>
    <td style="width: 50px">&nbsp;</td>
    <td style="width: 50px">&nbsp;</td>
    <td style="width: 50px">&nbsp;</td>
    <td style="width: 50px">&nbsp;</td>
    <td style="width: 50px">&nbsp;</td>
    </tr>
    </table>

<table class="ex1"  align="center" style="width: 100%;height: 36px" dir="rlt">
    <tr>
        <td style="width: 50px;height: 36px" ><%=request.getParameter("factorDateUpdate")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td style="width: 50px;height: 36px">&nbsp;</td>
        <td style="width: 50px;height: 36px">&nbsp;</td>
        <td style="width: 50px;height: 36px">&nbsp;</td>
        <td style="width: 50px;height: 36px">&nbsp;</td>
        <td style="width: 50px;height: 36px">&nbsp;</td>
        <td style="width: 50px;height: 36px">&nbsp;</td>
        <td style="width: 50px;height: 36px">&nbsp;</td>
    </tr>
    </table>
<table class="ex1"  align="center" style="width: 100%" dir="rlt">
    <tr>
        <td style="width: 50px">&nbsp;</td>
        <td style="width: 50px">&nbsp;</td>
        <td style="width: 50px">&nbsp;</td>
        <td style="width: 50px">&nbsp;</td>
        <td style="width: 50px">&nbsp;</td>
        <td style="width: 50px">&nbsp;</td>
        <td style="width: 50px">&nbsp;</td>
        <td style="width: 50px">&nbsp;</td>
    </tr>
</table>

<table class="ex1"  align="center" style="width: 100%" dir="rtl" >
    <tr>
        <td style="width: 6%">&nbsp;</td>
        <td style="width: 22%" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getParameter("productOwnerUpdate")%></td>
        <% if(request.getParameter("mobileUpdate")!=null || !request.getParameter("mobileUpdate").equals("")) {
        %>
        <td style="width: 29%" align="left"><%=request.getParameter("mobileUpdate")%></td>
        <%
        } else {
        %>
        <td style="width: 29%" align="left"><%=request.getParameter("telUpdate")%></td>
        <% } %>
        <td style="width: 9%">&nbsp;</td>
        <td style="width: 41%" align="left"><%=request.getParameter("repairmanUpdate")%></td>
        <td style="width: 9%">&nbsp;</td>

    </tr>
    <tr>
        <td style="width: 10%">&nbsp;</td>
        <td style="width: 23%">&nbsp;</td>
        <td style="width: 23%">&nbsp;</td>
        <td style="width: 10%">&nbsp;</td>
        <td style="width: 24%">&nbsp;</td>
        <td style="width: 10%">&nbsp;</td>

    </tr>
    <tr>

        <td style="width: 10%">&nbsp;</td>
        <td style="width: 23%" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getParameter("modelProductUpdate")%></td>
        <td style="width: 23%" align="left"><%=request.getParameter("serialNoProductUpdate")%></td>
        <td style="width: 10%">&nbsp;</td>
        <td style="width: 10%">&nbsp;</td>
        <%
            if(request.getParameter("slingAccessoriesUpdate").equals("sling")) {
        %>
        <td style="text-align: start">بند</td>
        <% } %>
        <%
            if(request.getParameter("batteryAccessoriesUpdate").equals("battery"))  {
        %>
        <td style="text-align: start">باطری</td>
        <% } %>
        <%
            if(request.getParameter("bagAccessoriesUpdate").equals("bag")) {
        %>
        <td style="text-align: start">کیف</td>
        <% } %>
        <%
            if(request.getParameter("memoryAccessoriesUpdate").equals("memory"))  {
        %>
        <td style="text-align: start">حافظه</td>
        <% } %>
        <%
            if(request.getParameter("lensAccessoriesUpdate").equals("lens"))   {
        %>
        <td style="text-align: start">لنز</td>
        <% }%>
        <%
            if(request.getParameter("lensCapAccessoriesUpdate").equals("lensCap"))   {
        %>
        <td style="text-align: start">درب لنز</td>
        <% }%>
        <%
            if(request.getParameter("chargerAccessoriesUpdate").equals("charger"))   {
        %>
        <td style="text-align: start">شارژر</td>
        <% }%>
        <td style="width: 10%">&nbsp;</td>
    </tr>
    </table>
    <table class="ex1"  align="center" style="width: 100%" dir="rlt">
        <tr>
            <td style="width: 10%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 23%">&nbsp;</td>
            <td style="width: 10%">&nbsp;</td>
            <td style="width: 24%">&nbsp;</td>
            <td style="width: 10%">&nbsp;</td>

        </tr>
        </table>
    <table class="ex1"  align="center" style="width: 100%" dir="rlt">
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
<table class="ex1"   align="center" style="width: 100%;" dir="rlt">
    <tr>
        <td style="width: 50%; height: 35px;text-align: right;"><%=request.getParameter("repairs1Update")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td style="width: 46%; height: 35px;text-align: right;"><%=request.getParameter("defects1Update")%></td>
        <td style="width: 4%; height: 35px;">&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 50%; height: 35px;text-align: right"><%=request.getParameter("repairs2Update")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td style="width: 46%; height: 35px;text-align: right;"><%=request.getParameter("defects2Update")%></td>
        <td style="width: 4%; height: 35px;">&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 50%; height: 35px;text-align: right"><%=request.getParameter("repairs3Update")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td style="width: 46%; height: 35px;text-align: right;"><%=request.getParameter("defects3Update")%></td>
        <td style="width: 4%; height: 35px;">&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 50%; height: 35px;text-align: right"><%=request.getParameter("repairs4Update")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td style="width: 46%; height: 35px;text-align: right;"><%=request.getParameter("defects4Update")%></td>
        <td style="width: 4%; height: 35px;">&nbsp;</td>
    </tr>
</table>
<table class="ex1"  align="center" style="width: 100%" dir="rlt">
    <tr>
        <td style="width: 10%">&nbsp;</td>
        <td style="width: 23%">&nbsp;</td>
        <td style="width: 23%">&nbsp;</td>
        <td style="width: 10%">&nbsp;</td>
        <td style="width: 24%">&nbsp;</td>
        <td style="width: 10%">&nbsp;</td>

    </tr>
</table>


<table class="ex1"  align="center" style="width: 100%;height: 5%" dir="rlt" >
    <tr>
        <td style="width: 34%;height: 5%" align="center"><%=request.getParameter("totalAmountUpdate")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td style="width: 8%;height: 5%" align="center"></td>
        <td style="width: 17%;height: 5%" align="center"><%=request.getParameter("warrantyTermUpdate")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td style="width: 38%;height: 5%" align="left"><%=request.getParameter("warrantyDateUpdate")%>&nbsp;&nbsp;&nbsp;</td>

    </tr>
    </table>

</body>
</html>