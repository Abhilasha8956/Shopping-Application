
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Category</title>
        <link rel="stylesheet" type="text/css" media="screen" href="bootstrap-5.0.0-beta1-dist/css/bootstrap.css" />
        <script src="bootstrap-5.0.0-beta1-dist/js/bootstrap.js"></script>
    </head>
    <body  style="background-image: url(image.jpg); height: inherit">
        <%
            int id = Integer.parseInt(request.getParameter("cID"));
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs_project","root","");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("Select * From `categories` where c_id = '"+id+"'");
            String Name="";
            while(rs.next())
            {
                Name=rs.getString(2);
            }
        %>
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
            
            <div style="min-height: fit-content; padding-bottom: 120px" class="text-white">
            <form action="DeleteCategoryFinally.jsp" method="Post">
                <center>
                <fieldset>
                    <legend class="text-decoration-underline">Delete Category Details</legend>
                        <table class="text-white">
                            <input class="form-control" type="hidden" name="cid" value="<%= id %>">
                            <tr>
                                <td><label class="form-group">Enter Category Name </label></td>
                                <td><input class="form-control" type="text" name="cname" value="<%= Name %>"></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <input class="form-control btn-danger" type="submit" value="Delete Category">
                                </td>
                            </tr>
                        </table>
                </fieldset>
                </center>
            </form>
        </div>
            
            <div>
                <footer
                    style="height:120px; position: absolute; bottom: 0; width: 100%; background-color: rgba(0, 0, 0, 0.2) ;color: white;">
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
