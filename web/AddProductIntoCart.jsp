
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        
        <%
                HttpSession sn = request.getSession(false);
                String ab = sn.getAttribute("uid").toString();
                
                String id = request.getParameter("pid");  
                Boolean repeat = false;
                int incr = 1;
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs_project","root","");
                Statement st = con.createStatement();
                
                ResultSet rs = st.executeQuery("Select c_pid From Cart where uid = '"+ab+"'");
                while(rs.next())
                {
                    if(rs.getString(incr).equals(id))
                    {
                        repeat = true;
                    }
                }
                if(repeat == true)
                {
                    out.println("<h1>Product Is Already Added to Your Cart.</h1>");
                    out.println("<h1><a href='MainCart.jsp'>GO TO CART</a></h1>");
                    out.println("<h1><a href='listProduct_User.jsp'>ADD MORE ITEMS</a></h1>");
                }
                else{
                    String name = request.getParameter("pname");
                    String dsc = request.getParameter("pdesc");
                    String price = request.getParameter("pprice");
                    String cat = request.getParameter("cat");
                    String Seller = request.getParameter("pseller");
                    int temp = 1;
                    int a = st.executeUpdate("Insert Into Cart (C_PID, C_PDesc, C_PQty, C_pPrice, C_Pseller, CAT_ID, C_PName, uid) Values ('"+id+"','"+dsc+"','"+temp+"','"+price+"','"+Seller+"','"+cat+"','"+name+"','"+ab+"')");
                    if(a<0)
                    {
                        response.sendRedirect("listProduct_User.jsp");
                    }
                    else{
                        response.sendRedirect("MainCart.jsp");
                    }
                }
        %>
    </body>
</html>
