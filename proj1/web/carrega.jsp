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
            int c;
            c = Integer.parseInt(request.getParameter("codigo"));

            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/sistema_java", "root", "1234");

            st = conecta.prepareStatement("SELECT * FROM produto WHERE codigo = ?");
            st.setInt(1, c);
            ResultSet resultado = st.executeQuery();
            if (!resultado.next()) {
                out.print("Este produto não foi encontrado");
            } else {
        %>
        <form method="post" action="alterar_produtos.jsp">
            <p>
                <label for="codigo">Código</label>
                <input type="number" name="codigo" id="codigo" value="<%= resultado.getString("codigo")%>" readonly>
            </p>

            <p>
                <label for="nome">Nome do produto</label>
                <input type="text" name="nome" id="nome" size="50" maxlength="50" value="<%= resultado.getString("nome")%>">
            </p>

            <p>
                <label for="marca">Marca do produto</label>
                <input type="text" name="marca" id="marca" maxlength="50" value="<%= resultado.getString("marca")%>">
            </p>

            <p>
                <label for="preco">Preço</label>
                <input type="number"  step="0.5" name="preco" id="preco" value="<%= resultado.getString("preco")%>">
            </p>

            <p>
                <input type="submit" value="Salvar Alterações">              
            </p>
        </form>
        <%
            }


        %>
    </body>
</html>
