/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;

import com.mysql.cj.xdevapi.Statement;
import javax.swing.JOptionPane;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.*;


/**
 *
 * @author camij
 */
public class coneccion {
    
    private static String DRIVER   ="com.mysql.jdbc.Driver";
    private static String USUARIO  ="root";
    private static String PASSWORD ="admin";
    private static String URL      ="jdbc:mysql://localhost:3306/bd_rockola_2.0";
    Connection con;
    Statement stmt;
    ResultSet rs;
    
    public Connection conectar() throws SQLException{
        try{
            Class.forName(DRIVER);
            con= DriverManager.getConnection(URL, USUARIO, PASSWORD);
            JOptionPane.showMessageDialog(null, "Conexión exitosa", "Conexión", JOptionPane.INFORMATION_MESSAGE);
        } catch (ClassNotFoundException e){
            JOptionPane.showMessageDialog(null, "Conexión fallida"+e, "", JOptionPane.ERROR_MESSAGE);
        }
        
     return con;  
        
    }
    

    
 
    
}
