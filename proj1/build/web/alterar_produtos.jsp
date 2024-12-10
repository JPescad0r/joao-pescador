<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>alteração</title>
         <link rel="stylesheet" href="css/tabela.css"/>
    </head>
    <body>
       <%
           int c;
         String n, m;
         double p;
         
         c = Integer.parseInt(request.getParameter("codigo"));
         n =request.getParameter("nome");
         m =request.getParameter("marca");
         p = Double.parseDouble(request.getParameter("preco"));
         
         Connection conecta;
         PreparedStatement st;
         Class.forName("com.mysql.cj.jdbc.Driver");
         conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/sistema_java", "root", "1234");

         st = conecta.prepareStatement("UPDATE produto SET nome = ?, marca = ?, preco = ? WHERE codigo = ?");
         st.setString(1, n);
         st.setString(2, m);
         st.setDouble(3, p);
         st.setInt(4, c);
         
         st.executeUpdate();
         out.print("O produto " + c + " foi alterado com sucesso");
       
       %>
    </body>
</html>
