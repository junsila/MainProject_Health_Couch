<%-- 
    Document   : Place
    Created on : 14 Feb, 2023, 10:58:50 AM
    Author     : junsi jun
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Place</title>
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <%
            if(request.getParameter("btnsubmit")!=null){
                String Place=request.getParameter("txtplace");
                String Pincode=request.getParameter("txtpincode");
                String Distid=request.getParameter("sel_district");
                String insQry="insert into tbn_place(place_name,place_pincode,district_id) values('"+Place+"','"+Pincode+"','"+Distid+"')";
                if(con.executeCommand(insQry))
                {
                   %>
                   <script>
                       alert('Inserted');
                       window.location="Place.jsp";
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
            if (request.getParameter("pid") != null) {
            String delQry = "delete from tbn_place where place_id='" + request.getParameter("pid") + "'";
            if (con.executeCommand(delQry)) {

         %>
           <script>
             alert('Deleted');
             window.location="Place.jsp";
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
            %>
            
        <form method="post">
            <table border="1" align="center"> 
                <tr>
                    <td>District Name</td>
                    <td><select name="sel_district">
                            <option>---select---</option>
                 <%
                   String selQry="select * from tbn_district";
                   ResultSet rs=con.selectCommand(selQry);
                   while(rs.next())
                   {
                       %>
                       <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
                       <%
                   }
                   
                   %>
                        </select></td>
                </tr>
                <tr>
                    <td>
                        Place Name
                    </td>
                    <td>
                        <input type="text" name="txtplace" placeholder="Enter your place" required="" title="Name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Pin code
                    </td>
                    <td>
                        <input type="text" name="txtpincode" placeholder="Enter your pincode" required=""  pattern="[6-6]{1}[0-9]{5}" 
                title="Pincode start with  and remaing 5 digit with 0-9"/></td>>
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
                <td>Place</td>
                <td>Pin code</td>
                <td>Action</td>
            </tr>
                 <%  
                int i = 0;
                String selQry1 = "select * from tbn_place p inner join tbn_district d on p.district_id=d.district_id";
                ResultSet rs1 = con.selectCommand(selQry1);
                while (rs1.next()) {
                    i++;
                
            %>
                 <tr>
                <td><%=i%></td>
                <td><%=rs1.getString("district_name")%></td>
                <td><%=rs1.getString("place_name")%></td>
                <td><%=rs1.getString("place_pincode")%></td>
                <td><a href="Place.jsp?pid=<%=rs1.getString("place_id")%>">Delete</a>
                </td>    
                </tr>
                <%
                  }
                %>
        </table>  
        <%@include file="Foot.jsp" %>
    </body>
</html>
