<%-- 
    Document   : Diet
    Created on : 8 Mar, 2023, 10:38:48 AM
    Author     : junsi jun
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Diet</title>
        
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <%
            if(request.getParameter("btnsubmit")!=null)
            {
                String Sugarmin = request.getParameter("txtsugarmin");
                String Sugarmax = request.getParameter("txtsugarmax");
                String Pressuremin = request.getParameter("txtpressuremin");
                String Pressuremax = request.getParameter("txtpressuremax");
                String Cholesterolmin = request.getParameter("txtchomin");
                String Cholesterolmax = request.getParameter("txtchomax");
                String Thyroidmin = request.getParameter("txtthyroidmin");
                String Thyroidmax = request.getParameter("txtthyroidmax");
                String Pcodmin = request.getParameter("txtpcodmin");
                String Pcodmax = request.getParameter("txtpcodmax");
                String Dietplan = request.getParameter("txtdiet");
                String Exerciseplan = request.getParameter("txtexercise");
                
                
                String inQry = "insert into tbn_diet(sugar_min,sugar_max,pressure_min,"
                        + "pressure_max,cholesterol_min,cholesterol_max,thyroid_min,thyroid_max,pcod_min,pcod_max,diet_plan,exercise_plan) "
                        + "values('" + Sugarmin + "','" + Sugarmax + "','" + Pressuremin + "','" + Pressuremax + "','" + Cholesterolmin + "',"
                        + "'" + Cholesterolmax + "','" + Thyroidmin + "','" + Thyroidmax + "','" + Pcodmin + "','" + Pcodmax + "','"+ Dietplan+"','"+Exerciseplan+"')";
                    
                if (con.executeCommand(inQry)) {
        %>
        <script>
            alert('Inserted');
            window.location = "Diet.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert('Failed');
            window.location = "Diet.jsp";
        </script>
        <%
                }
                
            }    
            if (request.getParameter("did") != null) {
            String delQry = "delete from tbn_diet where diet_id='" + request.getParameter("did") + "'";
            if (con.executeCommand(delQry)) {

         %>
           <script>
             alert('Deleted');
             window.location="Diet.jsp";
            </script>
    <% 
            } else {
    %>
            <script>
              alert('Failed');
              window.location="Diet.jsp";
            </script>
    <%
                }
            }
            
        %>
        <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/DietAction.jsp">
            <table border="1" align="center">
                <tr>
                    <td>Sugar Minimum</td>
                    <td><input type="text" name="txtsugarmin" placeholder="Enter sugar minimum"></td>
                </tr>
                <tr>
                    <td>Sugar Maximum</td>
                    <td><input type="text" name="txtsugarmax" placeholder="Enter sugar maximum"></td>
                </tr>
                <tr>
                    <td>Pressure Minimum</td>
                    <td><input type="text" name="txtpressuremin" placeholder="Enter pressure minimum"></td>
                </tr>  
                <tr>
                    <td>Pressure Maximum</td>
                    <td><input type="text" name="txtpressuremax" placeholder="Enter pressure maximum"></td>
                </tr>  
                <tr>
                    <td>Cholesterol Minimum</td>
                    <td><input type="text" name="txtchomin" placeholder="Enter cholesterol minimum"></td>
                </tr>
                <tr>
                    <td>Cholesterol Maximum</td>
                    <td><input type="text" name="txtchomax" placeholder="Enter cholesterol maximum"></td>
                </tr>
                <tr>
                    <td>Thyroid Minimum</td>
                <td><input type="text" name="txtthyroidmin" placeholder="Enter thyroid minimum"></td>
                </tr>     
                <tr>
                    <td>Thyroid Ma</td>
                    <td><input type="text" name="txtthyroidmax" placeholder="Enter thyroid maximum"></td>
                </tr>
                <tr>
                    <td>Pcod Minimum</td>
                    <td><input type="text" name="txtpcodmin" placeholder="Enter pcod minimum"></td>
                </tr>
                <tr>
                    <td>Pcod Maximum</td>
                    <td><input type="text" name="txtpcodmax" placeholder="Enter pcod maximum"></td>
                </tr>
                <tr>
                    <td>Diet Plan</td>
                    <td><input type="file" name="diet" ></td>
                </tr>
                <tr>
                    <td>Exercise Plan</td>
                    <td><input type="file" name="exercise" ></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsubmit" value="Submit">
                        <input type="reset" name="btnreset" value="Reset"></td>
                </tr>
            </table>
            <table border="1" align="center">
                <tr>
                    <td>SI.NO</td>
                    <td>Sugar Level</td>
                    <td>Pressure Level</td>
                    <td>Cholesterol Level</td>
                    <td>Thyroid Level</td>
                    <td>Pcod Level</td>
                    <td>Diet Plan</td>
                    <td>Exercise Plan</td>
                    <td>Action</td>
                </tr>
                <%
                    int i=0;
                    String selQry="select * from tbn_diet";
                    ResultSet rs=con.selectCommand(selQry);
                    while(rs.next()){
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("sugar_min")%> - <%=rs.getString("sugar_max")%></td>
                    <td><%=rs.getString("pressure_min")%> - <%=rs.getString("pressure_max")%></td>
                    <td><%=rs.getString("cholesterol_min")%> - <%=rs.getString("cholesterol_max")%></td>
                    <td><%=rs.getString("thyroid_min")%> - <%=rs.getString("thyroid_max")%></td>
                    <td><%=rs.getString("pcod_min")%> - <%=rs.getString("pcod_max")%></td>
                    <td><%=rs.getString("diet_plan")%></td>
                    <td><%=rs.getString("exercise_plan")%></td>
                    <td><a href="Diet.jsp?did=<%=rs.getString("diet_id")%>">Delete</a></td>
                </tr>
                <%
                    }
                %>
            </table>
        </form>
            <%@include file="Foot.jsp" %>
    </body>
</html>
