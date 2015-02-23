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
        <td style="width: 50px"><%=request.getParameter("factorNoAdd")%></td>
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
        <td style="width: 50px;height: 36px" ><%=request.getParameter("factorDateAdd")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
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
        <td style="width: 22%" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getParameter("productOwnerAdd")%></td>
        <% if(request.getParameter("mobileAdd")!=null || !request.getParameter("mobileAdd").equals("")) {
        %>
        <td style="width: 29%" align="left"><%=request.getParameter("mobileAdd")%></td>
        <%
        } else {
        %>
        <td style="width: 29%" align="left"><%=request.getParameter("telAdd")%></td>
        <% } %>
        <td style="width: 9%">&nbsp;</td>
        <td style="width: 41%" align="left"><%=request.getParameter("repairmanAdd")%></td>
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
        <td style="width: 23%" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getParameter("modelProductAdd")%></td>
        <td style="width: 23%" align="left"><%=request.getParameter("serialNoProductAdd")%></td>
        <td style="width: 10%">&nbsp;</td>
        <td style="width: 10%">&nbsp;</td>
        <%
            if(request.getParameter("slingAccessoriesAdd").equals("sling")) {
        %>
        <td style="text-align: start">بند</td>
        <% } %>
        <%
            if(request.getParameter("batteryAccessoriesAdd").equals("battery"))  {
        %>
        <td style="text-align: start">باطری</td>
        <% } %>
        <%
            if(request.getParameter("bagAccessoriesAdd").equals("bag")) {
        %>
        <td style="text-align: start">کیف</td>
        <% } %>
        <%
            if(request.getParameter("memoryAccessoriesAdd").equals("memory"))  {
        %>
        <td style="text-align: start">حافظه</td>
        <% } %>
        <%
            if(request.getParameter("lensAccessoriesAdd").equals("lens"))   {
        %>
        <td style="text-align: start">لنز</td>
        <% }%>
        <%
            if(request.getParameter("lensCapAccessoriesAdd").equals("lensCap"))   {
        %>
        <td style="text-align: start">درب لنز</td>
        <% }%>
        <%
            if(request.getParameter("chargerAccessoriesAdd").equals("charger"))   {
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
        <td style="width: 50%; height: 35px;text-align: right;"><%=request.getParameter("repairs1Add")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td style="width: 46%; height: 35px;text-align: right;"><%=request.getParameter("defects1Add")%></td>
        <td style="width: 4%; height: 35px;">&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 50%; height: 35px;text-align: right"><%=request.getParameter("repairs2Add")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td style="width: 46%; height: 35px;text-align: right;"><%=request.getParameter("defects2Add")%></td>
        <td style="width: 4%; height: 35px;">&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 50%; height: 35px;text-align: right"><%=request.getParameter("repairs3Add")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td style="width: 46%; height: 35px;text-align: right;"><%=request.getParameter("defects3Add")%></td>
        <td style="width: 4%; height: 35px;">&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 50%; height: 35px;text-align: right"><%=request.getParameter("repairs4Add")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td style="width: 46%; height: 35px;text-align: right;"><%=request.getParameter("defects4Add")%></td>
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
        <td style="width: 34%;height: 5%" align="center"><%=request.getParameter("totalAmountAdd")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td style="width: 8%;height: 5%" align="center"></td>
        <td style="width: 17%;height: 5%" align="center"><%=request.getParameter("warrantyTermAdd")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td style="width: 38%;height: 5%" align="left"><%=request.getParameter("warrantyDateAdd")%>&nbsp;&nbsp;&nbsp;</td>

    </tr>
</table>

</body>
</html>