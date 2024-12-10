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
        <link rel="stylesheet" href="css/tabela.css"/>
         <link rel="icon" href="img/casa045.png"/>
       
    </head>
    <body>
        <%
        try {
         
         Connection conecta;
         PreparedStatement st;
         Class.forName("com.mysql.cj.jdbc.Driver");
         conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/sistema_java", "root", "1234");
         
         st = conecta.prepareStatement("SELECT * FROM funcionarios ORDER By nome");    
         ResultSet rs =  st.executeQuery();
         %>
        <table border="1">
            <tr>
                
                 <th>Nome</th>
                
                 <th>Idade</th>
                 <th>Email</th>
                 <th>Mandar embora</th>
                 <th>Mudar informações</th>
            </tr>
          <%       
         while(rs.next()) {
         %>
            
                <tr>
                    
                     <td><%= rs.getString("nome")%></td>
                     <td><%= rs.getString("idade")%></td>
                     <td><%= rs.getString("email")%></td>
                     <td><a href="me.jsp?nome=<%= rs.getString("nome")%>">Excluir</td>
                     <td><a href="carregafuncio.jsp?nome=<%= rs.getString("nome")%>">Alterar</td>
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
