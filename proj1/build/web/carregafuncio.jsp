<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração de produtos</title>
         <link rel="icon" href="img/casa045.png"/>
    </head>
    <body>
        <%
            
           String n;
           n = request.getParameter("nome");
        
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/sistema_java", "root", "1234");

            st = conecta.prepareStatement("SELECT * FROM funcionarios WHERE nome= ?");
            st.setString(1, n);
            ResultSet resultado = st.executeQuery();
            if (!resultado.next()) {
                out.print("Este funcionario não foi encontrado");
            } else {
        %>
        <form method="post" action="alterar_funcio.jsp">
           

            <p>
                <label for="nome">Nome do funcionario</label>
                <input type="text" name="nome" id="nome"  value="<%= resultado.getString("nome")%>" readonly>
            </p>

            <p>
                <label for="email">Email</label>
                <input type="text" name="email" id="email"  value="<%= resultado.getString("email")%>">
            </p>

            <p>
                <label for="idade">Idade</label>
                <input type="number"  name="idade" id="idade" value="<%= resultado.getInt("idade")%>">
            </p>

            <p>
                <input type="submit" value="Salvar Mudanças">              
            </p>
        </form>
        <%
            }


        %>
    </body>
</html>
