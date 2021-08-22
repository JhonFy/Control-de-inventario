package Modelo.ArquitecturaDao;

import Modelo.DaoTmc.cargo;
import Modelo.conexion;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAOCARGO extends conexion {

    public List<cargo> listarCargos() throws Exception {
        List<cargo> cargos;
        cargo car;
        ResultSet rs = null;
        String sql = "SELECT C.IDCARGO, C.NOMBRECARGO, C.ESTADO FROM CARGO C "
                + "ORDER BY C.IDCARGO";

        try {
            this.conectar(false);
            rs = this.ejecutarOrdenDatos(sql);
            cargos = new ArrayList<>();
            while (rs.next() == true) {
                car = new cargo();
                car.setCodigo(rs.getInt("IDCARGO"));
                car.setNombreCargo(rs.getString("NOMBRECARGO"));
                car.setEstado(rs.getBoolean("ESTADO"));
                cargos.add(car);
            }
            this.cerrar(true);
        } catch (Exception e) {
            throw e;
        } finally {
        }
        return cargos;
    }
}
