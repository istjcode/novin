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
        <td style="width: 50px"><%=request.getParameter("pFactorNoUpdate")%></td>
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
        <td style="width: 50px;height: 36px" ><%=request.getParameter("pFactorDateUpdate")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
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
        <td style="width: 22%" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getParameter("pProductOwnerUpdate")%></td>
        <% if(request.getParameter("pMobileUpdate")!=null ) {
        %>
        <td style="width: 29%" align="left"><%=request.getParameter("pMobileUpdate")%></td>
        <%
        } else {
        %>
        <td style="width: 29%" align="left"><%=request.getParameter("pTelUpdate")%></td>
        <% } %>
        <td style="width: 9%">&nbsp;</td>
        <td style="width: 41%" align="left"><%=request.getParameter("pRepairmanUpdate")%></td>
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
        <td style="width: 23%" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getParameter("pModelProductUpdate")%></td>
        <td style="width: 23%" align="left"><%=request.getParameter("pSerialNoProductUpdate")%></td>
        <td style="width: 10%">&nbsp;</td>
        <td style="width: 10%">&nbsp;</td>
        <%
            if(request.getParameter("pSlingAccessoriesUpdate")!=null) {
            if(request.getParameter("pSlingAccessoriesUpdate").equals("sling")) {
        %>
        <td style="text-align: start">بند</td>
        <% }  }%>
        <%
            if(request.getParameter("pBatteryAccessoriesUpdate")!=null) {
            if(request.getParameter("pBatteryAccessoriesUpdate").equals("battery"))  {
        %>
        <td style="text-align: start">باطری</td>
        <% } }%>
        <%
            if(request.getParameter("pBagAccessoriesUpdate")!=null)  {
            if(request.getParameter("pBagAccessoriesUpdate").equals("bag")) {
        %>
        <td style="text-align: start">کیف</td>
        <% } }%>
        <%
            if(request.getParameter("pMemoryAccessoriesUpdate")!=null) {
            if(request.getParameter("pMemoryAccessoriesUpdate").equals("memory"))  {
        %>
        <td style="text-align: start">حافظه</td>
        <% } }%>
        <%
            if(request.getParameter("pLensAccessoriesUpdate")!=null) {
            if(request.getParameter("pLensAccessoriesUpdate").equals("lens"))   {
        %>
        <td style="text-align: start">لنز</td>
        <% } }%>
        <%
            if(request.getParameter("pLensCapAccessoriesUpdate")!=null){
            if(request.getParameter("pLensCapAccessoriesUpdate").equals("lensCap"))   {
        %>
        <td style="text-align: start">درب لنز</td>
        <% } }%>
        <%
            if(request.getParameter("pChargerAccessoriesUpdate")!=null) {
            if(request.getParameter("pChargerAccessoriesUpdate").equals("charger"))   {
        %>
        <td style="text-align: start">شارژر</td>
        <% } }%>
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
        <td style="width: 50%; height: 35px;text-align: right;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td style="width: 46%; height: 35px;text-align: right;"><%=request.getParameter("pDefects1Update")%></td>
        <td style="width: 4%; height: 35px;">&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 50%; height: 35px;text-align: right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td style="width: 46%; height: 35px;text-align: right;"><%=request.getParameter("pDefects2Update")%></td>
        <td style="width: 4%; height: 35px;">&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 50%; height: 35px;text-align: right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td style="width: 46%; height: 35px;text-align: right;"><%=request.getParameter("pDefects3Update")%></td>
        <td style="width: 4%; height: 35px;">&nbsp;</td>
    </tr>
    <tr>
        <td style="width: 50%; height: 35px;text-align: right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td style="width: 46%; height: 35px;text-align: right;"><%=request.getParameter("pDefects4Update")%></td>
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
        <td style="width: 34%;height: 5%" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td style="width: 8%;height: 5%" align="center"></td>
        <td style="width: 17%;height: 5%" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td style="width: 38%;height: 5%" align="left">&nbsp;&nbsp;&nbsp;</td>

    </tr>
</table>

</body>
</html>