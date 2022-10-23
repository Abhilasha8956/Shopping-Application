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
            <div class="container-fluid" style="height: fit-content; background-color: rgba(0, 0, 0, 0.2)">
                <div class="row h-100">
                    <div class="col-lg-2 col-md-6 col-sm-12 h-100 d-flex align-item-center mt-2 ml-2">
                        <a href="HomePage.html" class="ml-2"><img src="download.jpeg" class="mx-auto" style="height: 60px" /></a>
                    </div>
                    <div class="col-lg-8 col-md-6 col-sm-12 h-100 d-flex align-item-center">
                        <ul class="text-white list-inline m-0 mx-auto" style="padding: 10px">
                            <li class="list-inline-item h5 border border-success p-3 ml-2"><a href="HomePage.html" class="link-light text-decoration-none">Home</a></li>
                            <li class="list-inline-item h5 border border-success p-3 ml-2"><a href="listProduct_User.jsp" class="link-light text-decoration-none">Products</a></li>
                            <li class="list-inline-item h5 border border-success p-3 ml-2"><a href="MyOrders.jsp" class="link-light text-decoration-none">My Orders</a></li>
                            <li class="list-inline-item h5 border border-success text-decoration-underline p-3 ml-2"><a href="#" class="link-light text-decoration-none">Go to Cart</a></li>
                            <li class="list-inline-item h5 border border-success p-3 ml-2"><a href="#" class="link-light text-decoration-none">Help</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-2 col-md-12 col-sm-12 h-100 d-flex align-item-center">
                        <a class="link-dark"  href="ProfilePage.jsp"><img src="download (1).png" class="mx-auto border border-danger rounded" style="height: 60px" /></a>
                        <a class="btn btn-light border border-danger rounded form-control link-dark"  href="index.html"><b>Logout</b></a>
                    </div>
                </div>
            </div>
            
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
            
            <div>
                <footer
                    style="height:120px;position: relative; bottom: 0; width: 100%; background-color: rgba(0, 0, 0, 0.2) ;color: white;">
                    <div class="d-inline-block" style="margin-left: 100px; margin-bottom: 50px; ">
                        <table class="table-responsive">
                            <tr>
                                <td rowspan="2">Contact Us: </td>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td>+91 897****767</td>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td>
                                    <a href="https://mail.google.com/mail/?view=cm&fs=1&tf=1&to=22MCA083@charusat.edu.org"
                                    class="link-light" target="_blank">22MCA083@charusat.edu.org</a><br>
                                    <a href="https://mail.google.com/mail/?view=cm&fs=1&tf=1&to=22MCA138@charusat.edu.org"
                                    class="link-light" target="_blank">22MCA138@charusat.edu.org</a>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="d-inline-block" style="margin-left: 550px;">
                        <p><a href="https://www.instagram.com/__hot_cupid1427/" class="link-light"
                            target="_blank">Abhilasha Patel</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="https://www.instagram.com/_amiruddin_samlayawala_03/" class="link-light"
                               target="_blank">Amiruddin I. Samlayawala</a><br>
                            Enterprise Computing Using Java<br>
                            Dr. Mittal Desai
                        </p>
                    </div>
                </footer>
            </div>   
        </div>
    </body>
</html>