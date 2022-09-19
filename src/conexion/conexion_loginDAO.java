
package conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class conexion_loginDAO {
   
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    coneccion cn = new coneccion();
    
    public conexion_login log(String correo, String pass){
        
        conexion_login l = new conexion_login();
        String sql = "SELECT * FROM usuarios WHERE correo = ? AND pass= ?";
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, pass);
            rs=ps.executeQuery();
            if(rs.next()){
               
                l.setId_usuarios(rs.getInt("id_usuarios"));
                l.setTipo(rs.getInt("tipo"));
                l.setCorreo(rs.getString("correo"));
                l.setPass(rs.getString("pass"));
                
            }
                    
        } catch (SQLException e) {
            
            System.out.println(e.toString());
        }
        return l;
    }
 
}
