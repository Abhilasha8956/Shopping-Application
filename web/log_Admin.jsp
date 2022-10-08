<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administration Login Page</title>
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
            <p class="h1 w-100" style="text-align: center; color: red">Administration Login</p>
            <hr class="w-75 center" style="margin: auto;">

            <form class="form-group m-5" method="Post" action="#" autocomplete="off">
                Login ID: <input type="text" name="logid" class="form-control w-75" required>

                Password: <input type="password" name="logpass" class="form-control w-75" required>

                <hr class="w-75  mt-3 center" style="margin: auto;">
                <center>
                    <a class="link-dark h4" href="index.html" style="color: red">Login As User</a>
                </center>
                <input type="submit" class="form-control mt-5" value="Login">
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
        String id = request.getParameter("logid");
        String pass = request.getParameter("logpass");
        if(id.equals("MCA@24") && pass.equals("cmpicaCharusat"))
        {
            response.sendRedirect("HomePageAdmin.html");
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
