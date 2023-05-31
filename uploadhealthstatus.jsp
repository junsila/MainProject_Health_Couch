<%-- 
    Document   : uploadhealthstatus
    Created on : 22 Feb, 2023, 11:19:47 AM
    Author     : junsi jun
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload Health status</title>
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd"); %>

        <%
           if (request.getParameter("btnsubmit") != null) {
                
                String Sugar = request.getParameter("txtsugar")==null?"0":request.getParameter("txtsugar");
                String Pressure = request.getParameter("txtpressure")==null?"0":request.getParameter("txtpressure");
                String Cholesterol = request.getParameter("txtcholesterol")==null?"0":request.getParameter("txtcholesterol");
                String Thyroid = request.getParameter("txtthyroid")==null?"0":request.getParameter("txtthyroid");
                String Pcod = request.getParameter("txtpcod")==null?"0":request.getParameter("txtpcod");
                String Resultdate = request.getParameter("resultdate");
                
                
                
                String SelQry="select * from tbn_health where user_id='"+session.getAttribute("uid")+"' and result_date='"+Resultdate+"' ";
                ResultSet rs=con.selectCommand(SelQry);
                if(rs.next())
                {
                    %>
                    <script>
                        alert('Date already exists');
                    </script>
                    <%
                }
                else{
                     String inQry = "insert into tbn_health(user_id,sugar_level,pressure_level,cholestrol_level,thyroid_level,pcod_level,result_date) "
                        + "values('" + session.getAttribute("uid") + "','" + Sugar + "','" + Pressure + "','" + Cholesterol + "','" + Thyroid + "','" + Pcod + "','"+ Resultdate +"')";
               // out.print(inQry);
                     if (con.executeCommand(inQry)) {
        %>
        <script>
            alert('Inserted');
            window.location = "uploadhealthstatus.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert('Failed');
            //window.location = "uploadhealthstatus.jsp";
        </script>
        <%
                }
                }
 
            }

        %>
        <h3><center><u>Upload Health Status</u></center></h3>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td>Result Date</td>
                    <td><input type="date" name="resultdate" max="<%=df.format(new java.util.Date()) %>"></td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="cbsugar" id="cbsugar" onclick="chkfunction()">Sugar Level</td>
                    <td><input type="text" name="txtsugar" id="txtsugar" disabled="" value="" required="required"></td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="cbpressure" id="cbpressure" onclick="chk1function()">Pressure Level</td>
                    <td><input type="text" name="txtpressure" id="txtpressure" disabled=""></td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="cbcholesetrol" id="cbcholesetrol" onclick="chk2function()">Cholesterol Level</td>
                    <td><input type="text" name="txtcholesterol" id="txtcholesterol" disabled=""></td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="cbthyroid" id="cbthyroid" onclick="chk3function()">Thyroid Level</td>
                    <td><input type="text" name="txtthyroid" id="txtthyroid" disabled=""></td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="cbpcod" id="cbpcod" onclick="chk4function()">PCOD Level</td>
                    <td><input type="text" name="txtpcod" id="txtpcod" disabled=""></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsubmit" value="Submit">
                        <input type="reset" name="btnreset" value="Reset"></td>
                </tr>
            </table>
        </form>
        <script>
            function chkfunction()
            {

                var checkBox = document.getElementById("cbsugar");

                if (checkBox.checked == true)
                {
                    document.getElementById("txtsugar").disabled = false;
                }
                else
                {
                    document.getElementById("txtsugar").disabled = true;
                }
            }

        </script>

        <script>
            function chk1function()
            {

                var checkBox = document.getElementById("cbpressure");

                if (checkBox.checked == true)
                {
                    document.getElementById("txtpressure").disabled = false;
                }
                else
                {
                    document.getElementById("txtpressure").disabled = true;
                }
            }

        </script>

        <script>
            function chk2function()
            {

                var checkBox = document.getElementById("cbcholesetrol");

                if (checkBox.checked == true)
                {
                    document.getElementById("txtcholesterol").disabled = false;
                }
                else
                {
                    document.getElementById("txtcholesterol").disabled = true;
                }
            }

        </script>

        <script>
            function chk3function()
            {

                var checkBox = document.getElementById("cbthyroid");

                if (checkBox.checked == true)
                {
                    document.getElementById("txtthyroid").disabled = false;
                }
                else
                {
                    document.getElementById("txtthyroid").disabled = true;
                }
            }

        </script>

        <script>
            function chk4function()
            {

                var checkBox = document.getElementById("cbpcod");

                if (checkBox.checked == true)
                {
                    document.getElementById("txtpcod").disabled = false;
                }
                else
                {
                    document.getElementById("txtpcod").disabled = true;
                }
            }

        </script>
        <table border="1" align="center">
                <tr>
                    <td>SI.NO</td>
                    <td>Result Date</td>
                    <td>Sugar Level</td>
                    <td>Pressure Level</td>
                    <td>Cholesterol Level</td>
                    <td>Thyroid Level</td>
                    <td>Pcod Level</td>
                </tr>
                
                    <%  
                int i = 0;
                String selQry = "select * from tbn_health where user_id='"+session.getAttribute("uid")+"'";
                ResultSet rs = con.selectCommand(selQry);
                while (rs.next()) {
                    i++;

            %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("result_date")%></td>
                    <td><%=rs.getString("sugar_level")%></td> 
                    <td><%=rs.getString("pressure_level")%></td>
                    <td><%=rs.getString("cholestrol_level")%></td>
                    <td><%=rs.getString("thyroid_level")%></td>
                    <td><%=rs.getString("pcod_level")%></td>
                </tr>
                 <%

                    }
                %>
            </table>
    </body>
    <%@include file="Foot.jsp" %>
</html>
