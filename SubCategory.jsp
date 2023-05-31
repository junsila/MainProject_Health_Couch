<%-- 
    Document   : Sub_Category
    Created on : 14 Feb, 2023, 11:08:00 AM
    Author     : junsi jun
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sub_Category</title>
    </head>
    <body>
          <%
            if(request.getParameter("btnsubmit")!=null){
                String Subcategory=request.getParameter("txtsubcategory");
                String Categoryid=request.getParameter("sel_category");
                String insQry="insert into tbn_subcategory(subcategory_name,category_id) values('"+Subcategory+"','"+Categoryid+"')";
                if(con.executeCommand(insQry))
                {
                   %>
                   <script>
                       alert('Inserted');
                       window.location="SubCategory.jsp";
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
            if (request.getParameter("sid") != null) {
            String delQry = "delete from tbn_subcategory where subcategory_id='" + request.getParameter("sid") + "'";
            if (con.executeCommand(delQry)) {

         %>
           <script>
             alert('Deleted');
             window.location="SubCategory.jsp";
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
                    <td>Category Name</td>
                    <td><select name="sel_category">
                            <option>---select---</option>
             <%
                 String selQry="select * from tbn_category";
                 ResultSet rs=con.selectCommand(selQry);
                 while(rs.next())
                 {
                     %>
                     <option value="<%=rs.getString("category_id")%>"><%=rs.getString("category_name")%></option>
                     <%    
                 }
                                
             %>
                        </select></td>
                </tr>
                <tr>
                    <td>
                        Sub Category Name
                    </td>
                    <td>
                        <input type="text" name="txtsubcategory" placeholder="Enter your sub category" required="">
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
                <td>Category</td>
                <td>Sub Category</td>
                <td>Action</td>
            </tr>
                 <%  
                int i = 0;
                String selQry1 = "select * from tbn_subcategory s inner join tbn_category c on s.category_id=c.category_id";
                ResultSet rs1 = con.selectCommand(selQry1);
                while (rs1.next()) {
                    i++;
                
            %>
                 <tr>
                <td><%=i%></td>
                <td><%=rs1.getString("category_name")%></td>
                <td><%=rs1.getString("subcategory_name")%></td>
                <td><a href="SubCategory.jsp?sid=<%=rs1.getString("subcategory_id")%>">Delete</a>
                </td>    
                </tr>
                <%
                  }
                %>
        </table>  
    </body>
</html>
