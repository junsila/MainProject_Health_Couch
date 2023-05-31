<%-- 
    Document   : UserList
    Created on : 20 Feb, 2023, 2:04:49 PM
    Author     : junsi jun
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Accepted User List</title>
        <%@include file="Head.jsp" %>
        <%
                
                  if(request.getParameter("rid")!=null)
            {
                String upQry="update tbn_user set user_status='-1' where user_id='"+request.getParameter("rid")+"'";
                  if(con.executeCommand(upQry))
                {
        %>
        <script>
            alert('Rejected');
            window.location="AcceptedUserList.jsp";
        </script>
        <%
                }
                
            }
        %>
    </head>
    
    <body>
        <h3><u><center>ACCEPTED USER LIST</center></u></h3>
        <table border="1" align="center">
            <tr>
                <td>
                    Photo
                </td>
                <td>
                    Name
                </td>
                <td>
                    Contact
                </td>
                <td>
                    Email
                </td>
                <td>
                    Gender
                </td>
                <td>
                    District
                </td>
                <td>
                    Place
                </td>
                <td>
                    Address
                </td>
                <td>
                    DOB
                </td>
                <td>
                    Action
                </td>
            </tr>

            <%

                String selQry = "select * from tbn_user u inner join tbn_place p on u.place_id=p.place_id inner join tbn_district d on p.district_id=d.district_id where user_status=1";
                ResultSet rs = con.selectCommand(selQry);

                while (rs.next()) {


            %>

            <tr>
                <td><img src="../Assets/Files/UserPhoto/<%=rs.getString("user_photo")%>" height="120" width="120"></td>
                <td><%=rs.getString("user_name")%></td>
                <td><%=rs.getString("user_contact")%></td>
                <td><%=rs.getString("user_email")%></td>
                <td><%=rs.getString("user_gender")%></td>
                <td><%=rs.getString("district_name")%></td>
                <td><%=rs.getString("place_name")%></td>
                <td><%=rs.getString("user_address")%></td>
                <td><%=rs.getString("user_dob")%></td>
                <td>
                    <a href="AcceptedUserList.jsp?rid=<%=rs.getString("user_id")%>">Reject</a>
                </td>
            </tr>
            <%

                }

            %>

        </table>
            <%@include file="Foot.jsp" %>
    </body>
</html>
