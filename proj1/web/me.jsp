
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir produtos</title>
         <link rel="icon" href="img/casa045.png"/>
    </head>
    <body>
        <%
         
            String n;
            n = request.getParameter("nome");
            try {
                
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/sistema_java", "root", "1234");
             
                PreparedStatement st = conecta.prepareStatement("DELETE FROM funcionarios WHERE nome=?");
                st.setString(1, n);
                int resultado = st.executeUpdate(); // Executa o comando DELETE
                
                if (resultado == 0) {
                    out.print("Este funcionario não está cadastrado");
                } else {
                    out.print("O o funcionario " + n + " foi mandado embora");
                }
            } catch (Exception erro) {
                String mensagemErro = erro.getMessage();
                out.print("Entre em contato com o suporte e informe o erro " + mensagemErro);
            }
        %>   
    </body>
</html>
