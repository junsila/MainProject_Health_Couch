<%-- 
    Document   : Reply
    Created on : 7 Mar, 2023, 3:30:48 PM
    Author     : junsi jun
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reply</title>
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <%
            if(request.getParameter("btnsubmit")!=null)
            {
                String Reply=request.getParameter("txtreply");
                String upQry="update tbn_complaint set complaint_status=1,complaint_reply='"+Reply+"' where complaint_id='"+request.getParameter("cid")+"'";
                if(con.executeCommand(upQry))
                {
                    
                    %>
                    <script>
                        alert('Updated');
                        window.location="Reply.jsp";
                    </script>
                    <% 
                }
                else 
                {
                    %>
                    <script>
                        alert('Failed');
                        window.location="Reply.jsp";
                    </script>
                    <%
                }
                
            }
        %>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td>Reply</td>
                    <td><textarea cols="20" rows="5" name="txtreply" placeholder="Enter reply"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsubmit" value="Submit">
                        <input type="reset" name="btnreset" value="Reset"></td>
                </tr>
            </table>
        </form>
        <%@include file="Foot.jsp" %>
    </body>
</html>
