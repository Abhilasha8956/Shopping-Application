<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>E-Commerce Web Site</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" type="text/css" media="screen" href="bootstrap-5.0.0-beta1-dist/css/bootstrap.css" />
    <script src="bootstrap-5.0.0-beta1-dist/js/bootstrap.js"></script>
</head>

<body style="background-image: url(image.jpg); height: inherit">

    <div class="mycontainer" style="align-items: center;">
        <div class="box" style="height: 400px;
        width: 500px;
        background-color: rgba(0, 0, 0, 0.2) ;
        color: white;
        margin: 0 auto; ">
                    <p class="h1 w-100" style="text-align: center; color: red">Reset Password</p>
                    <hr class="w-75 center" style="margin: auto;">

                    <form class="form-group m-5" method="Post">
                        Enter Your Login ID: <input type="text" name="resetid" class="form-control w-75" required>   

                        Enter New Password: <input type="password" name="resetpass" class="form-control w-75" required>
 
                        <hr class="w-75  mt-3 center" style="margin: auto;">
                        

                        <input type="submit" class="form-control mt-4" value="Change">
                    </form>
                    
        </div>
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
    <%
        if("POST".equals(request.getMethod())) {
            String id = request.getParameter("resetid");
            String npass = request.getParameter("resetpass");
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs_project","root","");
            Statement st = con.createStatement();
            int val = st.executeUpdate("Update `allusers` set upass='"+npass+"' where uid = '"+id+"'");
            if(val>0)
            {
                response.sendRedirect("index.html");
            }
            else{
                response.sendRedirect("resetpass.jsp");
            }
        }
            %>
</body>
</html>