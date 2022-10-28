<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
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
        <div class="box" style="height: 450px;
        width: 500px;
        background-color: rgba(0, 0, 0, 0.2) ;
        color: white;
        margin: 0 auto; ">
                    <p class="h1 w-100" style="text-align: center; color: red">Reset Password</p>
                    <hr class="w-75 center" style="margin: auto;">

                    <form class="form-group m-5" method="Post">
                        Enter Your Login ID: <input type="text" name="resetid" onkeyup="MyFun()" class="form-control w-75" required>   

                        Enter Your Email Address: <input type="email" name="resetmail" onkeyup="MyFun()" class="form-control w-75" required>

                        Enter Your Mobile Number: <input type="number" name="resetmobileno" onkeyup="MyFun()" class="form-control w-75" required>
 
                        <hr class="w-75  mt-3 center" style="margin: auto;">
                        

                        <input type="submit" class="form-control mt-4" value="Process" class="h1">
                        <div style="height: fit-content; color: red; width: fit-content" id="mess">
                            
                        </div>
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
                    </tr>
                    <tr>
                        <td> </td>
                        <td><a href="https://mail.google.com/mail/?view=cm&fs=1&tf=1&to=22MCA138@charusat.edu.org"
                                class="link-light" target="_blank">22MCA138@charusat.edu.org</a></td>
                    </tr>
                </table>
            </div>
            <div class="d-inline-block" style="margin-left: 500px;">
                <p><a href="https://www.instagram.com/_amiruddin_samlayawala_03/" class="link-light"
                        target="_blank">Amiruddin I. Samlayawala</a><br>
                    15, Amroha Colony, Bawaman Pura, Panigate,<br>
                    Vadodara-390019.</p>
            </div>
        </footer>
    </div>
    
    <%
        if("POST".equals(request.getMethod())) {
            String id = request.getParameter("resetid");
            String email = request.getParameter("resetmail");
            String phone = request.getParameter("resetmobileno");
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs_project","root","");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("Select * from allusers where uid ='"+id+"'");
            while(rs.next())
            {
                if(rs.getString(1).equals(id) && rs.getString(4).equals(email) && rs.getString(5).equals(phone))
                {
                    response.sendRedirect("resetpass.jsp");
                }
                else
                {
                    %>
                        <script>
                               var paragraph = document.getElementById("mess");
                               var text = document.createTextNode("Wrong Details");
                               paragraph.appendChild(text);
                        </script>
                    <%
                }
            }
        }
            %>
        <script>
            function MyFun()
            {
                var par = document.getElementById("mess");
                if(par.hidden==false)
                {
                    par.hidden=true;
                }
                else{}
            }
         </script>
</body>
</html>