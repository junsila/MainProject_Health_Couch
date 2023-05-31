<%-- 
    Document   : MyProfile
    Created on : 16 Feb, 2023, 2:05:46 PM
    Author     : junsi jun
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Profile</title>
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <%
            String selQry="select * from tbn_user u inner join tbn_place p on u.place_id=p.place_id inner join tbn_district d on p.district_id=d.district_id "
                    + "where user_id='"+session.getAttribute("uid")+"'";
            ResultSet rs=con.selectCommand(selQry);
            rs.next();
            
            
        %>
        <h3><center><u>My Profile</u></center></h3>
         <form method="post">
            <table border="1" align="center">
                <tr>
                    <td>Photo</td>
                    <td><img src="../Assets/Files/UserPhoto/<%=rs.getString("user_photo")%>" height="120" width="120"></td>
                    
                </tr>
                <tr>
                    <td>Name</td>
                    <td><%=rs.getString("user_name") %></td>
                </tr>
                 <tr>
                    <td>Contact</td>
                    <td><%=rs.getString("user_contact") %></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><%=rs.getString("user_email") %></td>
                </tr>
                 <tr>
                    <td>Gender</td>
                    <td><%=rs.getString("user_gender") %></td>
                </tr>
                <tr>
                    <td>District</td>
                    <td><%=rs.getString("district_name") %></td>
                </tr>
                
                 <tr>
                    <td>Place</td>
                    <td><%=rs.getString("place_name") %></td>
                </tr>
                <tr>
                    <td>
                        Address
                    </td>
                    <td><%=rs.getString("user_address") %></td>
                <tr>
                    <td>Date of Birth</td>
                    <td><%=rs.getString("user_dob") %></td>
                </tr>
            </table>      
        </form>	
                <%@include file="Foot.jsp" %>
    </body>
</html>
