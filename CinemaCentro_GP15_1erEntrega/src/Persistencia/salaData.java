package Persistencia;

import Modelo.Conexion;
import Modelo.Sala;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * @author Grupo 15 Luis Ezequiel Sosa Lucas Saidman Luca Rodrigaño Ignacio
 * Rodriguez
*
 */

public class salaData {
    
    public void guardarSala (Sala sala){
        String sql = "INSERT INTO sala (nroSala,apta3D,capacidad,estado) VALUES (?, ?, ?, ?)";
        
          try {
            Connection con = Conexion.getConexion();
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setInt(1, sala.getNroSala());
            ps.setBoolean(2, sala.isApta3D());
            ps.setInt(3, sala.getCapacidad());
            ps.setBoolean(4, sala.isEstado());
            
            ps.executeUpdate();
            System.out.println(" Sala guardada correctamente.");
            
        } catch (SQLException ex) {
            System.out.println(" Error al guardar la sala: " + ex.getMessage());
        }
    }

    
    public Sala BuscarSala (int nroSala){
        
        return null;
        
    }
    
    public void modificarSala (Sala sala) {
        
    }
    
    public void eliminarSala (int nroSala){
        
    }
    
    
    
    
}
