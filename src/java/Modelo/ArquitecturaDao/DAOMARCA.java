package Modelo.ArquitecturaDao;

import Modelo.conexion;
import Modelo.DaoTmc.marca;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAOMARCA extends conexion {

    public marca leerMarca(marca lmarca) throws Exception {
        marca leermarca = null;
        ResultSet rsLeerm;
        String sqlLm = "SELECT A.IDMARCA, A.NOMBREMARCA, A.ESTADO "
                + "FROM MARCA A WHERE A.IDMARCA = " + lmarca.getIdMarca();
        try {
            this.conectar(false);
            rsLeerm = this.ejecutarOrdenDatos(sqlLm);
            if (rsLeerm.next() == true) {
                leermarca = new marca();
                leermarca.setIdMarca(rsLeerm.getInt("IDMARCA"));
                leermarca.setNombreMarca(rsLeerm.getString("NOMBREMARCA"));
                leermarca.setEstado(rsLeerm.getString("ESTADO"));
            }
            rsLeerm.close();
        } catch (Exception e) {
            System.out.println("Error Marca" + e.getMessage());
        } finally {
            this.cerrar(false);
        }
        return leermarca;
    }

    public List<marca> listarMarca() throws Exception {
        List<marca> marcas;
        marca tmcmarca;
        ResultSet rsmarca = null;
        String sqlmarca = "SELECT C.IDMARCA, C.NOMBREMARCA, ESTADO FROM MARCA C "
                + "ORDER BY IDMARCA";
        try {
            this.conectar(false);
            rsmarca = this.ejecutarOrdenDatos(sqlmarca);
            marcas = new ArrayList<>();
            while (rsmarca.next() == true) {
                tmcmarca = new marca();
                tmcmarca.setIdMarca(rsmarca.getInt("IDMARCA"));
                tmcmarca.setNombreMarca(rsmarca.getString("NOMBREMARCA"));
                tmcmarca.setEstado(rsmarca.getString("ESTADO"));
                marcas.add(tmcmarca);
            }
            this.cerrar(true);
        } catch (Exception e) {
            throw e;
        } finally {
        }
        return marcas;
    }

     public void registrarMarca(marca rmarca) throws Exception {
        String sqlrm;

        sqlrm="INSERT INTO marca (nombreMarca, Estado) "
                + "VALUES ('" + rmarca.getNombreMarca()+ "', "
                + rmarca.getEstado()+ " )";
        
        try {
            this.conectar(false);
            this.ejecutarOrden(sqlrm);
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        }
    }

    public void actualizarMarca(marca amarca) throws Exception {
        String sqlact = "UPDATE marca SET NOMBREMARCA = '"
                + amarca.getNombreMarca() + "', ESTADO = "
                + amarca.getEstado()
                + " WHERE IDMARCA = " + amarca.getIdMarca();
        try {
            this.conectar(false);
            this.ejecutarOrden(sqlact);
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        }
    }

    public void eliminarMarca(marca tmcmarca) throws Exception {
        String sqldmarca = "DELETE FROM MARCA "
                + "WHERE IDMARCA = " + tmcmarca.getIdMarca();
        try {
            this.conectar(false);
            this.ejecutarOrden(sqldmarca);
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        }
    }
}
