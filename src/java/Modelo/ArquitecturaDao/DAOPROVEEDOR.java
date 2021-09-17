package Modelo.ArquitecturaDao;

import Modelo.conexion;
import Modelo.DaoTmc.proveedores;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAOPROVEEDOR extends conexion {

    public proveedores leerProveedor(proveedores lprv) throws Exception {
        proveedores leerpv = null;
        ResultSet rsLeerp;
        String sqlLp = "SELECT A.IDPROVEEDOR, A.NOMBRE, A.DIRECCION, A.TELEFONO, A.NIT, A.ESTADO "
                + "FROM proveedores A WHERE A.IDPROVEEDOR = " + lprv.getIdProveedor();
        try {
            this.conectar(false);
            rsLeerp = this.ejecutarOrdenDatos(sqlLp);
            if (rsLeerp.next() == true) {
                leerpv = new proveedores();
                leerpv.setIdProveedor(rsLeerp.getInt("IDPROVEEDOR"));
                leerpv.setNombre(rsLeerp.getString("NOMBRE"));
                leerpv.setDireccion(rsLeerp.getString("DIRECCION"));
                leerpv.setTelefono(rsLeerp.getString("TELEFONO"));
                leerpv.setNit(rsLeerp.getString("NIT"));
                leerpv.setEstado(rsLeerp.getString("ESTADO"));
            }
            rsLeerp.close();
        } catch (Exception e) {
            System.err.println("No puedo leer el proveedor: " + e.getMessage());
        } finally {
            this.cerrar(false);
        }
        return leerpv;
    }
    
    public List<proveedores> listarProveedor() throws Exception {
        List<proveedores> proveedor;
        proveedores tmcpv;
        ResultSet rspvd = null;
        String sqlproveedor = "SELECT B.IDPROVEEDOR, B.NOMBRE, B.DIRECCION, B.TELEFONO, B.NIT, B.ESTADO FROM PROVEEDORES B "
                + "ORDER BY IDPROVEEDOR";
        try {
            this.conectar(false);
            rspvd = this.ejecutarOrdenDatos(sqlproveedor);
            proveedor = new ArrayList<>();
            while (rspvd.next() == true) {
                tmcpv = new proveedores();
                tmcpv.setIdProveedor(rspvd.getInt("IDPROVEEDOR"));
                tmcpv.setNombre(rspvd.getString("NOMBRE"));
                tmcpv.setDireccion(rspvd.getString("DIRECCION"));
                tmcpv.setTelefono(rspvd.getString("TELEFONO"));
                tmcpv.setNit(rspvd.getString("NIT"));
                tmcpv.setEstado(rspvd.getString("ESTADO"));
                proveedor.add(tmcpv);
            }
            this.cerrar(true);
        } catch (Exception e) {
            throw e;
        } finally {
        }
        return proveedor;
    }
    
    public void registroProveedor(proveedores rProveedor) throws Exception {
        String rProv;

        rProv = " INSERT INTO proveedores (nombre, direccion, telefono, nit, estado) "
                + "VALUES ('" + rProveedor.getNombre() + "', '"
                + rProveedor.getDireccion() + "', '"
                + rProveedor.getTelefono() + "', '"
                + rProveedor.getNit() + "', "
                + rProveedor.getEstado() + " )";
        try {
            this.conectar(false);
            this.ejecutarOrden(rProv);
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        }
    }

    public void actualizarProveedor(proveedores aPvr) throws Exception {
        String sqlPvr = "UPDATE proveedores SET NOMBRE = '"
                + aPvr.getNombre() + "', DIRECCION = '"
                + aPvr.getDireccion() + "', TELEFONO = '"
                + aPvr.getTelefono() + "', NIT = '"
                + aPvr.getNit() + "', ESTADO = "
                + aPvr.getEstado() 
                + " WHERE IDPROVEEDOR = " + aPvr.getIdProveedor();
        try {
            this.conectar(false);
            this.ejecutarOrden(sqlPvr);
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        }
    }

    public void eliminarProveedor(proveedores tmcproveedor) throws Exception {
        String sqlProveedor = "DELETE FROM PROVEEDORES "
                + "WHERE IDPROVEEDOR = " + tmcproveedor.getIdProveedor();
        try {
            this.conectar(false);
            this.ejecutarOrden(sqlProveedor);
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        }
    }
}
