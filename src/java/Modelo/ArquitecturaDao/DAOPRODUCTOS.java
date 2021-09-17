package Modelo.ArquitecturaDao;

import Modelo.DaoTmc.categoria;
import Modelo.DaoTmc.marca;
import Modelo.DaoTmc.productos;
import Modelo.DaoTmc.proveedores;
import Modelo.conexion;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAOPRODUCTOS extends conexion {

    public productos leerProductos(productos tmcProductos) throws Exception {
        productos lctProductos = null;
        ResultSet srlProductos = null;

        String sqlLeer = " SELECT A.IDPRODUCTO, A.NOMBREPRODUCTO, A.DESCRIPCION, A.PRECIO, A.CANTIDAD, A.IDCATEGORIA, A.IDMARCA, A.IDPROVEEDOR "
                + "FROM productos A WHERE A.IDPRODUCTO = " + tmcProductos.getIdProducto();

        try {
            this.conectar(false);
            srlProductos = this.ejecutarOrdenDatos(sqlLeer);
            if (srlProductos.next() == true) {
                lctProductos = new productos();
                lctProductos.setIdProducto(srlProductos.getInt("IDPRODUCTO"));
                lctProductos.setNombreProducto(srlProductos.getString("NOMBREPRODUCTO"));
                lctProductos.setDescripcion(srlProductos.getString("DESCRIPCION"));
                lctProductos.setPrecio(srlProductos.getInt("PRECIO"));
                lctProductos.setCantidad(srlProductos.getString("CANTIDAD"));
                lctProductos.setCategoria(new categoria());
                lctProductos.getCategoria().setIdCategoria(srlProductos.getInt("IDCATEGORIA"));
                lctProductos.setMarca(new marca());
                lctProductos.getMarca().setIdMarca(srlProductos.getInt("IDMARCA"));
                lctProductos.setProveedores(new proveedores());
                lctProductos.getProveedores().setIdProveedor(srlProductos.getInt("IDPROVEEDOR"));
            }
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        } finally {
        }
        return lctProductos;
    }

    public List<productos> listarProductos() throws Exception {
        List<productos> lProductos;
        productos tmcProductos;
        ResultSet rsProductos = null;

        String sqlproductos = " SELECT A.IDPRODUCTO, A.NOMBREPRODUCTO, A.DESCRIPCION, A.PRECIO, A.CANTIDAD, B.NOMBRECATEGORIA, C.NOMBREMARCA, D.NOMBRE "
                + " FROM productos A INNER JOIN categoria B "
                + " ON B.idCategoria = A.idCategoria "
                + " INNER JOIN marca C "
                + " ON C.idMarca = A.idMarca "
                + " INNER JOIN proveedores D "
                + " ON D.idProveedor = A.idProveedor "
                + " ORDER BY A.IDPRODUCTO ";
        try {
            this.conectar(false);
            rsProductos = this.ejecutarOrdenDatos(sqlproductos);
            lProductos = new ArrayList<>();
            while (rsProductos.next() == true) {
                tmcProductos = new productos();
                tmcProductos.setIdProducto(rsProductos.getInt("IDPRODUCTO"));
                tmcProductos.setNombreProducto(rsProductos.getString("NOMBREPRODUCTO"));
                tmcProductos.setDescripcion(rsProductos.getString("DESCRIPCION"));
                tmcProductos.setPrecio(rsProductos.getInt("PRECIO"));
                tmcProductos.setCantidad(rsProductos.getString("CANTIDAD"));
                tmcProductos.setCategoria(new categoria());
                tmcProductos.getCategoria().setNombreCategoria(rsProductos.getString("NOMBRECATEGORIA"));
                tmcProductos.setMarca(new marca());
                tmcProductos.getMarca().setNombreMarca(rsProductos.getString("NOMBREMARCA"));
                tmcProductos.setProveedores(new proveedores());
                tmcProductos.getProveedores().setNombre(rsProductos.getString("NOMBRE"));
                lProductos.add(tmcProductos);
            }
            this.cerrar(true);
        } catch (Exception e) {
            System.err.print("No Se Pueden Listar Los Proveedores");
            throw e;
        } finally {
        }
        return lProductos;
    }

    public void registrarProductos(productos pRds) throws Exception {
        String sqlpRds;

        sqlpRds = "INSERT INTO productos (nombreProducto, descripcion, precio, cantidad, idCategoria, idMarca, idProveedor) "
                + "VALUES ('" + pRds.getNombreProducto() + "',  '"
                + pRds.getDescripcion() + "',  '"
                + pRds.getPrecio() + "',  '"
                + pRds.getCantidad() + "',  "
                + pRds.getCategoria().getIdCategoria() + ", "
                + pRds.getMarca().getIdMarca() + ",  "
                + pRds.getProveedores().getIdProveedor() + ")";
        try {
            this.conectar(false);
            this.ejecutarOrden(sqlpRds);
            this.cerrar(true);
        } catch (Exception e) {
            System.err.print("Fallo SQl Productos Registrar");
            this.cerrar(false);
            throw e;
        }
    }

    public void actualizarProductos(productos aProductos) throws Exception {
        String sqlAproductos = "UPDATE productos SET NOMBREPRODUCTO = '"
                + aProductos.getNombreProducto() + "', DESCRIPCION = '"
                + aProductos.getDescripcion() + "', PRECIO = '"
                + aProductos.getPrecio() + "', CANTIDAD = '"
                + aProductos.getCantidad() + "', IDCATEGORIA = "
                + aProductos.getCategoria().getIdCategoria() + ", IDMARCA = "
                + aProductos.getMarca().getIdMarca() + ", IDPROVEEDOR = "
                + aProductos.getProveedores().getIdProveedor()
                + " WHERE IDPRODUCTO = " + aProductos.getIdProducto();
        try {
            this.conectar(false);
            this.ejecutarOrden(sqlAproductos);
            this.cerrar(false);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        }

    }

    public void eliminarProductos(productos tmcproductos) throws Exception {
        String sqldproductos = "DELETE FROM PRODUCTOS "
                + "WHERE IDPRODUCTO = " + tmcproductos.getIdProducto();
        try {
            this.conectar(false);
            this.ejecutarOrden(sqldproductos);
            this.cerrar(true);
        } catch (Exception e) {
            this.cerrar(false);
            throw e;
        }
    }
}
