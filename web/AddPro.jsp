
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
                        <li class="list-inline-item h5 ml-2"><a href="#" class="link-light text-decoration-none">Users</a></li>
                        <li class="list-inline-item h5 ml-2"><a href="#" class="link-light text-decoration-none">Offers & Discount</a></li>
                    </ul>
                </div>
                <div class="col-lg-2 col-md-12 col-sm-12 h-100 d-flex align-item-center">
                    <a class="btn btn-light border border-danger rounded form-control link-dark"  href="log_Admin.jsp"><b>Logout</b></a>
                </div>
            </div>
        </div>
        <div style="min-height: 520px; padding-bottom: 10px">
            <form action="AddProduct" method="Post">
                <center>
                <fieldset>
                    <legend class="text-decoration-underline">Add Product Details</legend>
                        <table class="text-white">
                            <tr>
                                <td><label class="form-group">Enter Product Name </label></td>
                                <td><input class="form-control" type="text" name="pn"></td>
                            </tr>
                            <tr>
                                <td><label class="form-group">Enter Product Description </label></td>
                                <td><input class="form-control" type="text" name="pd"></td>
                            </tr>
                            <tr>
                                <td><label class="form-group">Enter Quantity </label></td>
                                <td><input class="form-control" type="text" name="pq"></td>
                            </tr>
                            <tr>
                                <td><label class="form-group">Enter Price </label></td>
                                <td><input class="form-control" type="text" name="pp"></td>
                            </tr>
                            <tr>
                                <td><label class="form-group">Enter Seller Name </label></td>
                                <td><input class="form-control" type="text" name="ps"></td>
                            </tr>
                            <tr>
                                <td><label class="form-group">Select Category </label></td>
                                <td>
                                    <select class="form-control" name="pc">
                                        <option disabled="" selected="">Select One</option>
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
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <input class="form-control" type="submit" value="Insert Product">
                                </td>
                            </tr>
                        </table>
                </fieldset>
                </center>
            </form>
        </div> 
                                    
        <jsp:include page="UserFooter.jsp" />
        
    </div>
</body>
</html>

