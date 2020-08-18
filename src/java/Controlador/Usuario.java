/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

/**
 * esta clase representa a la tabla de usuario en la bd
 */

import java.sql.*;

public class Usuario {
    
    private int usuario_Codigo, priv_musr;
    private String usuario_Nombre, usuario_Apellido, user_musr, pass_musr;
    
    //cosntructor de la clase
    public Usuario(){
    
    }
    //crud
    
    //vamos a crear un metodo para verificar el usuario en la BD
    public Usuario verificarUsuario(String user, String clave){
        //incializar las variables u objetos
        Usuario u = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try{
            
            con = Conexion.getConnection();
            String q = "Select * from musuario where user_musr = ? AND pass_musr = ?";
            ps = con.prepareStatement(q);
            //paso los parametros de usuario y clave
            ps.setString(1, user);
            ps.setString(2, clave);
            //realizo la consulta
            rs = ps.executeQuery();
            //busco al usuario dentro de la tabla
            while(rs.next()){
                //el objeto de usuario
                u = new Usuario();
               // u.setUsuario_Codigo(rs.getInt("usuario_Codigo"));
               //u.setUsuario_Nombre(rs.getString("usuario_Nombre"));
               //u.setUsuario_Apellido(rs.getString("usuario_Apellido"));
               u.setUser_musr(rs.getString("user_musr"));
                u.setPass_musr(rs.getString("pass_musr"));
                u.setPriv_musr(rs.getInt("priv_musr"));
                break;
            }
        
        }catch(SQLException e){
            System.out.println("Error al conectar con la tabla");
            System.out.println(e.getMessage());
            System.out.println(e.getSQLState());
            u = null;
        
        }finally{
            try{
                rs.close();
                ps.close();
                con.close();
            
            }catch(Exception e){
            
            }
        
        }
        return u;
              
    }

  /*
    public int getUsuario_Codigo() {
        return usuario_Codigo;
    }

    public void setUsuario_Codigo(int usuario_Codigo) {
        this.usuario_Codigo = usuario_Codigo;
    }
    */
    
    public int getPriv_musr() {
        return priv_musr;
    }

    public void setPriv_musr(int priv_musr) {
        this.priv_musr = priv_musr;
    }
    
 /*
    public String getUsuario_Nombre() {
        return usuario_Nombre;
    }

    public void setUsuario_Nombre(String usuario_Nombre) {
        this.usuario_Nombre = usuario_Nombre;
    }

    public String getUsuario_Apellido() {
        return usuario_Apellido;
    }

    public void setUsuario_Apellido(String usuario_Apellido) {
        this.usuario_Apellido = usuario_Apellido;
    }
  
   */ 
    
    public String getUser_musr() {
        return user_musr;
    }

    public void setUser_musr(String user_musr) {
        this.user_musr = user_musr;
    }

    public String getPass_musr() {
        return pass_musr;
    }

    public void setPass_musr(String pass_musr) {
        this.pass_musr = pass_musr;
    }
    
    
    
}
