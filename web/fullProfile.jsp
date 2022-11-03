<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Profile Details</title>
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
                            <li class="list-inline-item h5 border border-success p-3 ml-2"><a href="MainCart.jsp" class="link-light text-decoration-none">Go to Cart</a></li>
                            <li class="list-inline-item h5 border border-success p-3 ml-2"><a href="#" class="link-light text-decoration-none">Help</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-2 col-md-12 col-sm-12 h-100">
                        <a class="btn btn-light border border-danger rounded form-control link-dark"  href="index.html"><b>Logout</b></a>
                    </div>
                </div>    
            </div>
            
            <div>
                
                <%
                    String uid = request.getParameter("uid");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs_project","root","");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("Select * from `allusers` where uid = '"+uid+"'");
                    while(rs.next())
                    {
                        if(rs.getString(6) == null || rs.getString(7) == null || rs.getString(8) == null || rs.getString(9) == null || rs.getString(10) == null )
                        {
                            %>
                            <center>
                            <table class="text-white">
                                <form method="post" action="updateProfile">
                                    <tr>
                                        <td>User Id</td>
                                        <td><input type="text" value="<%= rs.getString(1) %>" class="form-control" disabled=""></td>
                                        <input type="hidden" name="uid" value="<%= rs.getString(1) %>" >
                                    </tr>
                                    <tr>
                                        <td>User Name</td>
                                        <td><input type="text" value="<%= rs.getString(2) %>" class="form-control" disabled=""></td>
                                    </tr>
                                    <tr>
                                        <td>User Email</td>
                                        <td><input type="text" value="<%= rs.getString(4) %>" class="form-control" disabled=""></td>
                                    </tr>
                                    <tr>
                                        <td>Mobile Number</td>
                                        <td><input type="text" value="<%= rs.getString(5) %>" class="form-control" disabled=""></td>
                                    </tr>
                                    <tr>
                                        <td>Gender</td>
                                        <td>
                                            <select class="form-control" required="" name="gender">
                                                <option selected="" disabled="">Select</option>
                                                <option>Male</option>
                                                <option>Female</option>
                                                <option>Other</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Date Of Birth</td>
                                        <td><input type="date" class="form-control" required="" name="dob"></td>
                                    </tr>
                                    <tr>
                                        <td>Address</td>
                                        <td>
                                            <textarea class="form-control" required="" name="address"></textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>State</td>
                                        <td><input type="text" class="form-control" required="" name="state"></td>
                                    </tr>
                                    <tr>
                                        <td>Country</td>
                                        <td><input type="text" class="form-control" required="" name="country"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <input type="submit" value="UPDATE PROFILE" class="btn btn-primary border border-success m-3">
                                        </td>
                                    </tr>
                                </form>
                            </table>
                            </center>
                            <%
                        }
                        else
                        {
                            %>
                            <center>
                            <table class="text-white">
                                <form method="post" action="updateProfileMult">
                                    <tr>
                                        <td>User Id</td>
                                        <td><input type="text" value="<%= rs.getString(1) %>" class="form-control" disabled=""></td>
                                        <input type="hidden" name="uid" value="<%= rs.getString(1) %>" >
                                    </tr>
                                    <tr>
                                        <td>User Name</td>
                                        <td><input type="text" value="<%= rs.getString(2) %>" class="form-control" disabled=""></td>
                                    </tr>
                                    <tr>
                                        <td>User Email</td>
                                        <td><input type="text" value="<%= rs.getString(4) %>" class="form-control" disabled=""></td>
                                    </tr>
                                    <tr>
                                        <td>Mobile Number</td>
                                        <td><input type="text" value="<%= rs.getString(5) %>" class="form-control" disabled=""></td>
                                    </tr>
                                    <tr>
                                        <td>Gender</td>
                                        <td><input type="text" value="<%= rs.getString(6) %>" class="form-control" disabled=""></td>
                                    </tr>
                                    <tr>
                                        <td>Date Of Birth</td>
                                        <td><input type="date" value="<%= rs.getString(7) %>" class="form-control" required="" name="dob"></td>
                                    </tr>
                                    <tr>
                                        <td>Address</td>
                                        <td>
                                            <textarea class="form-control" required="" name="address"> <%= rs.getString(8) %> </textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>State</td>
                                        <td><input type="text" class="form-control" value="<%= rs.getString(9) %>"  required="" name="state"></td>
                                    </tr>
                                    <tr>
                                        <td>Country</td>
                                        <td><input type="text" class="form-control" value="<%= rs.getString(10) %>"  required="" name="country"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <input type="submit" value="UPDATE PROFILE" class="btn btn-primary border border-success m-3">
                                        </td>
                                    </tr>
                                </form>
                            </table>
                            </center>
                            <%
                        }
                    }
                %>
            </div>
            
            <div>
                <footer
                    style="position: fixed; left: 0; bottom: 0; width: 100%; background-color: rgba(0, 0, 0, 0.2) ;color: white;">
                    <div class="d-inline-block" style="margin-left: 100px; margin-bottom: 50px; ">
                        <table>
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
