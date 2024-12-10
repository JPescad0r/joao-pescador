<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
         <link rel="icon" href="img/casa045.png"/>
    </head>
    <body>
        <%
           
           
            String n, e;
            int i;
           
            n = request.getParameter("nome");
            e = request.getParameter("email");
            i = Integer.parseInt(request.getParameter("idade"));
           
           
                
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/sistema_java", "root", "1234");
                
                st = conecta.prepareStatement("INSERT INTO funcionarios VALUES(?,?,?)");
               
                st.setString(1, n);
                st.setString(2, e);
                st.setInt(3, i);
                st.executeUpdate(); 
                out.print("Funcionario cadastrado com sucesso");
            
                
        %>
    </body>
</html>
