<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de prod</title>
         <link rel="icon" href="img/casa045.png"/>
      
       
    </head>
    <body>
        <%
        
        String n;
        n = request.getParameter("nome");
        try {
         
         Connection conecta;
         PreparedStatement st;
         Class.forName("com.mysql.cj.jdbc.Driver");
         conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/sistema_java", "root", "1234");
         
         st = conecta.prepareStatement("SELECT * FROM produto WHERE nome LIKE ?");
         st.setString(1, "%" + n + "%");
         ResultSet rs =  st.executeQuery();
         %>
        <table border="1">
            <tr>
                 <th>Código</th>
                 <th>Nome</th>
                 <th>Marca</th>
                 <th>Preço</th>
                 <th>Excluir</th>
            </tr>
          <%       
         while(rs.next()) {
         %>
            
                <tr>
                     <td><%= rs.getString("codigo")%></td>
                     <td><%= rs.getString("nome")%></td>
                     <td><%= rs.getString("marca")%></td>
                     <td><%= rs.getString("preco")%></td>
                     <td><a href="exc.jsp?codigo=<%= rs.getString("codigo")%>">Excluir</td>
                 </tr>

         
         <%
             }
          %>
          </table>
                 <%
              
          } catch(Exception x){
           out.print( "Erro:" + x.getMessage());
         }
        %>
    </body>
</html>
