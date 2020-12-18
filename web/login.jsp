<%-- 
    Document   : login
    Created on : 09/12/2020, 15:46:18
    Author     : User
--%>

<%@page import="modelos.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Locacar</title>
        <link rel="stylesheet" href="style/estilos.css">
        <style>
            div{
                display: block;
                width: 300px;
                margin-left: auto;
                margin-right: auto;
            }
        </style>
    </head>
    <body>
        <%
        String usuario = request.getParameter("usuario");
        String senha = request.getParameter("senha");
          
        if((usuario != null) && (senha != null) && !(usuario.isEmpty())
            && !(senha.isEmpty()) ){
            //crie a seção 
        
        if(Cliente.podeLogar(usuario,senha)){
            session.setAttribute("usuario", usuario);
            response.sendRedirect("cadastrolocacao.jsp");  
          }      
        }
          
        %>
        <header>
            <script src="scripts/cabecalho.js"></script>  
        </header>
        <section>
            <nav>
                <script src="scripts/menu.js"></script>  
            </nav>
              
        </section>
        <footer>
           <script src="scripts/rodape.js"></script> 
        </footer> 
        <div>
            <h1>Tela de Login</h1>
            <form action="login.jsp" method="POST">
                <label>Usuário</label><br/>
                <input typ="text" name="usuario" /> <br/>
                <label>Senha</label><br/>
                <input type="password" name="senha" /> <hr/>
                <input type="submit" value="Logar" /> 
                <a href="cadastrocliente.jsp"><input type="button" value="Cadastrar" /></a>
            </form>        
        </div>   
        
    </body>
</html>
