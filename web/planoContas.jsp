<%-- 
    Document   : planoContas
    Created on : 22 de nov de 2020, 19:53:39
    Author     : User
--%>

<%@page import="Modelos.Receita"%>
<%@page import="java.util.List"%>
<%@page import="Modelos.Despesa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minha Agenda Financeira</title>
    </head>
    <body>
        <h1>Cadastro de meu Plano de Contas</h1>
        <hr />
        <%
          Despesa despesa = new Despesa();
          List<Despesa> despesas = despesa.consultar();
          
          Receita receita = new Receita();
          List<Receita> receitas = receita.consultar();

        %>  
        <form action="recebeDadosPC.jsp" method="POST">
        <label>Selecione a despesa para registro </label>
            <select name="id">
                <% for(Despesa d: despesas){ %>
                   <option value="<%out.write(""+d.getId());%>">
                       <% out.write(d.getDescricao()); %>
                   </option>
                <%}%>
            </select> 
            <br />
            <label>Selecione a receita para locação </label>
            <select name="id">
                <%for(Receita r: receitas){%>
                    <option value="<%out.write(""+r.getId());%>">
                        <% out.write(r.getDescricao()); %>
                    </option>
                <%}%>
            </select>
            <br />
            <label>Informe a data</label>
            <input type="date" name="data" />
            <hr />
            <input type="submit" value="Salvar" /> 
        </form>
        <script>
            function enviaForm(){
                var placa = document.getElementsByName("despesa");
                if(placa[0].value === ""){
                   placa[0].focus();
                   alert("informe a despesa");
                   exit();
            }
                var marca = document.getElementsByName("receita");
                if(marca[0].value === ""){
                   marca[0].focus();
                   alert("informe a receita");
                   exit();
            }
               
            document.forms[0].submit();
        }
        </script>
    </body>
</html>
