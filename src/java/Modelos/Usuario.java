/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Conexao;

public class Usuario {
    private int id;
    private String nome;
    private String cpf;
    private Date datanascimento;
    private String fone;
    private String email;
    private String senha;
    
    public boolean userExiste(String pUser){
      Connection con = Conexao.conectar();
      String sql = "select * from usuario where usuario = ?";
      try {
           PreparedStatement stm = con.prepareStatement(sql);
           stm.setString(1, pUser);
           ResultSet rs = stm.executeQuery();
           return rs.next();            
           
       } catch (SQLException ex) {
           System.out.println("Erro: " + ex.getMessage());
       }
      return true;
    }  
    
    public boolean salvar(){
       String sql = "insert into usuario(nome,cpf,datanascimento,fone,email,senha)";
                  sql += "values(?,?,?,?,?,?)";
       Connection con = Conexao.conectar();
       
       try {
           PreparedStatement stm = con.prepareStatement(sql);
           stm.setString(1, this.nome);
           stm.setString(2, this.cpf);
           stm.setDate(3, this.datanascimento);
           stm.setString(4, this.fone);
           stm.setString(5,this.email);
           stm.setString(6,this.senha);
           stm.execute();           
       } catch (SQLException ex) {
           System.out.println("Erro: " + ex.getMessage());
           return false;
       }        
       return true;
   }

    public boolean alterar(){
       Connection con = Conexao.conectar();
       String sql = "update usuario set ";
              sql +="nome = ?,";
              sql +="cpf = ?,";
              sql +="datanascimento = ?,";
              sql +="fone = ?";
              sql +="email = ?,";
              sql +="senha = ?";
              sql +=" where id = ?";
       try {
           PreparedStatement stm = con.prepareStatement(sql);
           stm.setString(1, this.nome);
           stm.setString(2, this.cpf);
           stm.setDate(3, this.datanascimento);
           stm.setString(4, this.fone);
           stm.setString(4, this.email);
           stm.setString(4, this.senha);
           stm.setInt(5, this.id);
           
           stm.execute();           
       } catch (SQLException ex) {
           System.out.println("Erro: " + ex.getMessage());
           return false;
       }        
       return true;
    } 
    
    public Usuario consultar(int id){
        Connection con = Conexao.conectar();
        String sql = "select id,nome,cpf,datanascimento,fone,email,senha"
                 + " from usuario where id = ?";
        Usuario usuario = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
              usuario = new Usuario();
              usuario.setId(id);
              usuario.setNome(rs.getString("nome"));
              usuario.setCpf(rs.getString("cpf"));
              usuario.setDatanascimento(rs.getDate("datanascimento"));
              usuario.setEmail(rs.getString("email"));
              usuario.setSenha(rs.getString("senha"));            
           }
           
       } catch (SQLException ex) {
           System.out.println("Erro: " + ex.getMessage());
       }      
     return usuario;  
   }  

    public List<Usuario> consultar(){
        Connection con = Conexao.conectar();
        String sql = "select id,nome,cpf,datanascimento,fone,email,senha from cliente";
        Usuario usuario = null;
        List<Usuario> lista = new ArrayList<>();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
           
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
              usuario = new Usuario();
              usuario.setId(id);
              usuario.setNome(rs.getString("nome"));
              usuario.setCpf(rs.getString("cpf"));
              usuario.setDatanascimento(rs.getDate("datanascimento"));
              usuario.setEmail(rs.getString("email"));
              usuario.setSenha(rs.getString("senha"));
              lista.add(usuario);
           }
           
       } catch (SQLException ex) {
           System.out.println("Erro: " + ex.getMessage());
       }      
     return lista;  
   }  
    
    public boolean excluir(){
       Connection con = Conexao.conectar();
       String sql = "delete from usuario ";
              sql +=" where id = ?";
       try {
           PreparedStatement stm = con.prepareStatement(sql);
           stm.setInt(1, this.id);
           stm.execute();           
       } catch (SQLException ex) {
           System.out.println("Erro: " + ex.getMessage());
           return false;
       }        
       return true;
   }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getFone() {
        return fone;
    }

    public void setFone(String fone) {
        this.fone = fone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public Date getDatanascimento() {
        return datanascimento;
    }

    public void setDatanascimento(Date datanascimento) {
        this.datanascimento = datanascimento;
    }
  
    
}
