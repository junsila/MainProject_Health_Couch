<%-- 
    Document   : Feedback
    Created on : 23 Mar, 2023, 11:35:11 AM
    Author     : junsi jun
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback</title>
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <%
            if(request.getParameter("btnsubmit")!=null)
            {
                String Title=request.getParameter("txttitle");
                String Details=request.getParameter("txtdetails");
                
                String InsQry="insert into tbn_feedback(feedback_title,feedback_details,feedback_date,user_id) values('"+Title+"','"+Details+"',curdate(),'"+session.getAttribute("uid")+"')";
                 if (con.executeCommand(InsQry)) {
        %>
        <script>
            alert('Inserted');
            window.location = "Feedback.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert('Failed');
            window.location = "Feedback.jsp";
        </script>
        <%
                }
            }
        %>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td>Details</td>
                    <td><textarea cols="20" rows="5" name="txtdetails" placeholder="Enter feedback"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsubmit" value="Submit"></td>
                </tr>
            </table>
            <table border="1" align="center">
                <tr>
                    <td>SI.NO</td>
                    <td>Feedback</td>
                    <td>Date</td>
                    
                </tr>
                  <%  
                int i = 0;
                String selQry = "select * from tbn_feedback where user_id='"+session.getAttribute("uid")+"'";
                ResultSet rs = con.selectCommand(selQry);
                while (rs.next()) {
                    i++;

            %>
                <tr>
                   <td><%=i%></td> 
                   <td><%=rs.getString("feedback_details")%></td>  
                   <td><%=rs.getString("feedback_date")%></td>
                   
                </tr>
                <%
                }
                %>
            </table>
        </form>
            <%@include file="Foot.jsp" %>
    </body>
</html>
