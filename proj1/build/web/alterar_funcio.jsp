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

         st = conecta.prepareStatement("UPDATE funcionarios SET email = ?, idade = ? WHERE nome = ?");
                st.setString(1, e);
                st.setInt(2, i);
                st.setString(3, n);
                
         st.executeUpdate();
         out.print("O  " + n + " foi alterado com sucesso");
       
       %>
    </body>
</html>
