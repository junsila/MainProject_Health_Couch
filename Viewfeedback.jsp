<%-- 
    Document   : Viewfeedback
    Created on : 23 Mar, 2023, 11:42:20 AM
    Author     : junsi jun
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Feedback</title>
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <h3><center><u>FEEDBACK</u></center></h3>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td>SI.NO</td>
                    <td>Feedback</td>
                    <td>Date</td>
                    <td>Username</td>
                    
                </tr>
                  <%  
                int i = 0;
                String selQry = "select * from tbn_feedback c inner join tbn_user u on c.user_id=u.user_id";
                ResultSet rs = con.selectCommand(selQry);
                while (rs.next()) {
                    i++;

            %>
                <tr>
                   <td><%=i%></td> 
                   <td><%=rs.getString("feedback_details")%></td>
                   <td><%=rs.getString("feedback_date")%></td>
                   <td><%=rs.getString("user_name")%></td>
                </tr>
                <%
                }
                %>
            </table>
        </form>
            <%@include file="Foot.jsp" %>
    </body>
</html>
