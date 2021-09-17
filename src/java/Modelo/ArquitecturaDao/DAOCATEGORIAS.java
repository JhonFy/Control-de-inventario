package Modelo.ArquitecturaDao;

import Modelo.DaoTmc.categoria;
import Modelo.conexion;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAOCATEGORIAS extends conexion {
    
    public List<categoria> listarCategorias() throws Exception {
        List<categoria> categorias;
        categoria cat;
        ResultSet rscategoria = null;
        
        String sqlCategoria = "SELECT E.IDCATEGORIA, E.NOMBRECATEGORIA, ESTADO FROM CATEGORIA E "
                +"ORDER BY IDCATEGORIA";
        try{
            this.conectar(false);
            rscategoria = this.ejecutarOrdenDatos(sqlCategoria);
            categorias = new ArrayList<>();
            while(rscategoria.next() == true){
                cat = new categoria();
                cat.setIdCategoria(rscategoria.getInt("IDCATEGORIA"));
                cat.setNombreCategoria(rscategoria.getString("NOMBRECATEGORIA"));
                cat.setEstado(rscategoria.getString("ESTADO"));
                categorias.add(cat);
            }
            this.cerrar(true);
        }catch(Exception e){
            throw e;
        }finally {
        }
        return categorias;
    }
}