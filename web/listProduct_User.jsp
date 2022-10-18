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
                            <li class="list-inline-item h5 border border-success text-decoration-underline p-3 ml-2"><a href="#" class="link-light text-decoration-none">Products</a></li>
                            <li class="list-inline-item h5 border border-success p-3 ml-2"><a href="#" class="link-light text-decoration-none">My Orders</a></li>
                            <li class="list-inline-item h5 border border-success p-3 ml-2"><a href="MainCart.jsp" class="link-light text-decoration-none">Go to Cart</a></li>
                            <li class="list-inline-item h5 border border-success p-3 ml-2"><a href="#" class="link-light text-decoration-none">Help</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-2 col-md-12 col-sm-12 h-100 d-flex align-item-center">
                        <a class="link-dark"  href="ProfilePage.jsp"><img src="download (1).png" class="mx-auto border border-danger rounded" style="height: 60px" /></a>
                        <a class="btn btn-light border border-danger rounded form-control link-dark"  href="index.html"><b>Logout</b></a>
                    </div>
                </div>
            </div>
            <div style="min-height: fit-content; padding-bottom: 10px">
                <h2 class="text-decoration-underline text-white text-center" style="font-family: montserrat;">PRODUCTS</h2>
                <h6 class="text-left text-white h5 d-inline" style="margin-left: 200px"><a a href="AddPro.jsp" class="link-light text-decoration-none">Add Product</a></h6>
                <h5 class="text-left text-white h-3 d-inline" style="margin-left: 600px">Add Product: 
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <select>
                        <option disabled="" selected="">Select Category</option>
                            <%
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs_project","root","");
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery("Select * from `categories`");
                                while(rs.next()){
                                    %>
                                    <option value="<%= rs.getInt(1) %>"><%= rs.getString(2) %></option>
                                    <%
                                }
                            %>
                    </select>
                </h5>
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
                        </thead>
                        <%
                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs_project","root","");
                            st = con.createStatement();
                            ResultSet rs2 = st.executeQuery("Select * from `products`");
                            int temp;
                            temp = 0;
                            while(rs2.next())
                            { temp++;
                                %>
                                <form method="Post" action="AddProductIntoCart.jsp">
                                <tr class="text-white">
                                    <td><%= temp %></td>
                                    <td>
                                        <input type="hidden" value="<%= rs2.getString(2) %>" name="pname">
                                        <%= rs2.getString(2) %>
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
                                        <%= rs2.getInt(4) %>
                                    </td>
                                    <td>
                                        <input type="hidden" value="<%= rs2.getString(6) %>" name="pseller">
                                        <input type="hidden" value="<%= rs2.getString(7) %>" name="cat">
                                        <%= rs2.getString(6) %>
                                    </td>
                                
                                        <input type="hidden" value="<%= rs2.getInt(1) %>" name="pid">
                                    <td><input class="btn btn-primary w-75" type="submit" value="Add To Cart"></td>
                                    </form>
                                </tr>
                                <%
                            }
                        %>
                    </table>
                </center>
            </div>        
            <div>
                <footer
                    style="height:120px; bottom: 0; width: 100%; background-color: rgba(0, 0, 0, 0.2) ;color: white;">
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
