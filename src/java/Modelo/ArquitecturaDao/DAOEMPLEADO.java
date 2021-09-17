package Modelo.ArquitecturaDao;

import Modelo.DaoTmc.empleado;
import Modelo.DaoTmc.usuario;
import Modelo.conexion;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAOEMPLEADO extends conexion {

    public empleado leerEmpleado(empleado lEmpleado) throws Exception {
        empleado lctempleado = null;
        ResultSet rsLemlp;
        String sqlLempl = "SELECT A.IDEMPLEADO, A.NOMBRE, A.APELLIDOS, A.SEXO, A.TELEFONO, A.FECHANACIMIENTO, A.TIPODOCUMENTO, A.NUMERODOCUMENTO, A.IDUSUARIO "
                + "FROM EMPLEADO A WHERE A.IDEMPLEADO = " + lEmpleado.getIDEMPLEADO();
        try {
            this.conectar(false);
            rsLemlp = this.ejecutarOrdenDatos(sqlLempl);
            if (rsLemlp.next() == true) {
                lctempleado = new empleado();
                lctempleado.setIDEMPLEADO(rsLemlp.getInt("IDEMPLEADO"));
                lctempleado.setNOMBRE(rsLemlp.getString("NOMBRE"));
                lctempleado.setAPELLIDOS(rsLemlp.getString("APELLIDOS"));
                lctempleado.setSEXO(rsLemlp.getString("SEXO"));
                lctempleado.setTELEFONO(rsLemlp.getString("TELEFONO"));
                lctempleado.setFECHANACIMIENTO(rsLemlp.getString("FECHANACIMIENTO"));
                lctempleado.setTIPODOCUMENTO(rsLemlp.getString("TIPODOCUMENTO"));
                lctempleado.setNUMERODOCUMENTO(rsLemlp.getString("NUMERODOCUMENTO"));
                lctempleado.setUsuario(new usuario());
                lctempleado.getUsuario().setId_usuario(rsLemlp.getInt("IDUSUARIO"));
            }
        } catch (Exception e) {
            System.err.print("Error Leer Empleado" + e.getMessage());
        } finally {
            this.cerrar(false);
        }
        return lctempleado;
    }

    public List<empleado> listarEmpleado() throws Exception {
        List<empleado> empleados;
        empleado tmcempleado;
        ResultSet rsempleado = null;

        String sqlempleado = "SELECT E.IDEMPLEADO, E.NOMBRE, E.APELLIDOS, E.SEXO, E.TELEFONO, E.FECHANACIMIENTO, E.TIPODOCUMENTO, E.NUMERODOCUMENTO, E.IDUSUARIO FROM EMPLEADO  E "
                + "ORDER BY IDEMPLEADO";
        try {
            this.conectar(false);
            rsempleado = this.ejecutarOrdenDatos(sqlempleado);
            empleados = new ArrayList<>();
            while (rsempleado.next() == true) {
                tmcempleado = new empleado();
                tmcempleado.setIDEMPLEADO(rsempleado.getInt("IDEMPLEADO"));
                tmcempleado.setNOMBRE(rsempleado.getString("NOMBRE"));
                tmcempleado.setAPELLIDOS(rsempleado.getString("APELLIDOS"));
                tmcempleado.setSEXO(rsempleado.getString("SEXO"));
                tmcempleado.setTELEFONO(rsempleado.getString("TELEFONO"));
                tmcempleado.setFECHANACIMIENTO(rsempleado.getString("FECHANACIMIENTO"));
                tmcempleado.setTIPODOCUMENTO(rsempleado.getString("TIPODOCUMENTO"));
                tmcempleado.setNUMERODOCUMENTO(rsempleado.getString("NUMERODOCUMENTO"));
                tmcempleado.setUsuario(new usuario());
                tmcempleado.getUsuario().setId_usuario(rsempleado.getInt("IDUSUARIO"));
                empleados.add(tmcempleado);
            }
            this.cerrar(true);
        } catch (Exception e) {
            throw e;
        } finally {
        }
        return empleados;
    }

    public void RegistrarEmpleado(empleado Empl) throws Exception {
        String sqlrEmpl;
        sqlrEmpl = "INSERT INTO  empleado (NOMBRE, APELLIDOS, SEXO, TELEFONO, FECHANACIMIENTO, TIPODOCUMENTO, NUMERODOCUMENTO, IDUSUARIO) "
                + "VALUES ('" + Empl.getNOMBRE() + "',  '"
                + Empl.getAPELLIDOS() + "',  '"
                + Empl.getSEXO() + "',  '"
                + Empl.getTELEFONO() + "',  '"
                + Empl.getFECHANACIMIENTO() + "',  '"
                + Empl.getTIPODOCUMENTO() + "',  '"
                + Empl.getNUMERODOCUMENTO() + "',  "
                + Empl.getUsuario().getId_usuario() + ")";
        try {
            this.conectar(false);
            this.ejecutarOrden(sqlrEmpl);
            this.cerrar(true);
        } catch (Exception e) {
            System.err.print("Fallo SQl Empleados Registrar");
            this.cerrar(false);
            throw e;
        }

    }

    public void actualizarEmpleado(empleado aEmpleado) throws Exception {
        String sqlAempl = "UPDATE empleado SET NOMBRE = '"
                + aEmpleado.getNOMBRE() + "', APELLIDOS = '"
                + aEmpleado.getAPELLIDOS() + "', SEXO = '"
                + aEmpleado.getSEXO() + "', TELEFONO = '"
                + aEmpleado.getTELEFONO() + "', FECHANACIMIENTO = '"
                + aEmpleado.getFECHANACIMIENTO() + "', TIPODOCUMENTO = '"
                + aEmpleado.getTIPODOCUMENTO() + "', NUMERODOCUMENTO = '"
                + aEmpleado.getNUMERODOCUMENTO() + "', IDUSUARIO = "
                + aEmpleado.getUsuario().getId_usuario()
                + " WHERE IDEMPLEADO = " + aEmpleado.getIDEMPLEADO();
        try {
            this.conectar(false);
            this.ejecutarOrden(sqlAempl);
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        }

    }

    public void eliminarEmpleado(empleado empl) throws Exception {
        String sqlempl = "DELETE FROM EMPLEADO "
                + "WHERE IDEMPLEADO = " + empl.getIDEMPLEADO();
        try {
            this.conectar(false);
            this.ejecutarOrden(sqlempl);
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        }
    }
}
