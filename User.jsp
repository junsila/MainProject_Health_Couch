<%-- 
    Document   : User
    Created on : 15 Feb, 2023, 2:03:51 PM
    Author     : junsi jun
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Registration</title>
    </head>
    <body>
        
        <%@include file="Head.jsp" %>
        <h1>USER REGISTRATION</h1>
        <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/UserAction.jsp">
            
            <table border="1" align="center">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname" placeholder="Enter your name" required title="Name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$"/></td>
                </tr>
                 <tr>
                    <td>Contact</td>
                    <td><input type="text" name="txtcontact" placeholder="Enter your number" required  pattern="[7-9]{1}[0-9]{9}" 
                title="Phone number with 7-9 and remaing 9 digit with 0-9"/></td>></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="txtemail" placeholder="Enter your Email" required></td>
                </tr>
                 <tr>
                    <td>Gender</td>
                    <td><input type="radio" name="txtgender" value="male">Male
                        <input type="radio" name="txtgender" value="female">Female</td>
                </tr>
                <tr>
                    <td>District</td>
                    <td><select name="seldistrict" onchange="getplace(this.value)">
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
                    <td>Place</td>
                    <td><select name="selplace" id="selplace">
                            <option>---select---</option>
                            <%
                                String selQry1="select * from tbn_place";
                                ResultSet rs1=con.selectCommand(selQry1);
                                while(rs1.next())
                                {
                                    %>
                                    <option value="<%=rs1.getString("place_id")%>"><%=rs1.getString("place_name")%></option>
                                    <%
                                }
                                %>
                        </select></td>
                </tr>
                <tr>
                    <td>
                        Address
                    </td>
                    <td>
                        <textarea cols="20" rows="5" name="txtaddress" placeholder="Enter your address" required="" ></textarea>
                    </td>
                </tr>
                <tr>
                    <td>Date of Birth</td>
                    <td><input type="date" name="txtdob" required=""></td>
                </tr>
                <tr>
                    <td>Photo</td>
                    <td><input type="file" name="photo"></td>
                </tr>
                 <tr>
                    <td>Password</td>
                    <td><input type="password" name="txtpassword"></td>
                </tr>
                 <tr>
                    <td>Confirm Password</td>
                    <td><input type="password" name="txtcpassword"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="txtsubmit" value="Save">
                        <input type="reset" name="txtcancel" value="Reset"></td>
                </tr>
            </table>      
        </form>	
                        <%@include file="Foot.jsp" %>
    </body>
</html>

<script></script>
<script src="../Assets/Jquery/jQuery.js">
</script>
<script>
    function getplace(did)
{
	//alert(did);
	$.ajax({
	url: "../Assets/AjaxPages/Ajaxplace.jsp?did="+did,
	 
	  success: function(html){
		$("#selplace").html(html);
		
	  }
	});
}
</script>