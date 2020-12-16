/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import utils.Conexao;

/**
 *
 * @author entra21
 */
public class Categoria {
    private int id;
    private String descricao;
    private boolean tipo;
    
    public boolean salvar(){
    String sql = "insert into despesa(descricao, tipo)";
                  sql += "values(?,?)";
        Connection con = Conexao.conectar();
       
        try {
           PreparedStatement stm = con.prepareStatement(sql);
           stm.setString(1, this.descricao);
           stm.setBoolean(2, this.tipo);
           
           stm.execute();           
        } catch (SQLException ex) {
           System.out.println("Erro: " + ex.getMessage());
           return false;
        }        
        return true;
    }
    
    public boolean alterar(){
        Connection con = Conexao.conectar();
        String sql = "update categoria set ";
              sql +="descricao = ?,";
              sql +="tipo = ?,";
              sql +=" where id = ?";
        try {
           PreparedStatement stm = con.prepareStatement(sql);
           stm.setString(1, this.descricao);
           stm.setBoolean(2, this.tipo);
           stm.setInt(3, this.id);
           
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

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public boolean isTipo() {
        return tipo;
    }

    public void setTipo(boolean tipo) {
        this.tipo = tipo;
    }
    
}
