<%-- 
    Document   : Complaint
    Created on : 7 Mar, 2023, 2:29:37 PM
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
        <%
            if(request.getParameter("btnsubmit")!=null)
            {
                String Title=request.getParameter("txttitle");
                String Details=request.getParameter("txtdetails");
                
                String InsQry="insert into tbn_complaint(complaint_title,complaint_details,complaint_date,user_id) values('"+Title+"','"+Details+"',curdate(),'"+session.getAttribute("uid")+"')";
                 if (con.executeCommand(InsQry)) {
        %>
        <script>
            alert('Inserted');
            window.location = "Complaint.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert('Failed');
            window.location = "Complaint.jsp";
        </script>
        <%
                }
            }
        %>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td>Title</td>
                    <td><input type="text" name="txttitle" placeholder="Enter title of complaint"></td>
                </tr>
                <tr>
                    <td>Details</td>
                    <td><textarea cols="20" rows="5" name="txtdetails" placeholder="Enter details of complaint"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsubmit" value="Submit"></td>
                </tr>
            </table>
            <table border="1" align="center">
                <tr>
                    <td>SI.NO</td>
                    <td>Title</td>
                    <td>Details</td>
                    <td>Date</td>
                    <td>Reply</td>
                </tr>
                  <%  
                int i = 0;
                String selQry = "select * from tbn_complaint where user_id='"+session.getAttribute("uid")+"'";
                ResultSet rs = con.selectCommand(selQry);
                while (rs.next()) {
                    i++;

            %>
                <tr>
                   <td><%=i%></td> 
                   <td><%=rs.getString("complaint_title")%></td>
                   <td><%=rs.getString("complaint_details")%></td>  
                   <td><%=rs.getString("complaint_date")%></td>
                   <td><%=rs.getString("complaint_reply")%></td>
                </tr>
                <%
                }
                %>
            </table>
        </form>
            <%@include file="Foot.jsp" %>
    </body>
</html>
 