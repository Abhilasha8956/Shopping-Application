
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs_project","root","");
                Statement st = con.createStatement();
                String btn = request.getParameter("abc");
                
                if(btn.equals("Remove From Cart"))
                { 
                    String cid = request.getParameter("cid");
                    int a = st.executeUpdate("Delete From `cart` where C_ID = '"+cid+"'");
                    if(a<0)
                    {
                        response.sendRedirect("listProduct_User.jsp");
                    }
                    else{
                        response.sendRedirect("MainCart.jsp");
                    }
                }
                else if(btn.equals("+"))
                {
                    String cid = request.getParameter("cid");
                    int qty = Integer.parseInt(request.getParameter("pqty"));
                    qty=qty+1;
                    int a = st.executeUpdate("Update `cart` set C_PQTY = '"+qty+"' where C_ID = '"+cid+"'");
                    if(a<0)
                    {
                        response.sendRedirect("MainCart.jsp");
                    }
                    else{
                        response.sendRedirect("MainCart.jsp");
                    }
                }
                else if(btn.equals("-"))
                {
                    String cid = request.getParameter("cid");
                    int qty = Integer.parseInt(request.getParameter("pqty"));
                    qty=qty-1;
                    int a = st.executeUpdate("Update `cart` set C_PQTY = '"+qty+"' where C_ID = '"+cid+"'");
                    if(a<0)
                    {
                        response.sendRedirect("MainCart.jsp");
                    }
                    else{
                        response.sendRedirect("MainCart.jsp");
                    }
                }
                else if(btn.equals("Book Order Now"))
                {
                    %>
                    <!DOCTYPE html>
                    <html>
                        <head>
                            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                            <title>Place Your Order</title>
                            <meta name="viewport" content="width=device-width, initial-scale=1" />
                            <link rel="stylesheet" type="text/css" media="screen" href="bootstrap-5.0.0-beta1-dist/css/bootstrap.css" />
                            <script src="bootstrap-5.0.0-beta1-dist/js/bootstrap.js"></script>
                        </head>
                        <body style="background-image: url(image.jpg); height: inherit">
                        <div class="mycontainer" style="align-items: center;">
                            <div class="box" style="height: 450px;
                            width: 500px;
                            background-color: rgba(0, 0, 0, 0.2) ;
                            color: white;
                            margin: 0 auto; ">
                                <p class="h1 w-100" style="text-align: center; color: red">Order Details</p>
                                <hr class="w-75 center" style="margin: auto;">

                                <form class="form-group m-5" method="Post" action="addOrder" autocomplete="off">
                                    <%
                                    String cid = request.getParameter("cid");
                                    int qty = Integer.parseInt(request.getParameter("pqty"));
                                    ResultSet rs = st.executeQuery("Select * From `cart` where C_ID = '"+cid+"'");
                                    while(rs.next())
                                    {
                                        %>
                                    <center>
                                        <table>
                                            <tr>
                                                <td>
                                                    <input type="hidden" value="<%= rs.getInt(1) %>"  name='cid'>
                                                    <b><u>Product Name</u></b>&nbsp;
                                                </td>
                                                <td>
                                                     <%= rs.getString(8) %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b><u>Product Description</u></b>&nbsp;
                                                </td>
                                                <td>
                                                    <%= rs.getString(3) %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b><u>Product Seller</u></b>&nbsp;
                                                </td>
                                                <td>
                                                    <%= rs.getString(6) %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b><u>Product Quantity</u></b>&nbsp;
                                                </td>
                                                <td>
                                                    <%= rs.getInt(4) %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b><u>Product Price</u></b>&nbsp;
                                                </td>
                                                <td>
                                                    <%= rs.getInt(5) %>
                                                </td>
                                            </tr>
                                        </table>
                                        <hr>
                                        <table>
                                            <tr>
                                                <td class="h4">
                                                    <b>Total Amount&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>
                                                </td>
                                                <td class="h4">
                                                    <b><%= rs.getInt(4)* rs.getInt(5) %></b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input class="btn btn-danger p-2 m-5" type="submit" value="Place Order">
                                                </td>
                                            </tr>
                                        </table>
                                    </center>                            
                                        <%
                                    }
                                    %>
                                </form>
                            </div>
                        </div>
                        
                        <jsp:include page="UserFooter.jsp" />
                            
                    <%
                }

            
        %>
    </body>
</html>
