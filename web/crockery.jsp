<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Products</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" type="text/css" media="screen" href="bootstrap-5.0.0-beta1-dist/css/bootstrap.css" />
    <script src="bootstrap-5.0.0-beta1-dist/js/bootstrap.js"></script>
</head>
<body style="background-image: url(image.jpg); height: inherit">
    <div>
        <div class="container-fluid" style="height: fit-content; background-color: rgba(0, 0, 0, 0.2)">
            <div class="row h-100">
                <div class="col-lg-2 col-md-6 col-sm-12 h-100 d-flex align-item-center mt-2 ml-2">
                    <a href="HomePageAdmin.html" class="ml-2"><img src="download.jpeg" class="mx-auto" style="height: 60px" /></a>
                </div>
                <div class="col-lg-8 col-md-6 col-sm-12 h-100 d-flex align-item-center">
                    <ul class="text-white list-inline m-0 mx-auto" style="padding: 10px">
                        <li class="list-inline-item h5 ml-2"><a href="HomePageAdmin.html" class="link-light text-decoration-none">Home</a></li>
                        <li class="list-inline-item h5 ml-2"><a href="listCategory.jsp" class="link-light text-decoration-none">List of Categories</a></li>
                        <li class="list-inline-item h5 ml-2"><a href="listProducts.jsp" class="link-light text-decoration-none">List of Products</a></li>
                        <li class="list-inline-item h5 ml-2"><a href="#" class="link-light text-decoration-none">Reports</a></li>
                        <li class="list-inline-item h5 ml-2"><a href="listUsers.jsp" class="link-light text-decoration-none">Users</a></li>
                        <li class="list-inline-item h5 ml-2"><a href="#" class="link-light text-decoration-none">Offers & Discount</a></li>
                    </ul>
                </div>
                <div class="col-lg-2 col-md-12 col-sm-12 h-100 d-flex align-item-center">
                    <a class="btn btn-light border border-danger rounded form-control link-dark"  href="log_Admin.jsp"><b>Logout</b></a>
                </div>
            </div>
        </div>
        <div style="min-height: 520px;">
            <h2 class="text-decoration-underline text-white text-center" style="font-family: montserrat;">CROCKERY PRODUCTS</h2>
            <h6 class="text-left text-white h5" style="margin-left: 200px"><a a href="AddPro.jsp" class="link-light text-decoration-none">Add Product</a></h6>   
            <center>
                <table class="table table-responsive border table-striped text-center">
                    <thead>
                        <th>Serial Number</th>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Product Description</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Product Seller</th>
                        <th>Update Product</th>
                        <th>Remove Product</th>
                    </thead>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs_project","root","");
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("Select * from `products` where CAT_ID = (select C_ID from categories where C_NAME = 'CROCKERY')");
                        int temp;
                        temp = 0;
                        while(rs.next())
                        { temp++;
                            %>
                            <tr class="text-white">
                                <td><%= temp %></td>
                                <td><%= rs.getInt(1) %></td>
                                <td><%= rs.getString(2) %></td>
                                <td><%= rs.getString(3) %></td>
                                <td><%= rs.getInt(5) %></td>
                                <td><%= rs.getInt(4) %></td>
                                <td><%= rs.getString(6) %></td>
                                <form action="editProduct.jsp" method="Post">
                                    <input type="hidden" value="<%= rs.getInt(1) %>" name="pid">
                                <td><input class="btn btn-primary w-50" type="submit" value="Edit"></td>
                                </form>
                                <form action="DeleteProduct.jsp" method="Post">
                                    <input type="hidden" value="<%= rs.getInt(1) %>" name="pid">
                                    <td><input class="btn btn-danger w-50" type="submit" value="Delete" name="pID"></td>
                                </form>
                            </tr>
                            <%
                        }
                    %>
                </table>
            </center>
        </div>        
        <jsp:include page="UserFooter.jsp" />
    </div>
</body>
</html>
