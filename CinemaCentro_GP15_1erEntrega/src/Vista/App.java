package Vista;

import Modelo.Conexion;
import Modelo.Sala;
import Persistencia.salaData;
import java.sql.SQLException;

/** 
    @author Grupo 15
    Luis Ezequiel Sosa
    Lucas Saidman
    Luca Rodrigaño
    Ignacio Rodriguez
**/

public class App {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException {
       
        Conexion.getConexion();
        salaData sd = new salaData ();
        Sala s1 = new Sala (1,true,200,true);
        sd.guardarSala(s1);
        
    }
    
}
