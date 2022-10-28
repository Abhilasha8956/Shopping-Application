<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Home Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" type="text/css" media="screen" href="bootstrap-5.0.0-beta1-dist/css/bootstrap.css" />
    <script src="bootstrap-5.0.0-beta1-dist/js/bootstrap.js"></script>
</head>
    <body style="background-image: url(image.jpg); height: inherit">
        <div>
            <jsp:include page="UserHeader.jsp" />
            
            <div style="min-height: 520px; padding-bottom: 10px">
                <h2 class="text-decoration-underline text-white text-center" style="font-family: montserrat;">MY CART</h2>
                <%
                    
                            HttpSession sn = request.getSession(false);
                            String ab = sn.getAttribute("uid").toString();
                
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs_project","root","");
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery("Select * from `cart` where uid = '"+ab+"'");
                            int temp,row_count=0;
                            temp = 0;
                            while(rs.next())
                            {
                                temp++;
                            }
                            if(temp<1){
                                %>
                                <hr class="w-75 text-light">
                                <center><h4 class="text-light d-inline-block text-center">Item Not is Added In Your Cart, &nbsp;&nbsp;&nbsp;<b><a href="listProduct_User.jsp" class="link-danger d-inline-block">Add Items.</a></b></h4></center>
                                <hr class="w-75 text-light">
                                <%
                            }
                            else {
                            %>
                            <center>                                    
                                <table class="table table-responsive border table-striped text-center">
                                    <thead>
                                        <th>Serial Number</th>
                                        <th>Product Name</th>
                                        <th>Product Description</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Product Seller</th>
                                        <th>Action</th>
                                        <th>Action</th>
                                    </thead>
                                    <%
                                        int sum = 0;
                                    ResultSet rs2 = st.executeQuery("Select * from `cart` where uid = '"+ab+"'");
                                    int tempor=0;
                                        while(rs2.next())
                                        { tempor++;
                                            %>
                                            <form method="Post" action="ManageCart.jsp">
                                                <tr class="text-white">
                                                    <td><%= tempor %></td>
                                                    <td>
                                                        <input type="hidden" value="<%= rs2.getString(8) %>" name="pname">
                                                        <%= rs2.getString(8) %>
                                                    </td>
                                                    <td>
                                                        <input type="hidden" value="<%= rs2.getString(3) %>" name="pdesc">
                                                        <%= rs2.getString(3) %>
                                                    </td>
                                                    <td>
                                                        <input type="hidden" value="<%= rs2.getInt(5) %>" name="pprice">
                                                        <%= rs2.getInt(5) %>
                                                    </td>
                                                    <td>
                                                        <input type="hidden" value="<%= rs2.getInt(4) %>" name="pqty">
                                                        <input type="text" id="qty" class="p-1 m-1 w-25" value="<%= rs2.getInt(4) %>" >
                                                        <input type="submit" class="btn btn-primary m-1" value="+" name="abc">
                                                        <input type="submit" class="btn btn-danger m-1" value="-" name="abc">
                                                    </td>
                                                    <td>
                                                        <input type="hidden" value="<%= rs2.getString(6) %>" name="pseller">
                                                        <input type="hidden" value="<%= rs2.getString(7) %>" name="cat">
                                                        <%= rs2.getString(6) %>
                                                    </td>

                                                        <input type="hidden" value="<%= rs2.getInt(2) %>" name="pid">
                                                        <input type="hidden" value="<%= rs2.getInt(1) %>" name="cid">
                                                    <td>
                                                        <input class="btn btn-primary w-75" type="submit" name="abc" value="Book Order Now">
                                                    </td> 
                                                    <td>
                                                        <input class="btn btn-danger w-75" type="submit" name="abc" value="Remove From Cart">
                                                    </td>
                                                </tr>
                                                <tr class="text-light   ">
                                                    <td colspan="6">
                                                        
                                                    </td>
                                                    <td>
                                                        Total Amount
                                                    </td>
                                                        <%
                                                            int amount = rs2.getInt(5)*rs2.getInt(4);
                                                        %>
                                                    <td>
                                                        <%= amount %>
                                                    </td>
                                                </tr>
                                            </form>
                                            <%
                                        }
                                    }
                                        %>
                            </center>
                        </table>
            </div>
            
            <jsp:include page="UserFooter.jsp" />
            
        </div>
    </body>
</html>