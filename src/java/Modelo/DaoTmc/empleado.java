package Modelo.DaoTmc;

import Modelo.conexion;

public class empleado {

    private int IDEMPLEADO;
    private String NOMBRE;
    private String APELLIDOS;
    private String SEXO;
    private String TELEFONO;
    private String FECHANACIMIENTO;
    private String TIPODOCUMENTO;
    private String NUMERODOCUMENTO;
    usuario usuario;

    public int getIDEMPLEADO() {
        return IDEMPLEADO;
    }

    public void setIDEMPLEADO(int IDEMPLEADO) {
        this.IDEMPLEADO = IDEMPLEADO;
    }

    public String getNOMBRE() {
        return NOMBRE;
    }

    public void setNOMBRE(String NOMBRE) {
        this.NOMBRE = NOMBRE;
    }

    public String getAPELLIDOS() {
        return APELLIDOS;
    }

    public void setAPELLIDOS(String APELLIDOS) {
        this.APELLIDOS = APELLIDOS;
    }

    public String getSEXO() {
        return SEXO;
    }

    public void setSEXO(String SEXO) {
        this.SEXO = SEXO;
    }

    public String getTELEFONO() {
        return TELEFONO;
    }

    public void setTELEFONO(String TELEFONO) {
        this.TELEFONO = TELEFONO;
    }

    public String getFECHANACIMIENTO() {
        return FECHANACIMIENTO;
    }

    public void setFECHANACIMIENTO(String FECHANACIMIENTO) {
        this.FECHANACIMIENTO = FECHANACIMIENTO;
    }

    public String getTIPODOCUMENTO() {
        return TIPODOCUMENTO;
    }

    public void setTIPODOCUMENTO(String TIPODOCUMENTO) {
        this.TIPODOCUMENTO = TIPODOCUMENTO;
    }

    public String getNUMERODOCUMENTO() {
        return NUMERODOCUMENTO;
    }

    public void setNUMERODOCUMENTO(String NUMERODOCUMENTO) {
        this.NUMERODOCUMENTO = NUMERODOCUMENTO;
    }

    public usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(usuario usuario) {
        this.usuario = usuario;
    }
}
