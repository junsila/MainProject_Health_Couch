<%-- 
    Document   : Viewdietplan
    Created on : 23 Mar, 2023, 11:22:48 AM
    Author     : junsi jun
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Diet Plan</title>
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <form>
             <table border="1" align="center">
                <tr>
                    <td>SI.NO</td>
                    <td>Sugar</td>
                    <td>Pressure</td>
                    <td>Cholesterol</td>
                    <td>Thyroid</td>
                    <td>Pcod</td>
                    <td>Plan</td>
                </tr>
                <%
                    int i=0;
                    String selQry="select * from tbn_diet ";
                    ResultSet rs=con.selectCommand(selQry);
                    while(rs.next()){
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("sugar_min")%> - <%=rs.getString("sugar_max")%></td>
                    <td><%=rs.getString("pressure_min")%> - <%=rs.getString("pressure_max")%></td>
                    <td><%=rs.getString("cholesterol_min")%> - <%=rs.getString("cholesterol_max")%></td>
                    <td><%=rs.getString("thyroid_min")%> - <%=rs.getString("thyroid_max")%></td>
                    <td><%=rs.getString("pcod_min")%> - <%=rs.getString("pcod_max")%></td>
                    <td><%=rs.getString("diet_plan")%></td>
                </tr>
                <%
                    }
                %>
            </table>
        </form>
            <%@include file="Foot.jsp" %>
    </body>
</html>
