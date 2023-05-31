<%-- 
    Document   : ViewComplaint
    Created on : 7 Mar, 2023, 3:20:45 PM
    Author     : junsi jun
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint</title>
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <h3><center><u>COMPLAINT</u></center></h3>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td>SI.NO</td>
                    <td>Title</td>
                    <td>Details</td>
                    <td>Date</td>
                    <td>Username</td>
                    <td>Action</td>
                </tr>
                
                  <%  
                int i = 0;
                String selQry = "select * from tbn_complaint c inner join tbn_user u on c.user_id=u.user_id where complaint_status=0";
                ResultSet rs = con.selectCommand(selQry);
                while (rs.next()) {
                    i++;

            %>
                <tr>
                   <td><%=i%></td> 
                   <td><%=rs.getString("complaint_title")%></td>
                   <td><%=rs.getString("complaint_details")%></td>
                   <td><%=rs.getString("complaint_date")%></td>
                   <td><%=rs.getString("user_name")%></td>
                   <td><a href="Reply.jsp?cid=<%=rs.getString("complaint_id")%>">Reply</a></td>
                </tr>
                <%
                }
                %>
            </table>
        </form>
            <%@include file="Foot.jsp" %>
    </body>
</html>
