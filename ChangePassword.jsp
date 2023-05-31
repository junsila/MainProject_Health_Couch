<%-- 
    Document   : ChangeProfile
    Created on : 21 Feb, 2023, 2:57:34 PM
    Author     : junsi jun
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <%
            if(request.getParameter("btnsubmit")!=null)
            {
                String dbPassword="";
                String selQry="select * from tbn_user where user_id='"+session.getAttribute("uid")+"'";
                ResultSet rs=con.selectCommand(selQry);
                if(rs.next())
                {
                    dbPassword=rs.getString("user_password");
                }
                String curPassword=request.getParameter("txtpswd");
                String newPassword=request.getParameter("txtnpswd");
                String conPassword=request.getParameter("txtcpswd");
                
                if(dbPassword.equals(curPassword))
                {
                    if(newPassword.equals(conPassword))
                    {
                         String upQry="update tbn_user set user_password='"+request.getParameter("txtnpswd")+"' where user_id='"+session.getAttribute("uid")+"'";
                         if(con.executeCommand(upQry))
                           {
                    %>
                    <script>
                        alert('Password changed successfully');
                        window.location="ChangePassword.jsp";
                    </script>
                    <%
                }
                                                                 
                else{
                    %>
                    <script>
                        alert('Failed');
                        window.location="ChangePassword.jsp";
                    </script>
                    <%
                }
            } else{
                        %>
                        <script>
                            alert('New Password Mismatched');
                            window.location="ChangePassword.jsp";
                        </script>
                        <%
                    }
                }
                else{
                    %>
                    <script>
                        alert('Current Password Mismatched');
                        window.location="ChangePassword.jsp";
                    </script>
                    <%
                }
            }
                    
        %>
        <h3><center><u>Change Password</u></center></h3>
         <form method="post">
             <table border="1" align="center">
                 <tr>
                    <td>Current Password</td>
                    <td><input type="password" name="txtpswd" placeholder="Enter current password" required></td>
                </tr>
                 <tr>
                    <td>New Password</td>
                    <td><input type="password" name="txtnpswd" placeholder="Enter new password" required ></td>
                </tr>
                <tr>
                    <td>Confirm Password</td>
                    <td><input type="password" name="txtcpswd" placeholder="Re-enter your password" required></td>

                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsubmit" value="Submit">
                        <input type="reset" name="btnreset" value="Reset">                        
                    </td>
                </tr>
                
             </table>
         </form>
         <%@include file="Foot.jsp" %>
    </body>
</html>
