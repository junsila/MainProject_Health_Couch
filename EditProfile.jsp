<%-- 
    Document   : EditProfile
    Created on : 21 Feb, 2023, 12:07:31 PM
    Author     : junsi jun
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <%
            String selQry="select * from tbn_user where user_id='"+session.getAttribute("uid")+"'";
            ResultSet rs=con.selectCommand(selQry);
            rs.next();
            if(request.getParameter("btnupdate")!=null)
            {
                String upQry="update tbn_user set user_name='"+request.getParameter("txtname")+"' , user_contact='"+request.getParameter("txtcontact")+"' , user_address='"+request.getParameter("txtaddress")+"' where user_id='"+session.getAttribute("uid")+"'";
                if(con.executeCommand(upQry))
                {
        %>
        <script>
            alert('Updated');
            window.location="EditProfile.jsp";
        </script>
        <%
                }
                else
                {
        %>
        <script>
            alert('Failed');
            window.location="EditProfile.jsp";
        </script>
        <%
                }
            }
        
        %>
        <h3><center><u>Edit Profile</u></center></h3>
         <form method="post">
             <table border="1" align="center">
                 <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname" value="<%=rs.getString("user_name")%>"></td>
                </tr>
                 <tr>
                    <td>Contact</td>
                    <td><input type="text" name="txtcontact" value="<%=rs.getString("user_contact")%>"></td>
                </tr>
                <tr>
                    <td>
                        Address
                    </td>
                    <td>
                        <textarea cols="20" rows="5" name="txtaddress"><%=rs.getString("user_address")%></textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnupdate" value="Update">
                    </td>
                </tr>
                
             </table>
         </form>
                    <%@include file="Foot.jsp" %>
    </body>
</html>
