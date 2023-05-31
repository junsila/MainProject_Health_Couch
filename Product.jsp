<%-- 
    Document   : Product
    Created on : 14 Feb, 2023, 11:11:55 AM
    Author     : junsi jun
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product</title>
    </head>
    <body>
         
        
        <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/ProductAction.jsp">
            <table border="1" align="center"> 
                <tr>
                    <td>Category Name</td>
                    <td><select name="sel_category" onchange="getsubcat(this.value)">
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
                    <td>Sub Category Name</td>
                    <td><select name="sel_subcategory" id="sel_subcategory">
                            <option>---Select---</option>
                            <%
                             String selQry1="select * from tbn_subcategory";
                             ResultSet rs1=con.selectCommand(selQry1);
                             while(rs1.next())
                 {
                     %>
                     <option value="<%=rs1.getString("subcategory_id")%>"><%=rs1.getString("subcategory_name")%></option>
                     <%    
                 }
                                
             %>
                        </select></td>
                </tr>
                <tr>
                    <td>
                        Product Name
                    </td>
                    <td>
                        <input type="text" name="txtproduct" placeholder="Enter product name" required="">
                    </td>
                </tr>
                <tr>
                    <td>
                        Price
                    </td>
                    <td>
                        <input type="text" name="txtprice" placeholder="Enter price" required="">
                    </td>
                </tr>
                <tr>
                    <td>
                        Details
                    </td>
                    <td>
                        <textarea cols="20" rows="5" name="txtdetails" placeholder="Enter details" required=""></textarea>
                    </td>
                </tr>
                <tr>
		    <td>Image</td>
		    <td><input type="file" name="txtimage"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsubmit" value="Submit">
                        <input type="submit" name="btncancel" value="Cancel">
                    </td>
                </tr>
          </table>
        </form>

</html>
<script></script>
<script src="../Assets/Jquery/jQuery.js">
    
</script>
<script>
 function getsubcat(cid)
{
	//alert(cid);
	$.ajax({
	url: "../Assets/AjaxPages/Ajaxsubcat.jsp?cid="+cid,
	 
	  success: function(html){
		$("#sel_subcategory").html(html);
		
	  }
	});
}
</script>


