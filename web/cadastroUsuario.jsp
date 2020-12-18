<%-- 
    Document   : cadastroUsuario
    Created on : 13/12/2020, 20:02:04
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minha Agenda Financeira</title>
            <link rel="stylesheet" href="styles/estilos.css">
            <style>
               input[type=checkbox]{
                display: block;
                position: relative;
                margin-left: 230px;                
            }
            
            input[type=button],[type=reset]{
                display: block;
                width: 90px;
                margin-left: auto;
                margin-right: auto; 
                margin-top: 10px;
            }
            
            
            input[type=text]:focus{
                background-color: white;                                              
            }
            
            input[type=text],[type=date],[type=password]{
                position: initial;
                background-color: lightskyblue;
                border-bottom-color: white;
                margin-left: 230px; 
                width: 280px;                                
            }
            label{
                display: block;
                position: absolute;
                margin-left: 10px;                 
            }
            
            div{
                display: block;
                background-color: lightblue;
                margin-left: auto;
                margin-right: auto;
                width: 530px;
                border: fuchsia;
                margin-bottom: 10px;
                padding: 20px;
            }
        </style>
    </head>
    <body>
        <header>
             <script src="scripts/cabecalho.js"></script>
        </header>
        <section>
            <nav>
                 <script src="scripts/menu.js"></script>
            </nav>
            <article>
               
                  
                <h1 class="h">"Cadastro Usuario"</h1>
                <hr />
                <p id="erros"></p>
                <form action="recebedadosusuario.jsp" method ="POST">
                    <div>
                      <label>INFORME O CPF</label>
                      <input type="text" name="cpf" /> <br />
                      <label id="erroCPF" class="error"></label>            
                      <br />

                      <label>INFORME O NOME</label>
                      <input type="text" name="nome" /> <br />

                      <br />
                      <label>INFORME DATA NASCIMENTO</label>
                      <input type="date" name="datanascimento" /> <br />

                      <br />
                      <label>INFORME O FONE</label>
                      <input type="text" name="fone" /> <br />

                      <br />
                      <label>INFORME O e-mail</label>
                      <input type="text" name="email" /> <br />
                      
                      <br />                      
                      <label>INFORME SENHA</label><br />
                      <input type="password" name="senha" /> <br />
                                      
                      <hr />
                      <input type="button" value="Salvar" onclick="enviaDados()"/> <br />
                      <input type="reset" value="Cancelar" />
                    </div>
               </form>
            </article>
        </section>
        <footer>
            <script src="scripts/rodape.js"></script>
        </footer>
       
             <script>
                function enviaDados(){
                    var semErros = true;
                    var erros = document.getElementById("erros");
                    var cpf = document.getElementsByName("cpf");
                    if(cpf[0].value === ""){
                        erros.innerHTML = "informe o CPF";
                        document.getElementById("erroCPF").innerHTML="informe o CPF"
                        cpf[0].focus();
                        semErros = false;
                    }
                    
                    var nome = document.getElementsByName("nome");
                    if(nome[0].value === ""){
                        erros.innerHTML += "<br>Informe nome";
                        nome[0].style="border: red solid 5px";
                        semErros = false;
                    }
                                
                    var datanascimento = document.getElementsByName("datanascimento");
                    if(datanascimento[0].value === ""){
                        erros.innerHTML += "<br>Informe data de nascimento";
                        datanascimento[0].style="border: red solid 5px";
                        semErros = false;
                    }
                    
                      var fone = document.getElementsByName("fone");
                    if(fone[0].value === ""){
                        erros.innerHTML += "<br>Informe fone";
                        fone[0].style="border: red solid 5px";
                        semErros = false;
                    }
                    if(semErros)
                      document.forms[0].submit();
                }
                    
                    
                    var email = document.getElementsByName("email");
                    if(email[0].value === ""){
                        erros.innerHTML += "<br>Informe email";
                        email[0].style="border: red solid 5px";
                        semErros = false;
                    }                    
                                       
                                 
                 var senha = document.getElementsByName("senha");
                    if(senha[0].value === ""){
                        erros.innerHTML += "<br>Informe senha";
                        senha[0].style="border: red solid 5px";
                        semErros = false;
                    }
                    if(semErros)
                      document.forms[0].submit();
                }
             </script>
    </head>
    </body>
</html>
