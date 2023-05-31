<%-- 
    Document   : District
    Created on : 14 Feb, 2023, 10:53:11 AM
    Author     : junsi jun
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>District</title>
    </head>
    <body>
        <%@include file="Head.jsp" %>
    <%
        if (request.getParameter("btnsubmit") != null) {
            String District = request.getParameter("txtdistrict");
            String DistrictID=request.getParameter("txthid");
            String selQry1="select * from tbn_district where district_name='"+District+"'";

            ResultSet rs1=con.selectCommand(selQry1);
            if(rs1.next())  

            {

                %>

                <script>

                    alert('District already exist');

                </script>

                <%

            }

            else if (DistrictID.equals(""))
            {
            String insQry = "insert into tbn_district(district_name) values('" + District + "')";
            if (con.executeCommand(insQry))
            {
        %>
            <script>
              alert('inserted');
            </script>
        <%
    } 
            else {
        %>
            <script>
               alert('Failed');
            </script>
     <%
        }
        }
            else {
                String upQry="update tbn_district set district_name='"+ District+"' where district_id='"+DistrictID+"'";
                if(con.executeCommand(upQry))
                {
                    %>
                    <script>
                        alert('Updated');
                    </script>
                    <% 
                }
                else 
                {
                    %>
                    <script>
                        alert('Failed');
                    </script>
                    <%
                }
            }
        }
        
        if (request.getParameter("did") != null) {
            String delQry = "delete from tbn_district where district_id='" + request.getParameter("did") + "'";
            if (con.executeCommand(delQry)) {

         %>
           <script>
             alert('Deleted');
            </script>
    <% 
            } else {
    %>
            <script>
              alert('Failed');
            </script>
    <%
                }
            }
        String eid="",ename="";
        if(request.getParameter("eid")!=null)
        {
            eid=request.getParameter("eid");
            ename=request.getParameter("ename");
        }
    %>



           <form method="post">
            <table border="1" align="center">
                <tr>
                    <td>
                        District Name
                    </td>
                    <td>
                        <input type="hidden" name="txthid" value="<%=eid%>">
                        <input type="text" name="txtdistrict" placeholder="Enter your district" required="" value="<%=ename%>"title="Name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsubmit" value="Submit">
                        <input type="submit" name="btncancel" value="Cancel">
                    </td>
                </tr>
            </table>
        </form>
        <table border="1" align="center">
            <tr>
                <td>SI.NO</td>
                <td>District</td>
                <td>Action</td>
            </tr>
            <%  
                int i = 0;
                String selQry = "select * from tbn_district";
                ResultSet rs = con.selectCommand(selQry);
                while (rs.next()) {
                    i++;

            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("district_name")%></td>
                <td><a href="District.jsp?did=<%=rs.getString("district_id")%>">Delete</a>
                    <a href="District.jsp?eid=<%=rs.getString("district_id")%>&ename=<%=rs.getString("district_name")%>">Edit</a>
                </td>    
                </tr>
                <%

                    }
                %>

        </table>  
                <%@include file="Foot.jsp" %>
    </body>
</html>

