package Controlador;

import Modelo.ArquitecturaDao.DAOCARGO;
import Modelo.ArquitecturaDao.DAOCATEGORIAS;
import Modelo.ArquitecturaDao.DAOEMPLEADO;
import Modelo.ArquitecturaDao.DAOMARCA;
import Modelo.ArquitecturaDao.DAOPRODUCTOS;
import Modelo.ArquitecturaDao.DAOPROVEEDOR;
import Modelo.ArquitecturaDao.DAOUSUARIO;
import Modelo.DaoTmc.cargo;
import Modelo.DaoTmc.categoria;
import Modelo.DaoTmc.empleado;
import Modelo.DaoTmc.marca;
import Modelo.DaoTmc.productos;
import Modelo.DaoTmc.proveedores;
import Modelo.DaoTmc.usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "srvUsuario", urlPatterns = {"/srvUsuario"})
public class srvUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        try {
            if (accion != null) {
                switch (accion) {

                    case "verificar":
                        verificar(request, response);
                        break;

                    case "nuevoMarca":
                        presentarFormularioMarca(request, response);
                        break;
                    case "nuevoEmpleado":
                        presentarFormularioEmpleado(request, response);
                        break;
                    case "nuevoProducto":
                        presentarFormularioProducto(request, response);
                        break;
                    case "nuevoProveedor":
                        presentarFormularioProveedor(request, response);
                        break;
                    case "nuevo":
                        presentarFormularioUsuario(request, response);
                        break;

                    case "registrarMarca":
                        registrarMarca(request, response);
                        break;
                    case "registrarEmpleado":
                        registrarEmpleado(request, response);
                        break;
                    case "registrarProducto":
                        registrarProducto(request, response);
                        break;
                    case "registrarProveedor":
                        registrarProveedor(request, response);
                        break;
                    case "registrar":
                        registrarUsuario(request, response);
                        break;

                    case "listarMarca":
                        listarMarca(request, response);
                        break;
                    case "listarEmpleado":
                        listarEmpleado(request, response);
                        break;
                    case "listarProductos":
                        listarProductos(request, response);
                        break;
                    case "listarProveedor":
                        listarProveedor(request, response);
                        break;
                    case "listarUsuarios":
                        listarUsuarios(request, response);
                        break;
                    case "listarPoliticas":
                        listarPoliticas(request, response);
                        break;

                    case "leerMarca":
                        presentarMarca(request, response);
                        break;
                    case "leerEmpleado":
                        presentarEmpleado(request, response);
                        break;
                    case "leerProducto":
                        presentarProducto(request, response);
                        break;
                    case "leerProveedor":
                        presentarProveedor(request, response);
                        break;
                    case "leerUsuario":
                        presentarUsuario(request, response);
                        break;

                    case "actualizarMarca":
                        actualizarMarca(request, response);
                        break;
                    case "actualizarEmpleado":
                        actualizarEmpleado(request, response);
                        break;
                    case "actualizarProducto":
                        actualizarProducto(request, response);
                        break;
                    case "actualizarProveedor":
                        actualizarProveedor(request, response);
                        break;
                    case "actualizarUsuario":
                        actualizarUsuario(request, response);
                        break;

                    case "eliminarMarca":
                        eliminarMarca(request, response);
                        break;
                    case "eliminarEmpleado":
                        eliminarEmpleado(request, response);
                        break;
                    case "eliminarProducto":
                        eliminarProducto(request, response);
                        break;
                    case "eliminarProveedor":
                        eliminarProveedor(request, response);
                        break;
                    case "eliminarUsuario":
                        eliminarUsuario(request, response);
                        break;

                    case "retornarVista":
                        retornarVista(request, response);
                        break;
                    case "cerrar":
                        cerrarsession(request, response);
                        break;

                    default:
                        response.sendRedirect("identificar.jsp");
                }
            } else {
                response.sendRedirect("identificar.jsp");
            }
        } catch (Exception e) {
            try {
                this.getServletConfig().getServletContext().getRequestDispatcher("/mensaje.jsp").forward(request, response);

            } catch (Exception ex) {
                System.out.println("Error" + e.getMessage());
            }
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void verificar(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession sesion;
        DAOUSUARIO dao;
        usuario usuario;
        usuario = this.obtenerUsuario(request);

        dao = new DAOUSUARIO();
        usuario = dao.identificar(usuario);
        if (usuario != null && usuario.getCargo().getNombreCargo().equalsIgnoreCase("ADMINISTRADOR")) {
            sesion = request.getSession();
            sesion.setAttribute("usuario", usuario);
            request.setAttribute("msje", "Bienvenido al sistema");
            this.getServletConfig().getServletContext().getRequestDispatcher("/vistas/index.jsp").forward(request, response);
        } else if (usuario != null && usuario.getCargo().getNombreCargo().equalsIgnoreCase("VENDEDOR")) {
            sesion = request.getSession();
            sesion.setAttribute("vendedor", usuario);
            this.getServletConfig().getServletContext().getRequestDispatcher("/vistas/formVendedor.jsp").forward(request, response);
        } else {
            request.setAttribute("msje", "Credenciales Incorrectas");
            request.getRequestDispatcher("identificar.jsp").forward(request, response);
        }
    }

    private void presentarFormularioMarca(HttpServletRequest request, HttpServletResponse response) {
        try {
            this.getServletConfig().getServletContext()
                    .getRequestDispatcher("/vistas/Registrar/nuevaMarca.jsp").forward(request, response);
        } catch (Exception tmc) {
            System.err.println("TMC Informa  No Presenta El Formulario Registrar Marca: " + tmc.getMessage());
        }
    }

    public void presentarFormularioEmpleado(HttpServletRequest request, HttpServletResponse response) {
        try {
            this.getServletConfig().getServletContext()
                    .getRequestDispatcher("/vistas/Registrar/nuevoEmpleado.jsp").forward(request, response);
        } catch (Exception tmc) {
            System.err.println("TMC Informa  No Presenta El Formulario Registrar Empleado: " + tmc.getMessage());
        }
    }

    private void presentarFormularioProducto(HttpServletRequest request, HttpServletResponse response) {
        try {
            this.cargarCategorias(request);
            this.cargarMarcas(request);
            this.cargarProveedor(request);
            this.getServletConfig().getServletContext()
                    .getRequestDispatcher("/vistas/Registrar/nuevoProducto.jsp").forward(request, response);
        } catch (Exception e) {
            System.err.print("No Puedo Listar El Producto");
        }
    }

    private void presentarFormularioProveedor(HttpServletRequest request, HttpServletResponse response) {
        try {
            this.cargarCargos(request);
            this.getServletConfig().getServletContext()
                    .getRequestDispatcher("/vistas/Registrar/nuevoProveedor.jsp").forward(request, response);
        } catch (Exception tmc) {
            System.err.println("TMC Informa  No Presenta El Formulario Registrar Proveedor: " + tmc.getMessage());
        }
    }

    private void presentarFormularioUsuario(HttpServletRequest request, HttpServletResponse response) {
        try {
            this.cargarCargos(request);
            this.getServletConfig().getServletContext()
                    .getRequestDispatcher("/vistas/Registrar/nuevoUsuario.jsp").forward(request, response);
        } catch (Exception tmc) {
            System.err.println("TMC Informa  No Presenta El Formulario Registrar Usuario: " + tmc.getMessage());
        }
    }

    private void registrarMarca(HttpServletRequest request, HttpServletResponse response) {
        DAOMARCA daoMarca;
        marca mrc = null;
        if (request.getParameter("txtNombreMarca") != null
                && request.getParameter("txtEstadoMarca") != null) {
            mrc = new marca();
            mrc.setNombreMarca(request.getParameter("txtNombreMarca"));
            mrc.setEstado(request.getParameter("txtEstadoMarca"));
        }
        daoMarca = new DAOMARCA();
        try {
            daoMarca.registrarMarca(mrc);
            response.sendRedirect("srvUsuario?accion=listarMarca");
        } catch (Exception e) {
            System.err.print("No He Podido Listar La Marca");
        }
    }

    private void registrarEmpleado(HttpServletRequest request, HttpServletResponse response) {
        DAOEMPLEADO dEmpleado;
        empleado rEmpl = null;
        usuario rUsu;

        if (request.getParameter("txtNOMBREEmpl") != null
                && request.getParameter("txtAPELLIDOSEmpl") != null
                && request.getParameter("txtSEXOEmpl") != null
                && request.getParameter("txtTELEFONOEmpl") != null
                && request.getParameter("txtFECHANACIMIENTOEmpl") != null
                && request.getParameter("txtTIPODOCUMENTOEmpl") != null
                && request.getParameter("txtNUMERODOCUMENTOEmpl") != null
                && request.getParameter("txtIDUSUARIOEmpl") != null) {

            rEmpl = new empleado();
            rEmpl.setNOMBRE(request.getParameter("txtNOMBREEmpl"));
            rEmpl.setAPELLIDOS(request.getParameter("txtAPELLIDOSEmpl"));
            rEmpl.setSEXO(request.getParameter("txtSEXOEmpl"));
            rEmpl.setTELEFONO(request.getParameter("txtTELEFONOEmpl"));
            rEmpl.setFECHANACIMIENTO(request.getParameter("txtFECHANACIMIENTOEmpl"));
            rEmpl.setTIPODOCUMENTO(request.getParameter("txtTIPODOCUMENTOEmpl"));
            rEmpl.setNUMERODOCUMENTO(request.getParameter("txtNUMERODOCUMENTOEmpl"));

            rUsu = new usuario();
            rUsu.setId_usuario(Integer.parseInt(request.getParameter("txtIDUSUARIOEmpl")));
            rEmpl.setUsuario(rUsu);

            dEmpleado = new DAOEMPLEADO();
            try {
                dEmpleado.RegistrarEmpleado(rEmpl);
                response.sendRedirect("srvUsuario?accion=listarEmpleado");
            } catch (Exception e) {
                System.err.print("No Puedo Listar Los Empleados");
                this.presentarFormularioEmpleado(request, response);
            }
        }
    }

    private void registrarProducto(HttpServletRequest request, HttpServletResponse response) {
        DAOPRODUCTOS daoProductos;
        productos pRdn = null;
        categoria pRdCat;
        marca pRdMar;
        proveedores pRdPv;
        if (request.getParameter("txtnombrePrd") != null
                && request.getParameter("txtDescripcionPrd") != null
                && request.getParameter("txtPrecioPrd") != null
                && request.getParameter("txtCantidadPrd") != null
                && request.getParameter("txtCategoriaPrd") != null
                && request.getParameter("txtMarcaPrd") != null
                && request.getParameter("txtProveedorPrd") != null) {

            pRdn = new productos();
            pRdn.setNombreProducto(request.getParameter("txtnombrePrd"));
            pRdn.setDescripcion(request.getParameter("txtDescripcionPrd"));
            pRdn.setPrecio(Integer.parseInt(request.getParameter("txtPrecioPrd")));
            pRdn.setCantidad(request.getParameter("txtCantidadPrd"));

            pRdCat = new categoria();
            pRdCat.setIdCategoria(Integer.parseInt(request.getParameter("txtCategoriaPrd")));
            pRdn.setCategoria(pRdCat);

            pRdMar = new marca();
            pRdMar.setIdMarca(Integer.parseInt(request.getParameter("txtMarcaPrd")));
            pRdn.setMarca(pRdMar);

            pRdPv = new proveedores();
            pRdPv.setIdProveedor(Integer.parseInt(request.getParameter("txtProveedorPrd")));
            pRdn.setProveedores(pRdPv);

            daoProductos = new DAOPRODUCTOS();

            try {
                daoProductos.registrarProductos(pRdn);
                response.sendRedirect("srvUsuario?accion=listarProductos");
            } catch (Exception e) {
                System.err.print("No Puedo Listar Formulario Producto");
                this.presentarFormularioProducto(request, response);
            }
        }
    }

    private void registrarProveedor(HttpServletRequest request, HttpServletResponse response) {
        DAOPROVEEDOR daoProveedor;
        proveedores prv = null;
        if (request.getParameter("txtPrvNombre") != null
                && request.getParameter("txtPrvDireccion") != null
                && request.getParameter("txtPrvTelefono") != null
                && request.getParameter("txtPrvNit") != null
                && request.getParameter("txtPrvEstado") != null) {

            prv = new proveedores();
            prv.setNombre(request.getParameter("txtPrvNombre"));
            prv.setDireccion(request.getParameter("txtPrvDireccion"));
            prv.setTelefono(request.getParameter("txtPrvTelefono"));
            prv.setNit(request.getParameter("txtPrvNit"));
            prv.setEstado(request.getParameter("txtPrvEstado"));
        }
        daoProveedor = new DAOPROVEEDOR();
        try {
            daoProveedor.registroProveedor(prv);
            response.sendRedirect("srvUsuario?accion=listarProveedor");
        } catch (Exception e) {
            System.err.print("No Pude Listar El Proveedor");
            this.presentarFormularioProveedor(request, response);
        }

    }

    private void registrarUsuario(HttpServletRequest request, HttpServletResponse response) {
        DAOUSUARIO daoUsu;
        usuario usu = null;
        cargo carg;
        if (request.getParameter("txtNombre") != null
                && request.getParameter("txtClave") != null
                && request.getParameter("cboCargo") != null) {

            usu = new usuario();
            usu.setNombreUsuario(request.getParameter("txtNombre"));
            usu.setClave(request.getParameter("txtClave"));
            carg = new cargo();
            carg.setCodigo(Integer.parseInt(request.getParameter("cboCargo")));
            usu.setCargo(carg);
            if (request.getParameter("chkEstado") != null) {
                usu.setEstado(true);
            } else {
                usu.setEstado(false);
            }
            daoUsu = new DAOUSUARIO();
            try {
                daoUsu.registrarUsuarios(usu);
                response.sendRedirect("srvUsuario?accion=listarUsuarios");
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo registrar el usuario" + e.getMessage());
                request.setAttribute("usuario", usu);
                this.presentarFormularioUsuario(request, response);
            }
        }
    }

    private void listarMarca(HttpServletRequest request, HttpServletResponse response) {
        DAOMARCA daomarca = new DAOMARCA();
        List<marca> mtmc = null;
        try {
            mtmc = daomarca.listarMarca();
            request.setAttribute("marcas", mtmc);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo listar las marcas" + e.getMessage());
        } finally {
            daomarca = null;
        }
        try {
            this.getServletConfig().getServletContext()
                    .getRequestDispatcher("/vistas/Listar/marca.jsp").forward(request, response);
        } catch (Exception emarca) {
            request.setAttribute("msje", "No se puedo realizar la petición" + emarca.getMessage());
        }
    }

    private void listarEmpleado(HttpServletRequest request, HttpServletResponse response) {
        DAOEMPLEADO dempleado = new DAOEMPLEADO();
        List<empleado> etmc = null;
        try {
            etmc = dempleado.listarEmpleado();
            request.setAttribute("empleados", etmc);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo listar los empleados" + e.getMessage());
        } finally {
            dempleado = null;
        }
        try {
            this.getServletConfig().getServletContext()
                    .getRequestDispatcher("/vistas/Listar/empleado.jsp").forward(request, response);
        } catch (Exception empleado) {
            request.setAttribute("msje", "No se puedo realizar la petición" + empleado.getMessage());
        }

    }

    private void listarProductos(HttpServletRequest request, HttpServletResponse response) {
        DAOPRODUCTOS dproductos = new DAOPRODUCTOS();
        List<productos> emptmc = null;
        try {
            emptmc = dproductos.listarProductos();
            request.setAttribute("aProductos", emptmc);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo listar los empleados" + e.getMessage());
        } finally {
            dproductos = null;
        }
        try {
            this.getServletConfig().getServletContext()
                    .getRequestDispatcher("/vistas/Listar/productos.jsp").forward(request, response);
        } catch (Exception eempleado) {
            request.setAttribute("msje", "No se puedo realizar la petición" + eempleado.getMessage());
        }
    }

    private void listarProveedor(HttpServletRequest request, HttpServletResponse response) {
        DAOPROVEEDOR daop = new DAOPROVEEDOR();
        List<proveedores> ptmc = null;
        try {
            ptmc = daop.listarProveedor();
            request.setAttribute("proveedores", ptmc);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo listar los proveedores" + e.getMessage());
        } finally {
            daop = null;
        }
        try {
            this.getServletConfig().getServletContext()
                    .getRequestDispatcher("/vistas/Listar/proveedor.jsp").forward(request, response);
        } catch (Exception epv) {
            request.setAttribute("msje", "No se puedo realizar la petición" + epv.getMessage());
        }
    }

    private void listarUsuarios(HttpServletRequest request, HttpServletResponse response) {
        DAOUSUARIO dao = new DAOUSUARIO();
        List<usuario> usus = null;
        try {
            usus = dao.listarUsuarios();
            request.setAttribute("usuarios", usus);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo listar los usuarios" + e.getMessage());
        } finally {
            dao = null;
        }
        try {
            this.getServletConfig().getServletContext()
                    .getRequestDispatcher("/vistas/Listar/usuarios.jsp").forward(request, response);
        } catch (Exception ex) {
            request.setAttribute("msje", "No se puedo realizar la petición" + ex.getMessage());
        }
    }

    private void listarPoliticas(HttpServletRequest request, HttpServletResponse response) {
        try {
            this.getServletConfig().getServletContext()
                    .getRequestDispatcher("/vistas/Listar/politicas.jsp").forward(request, response);
        } catch (Exception e) {
        }
    }

    private void presentarMarca(HttpServletRequest request, HttpServletResponse response) {
        DAOMARCA dMarca;
        marca pmarca;
        if (request.getParameter("cActualizarm") != null) {
            pmarca = new marca();
            pmarca.setIdMarca(Integer.parseInt(request.getParameter("cActualizarm")));
            dMarca = new DAOMARCA();
            try {
                pmarca = dMarca.leerMarca(pmarca);
                if (pmarca != null) {
                    request.setAttribute("marca", pmarca);
                } else {
                    request.setAttribute("msje", "No se encontro la Marca");
                }
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo acceder a la base de datos" + e.getMessage());
            }
        } else {
            request.setAttribute("msje", "No se tiene el parámetro necesario");
        }
        try {
            this.getServletConfig().getServletContext().
                    getRequestDispatcher("/vistas/Actualizar/actualizarMarca.jsp"
                    ).forward(request, response);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo realizar la operacion" + e.getMessage());
        }
    }

    private void presentarEmpleado(HttpServletRequest request, HttpServletResponse response) {
        DAOEMPLEADO dEmpl;
        empleado pEmpleado;

        if (request.getParameter("cActualizare") != null) {
            pEmpleado = new empleado();
            pEmpleado.setIDEMPLEADO(Integer.parseInt(request.getParameter("cActualizare")));
            dEmpl = new DAOEMPLEADO();

            try {
                pEmpleado = dEmpl.leerEmpleado(pEmpleado);
                if (pEmpleado != null) {
                    request.setAttribute("empleado", pEmpleado);
                } else {
                    System.err.print("No Puedo Leer El Empleado");
                }
            } catch (Exception e) {
                System.err.println("No Puedo Listar El Empleado: " + e.getMessage());
            }
        } else {
            System.err.println("No Se Tiene El Parametro Empleado ");
        }
        try {
            this.getServletConfig().getServletContext().
                    getRequestDispatcher("/vistas/Actualizar/actualizarEmpleado.jsp"
                    ).forward(request, response);
        } catch (Exception e) {
            System.err.println("No Se Puede Realizar La Operacion");
        }
    }

    private void presentarProducto(HttpServletRequest request, HttpServletResponse response) {
        DAOPRODUCTOS dProducto;
        productos pProductos;

        if (request.getParameter("cActualizarPrd") != null) {
            pProductos = new productos();
            pProductos.setIdProducto(Integer.parseInt(request.getParameter("cActualizarPrd")));

            dProducto = new DAOPRODUCTOS();

            try {
                pProductos = dProducto.leerProductos(pProductos);
                if (pProductos != null) {
                    request.setAttribute("productos", pProductos);
                } else {
                    System.err.print("No Puedo Leer El Producto");
                }
            } catch (Exception e) {
                System.err.print("No Puedo Listar El Producto: " + e.getMessage());
            }
        } else {
            System.err.print("No Se Tiene El Parametro Producto");
        }
        try {
            this.cargarCategorias(request);
            this.cargarMarcas(request);
            this.cargarProveedor(request);
            this.getServletConfig().getServletContext().
                    getRequestDispatcher("/vistas/Actualizar/actualizarProducto.jsp"
                    ).forward(request, response);
        } catch (Exception e) {
            System.err.print("No Se Pudo Realizar La Operacion");
        }
    }

    private void presentarProveedor(HttpServletRequest request, HttpServletResponse response) {

        DAOPROVEEDOR dprovd;
        proveedores pPrveedor;

        if (request.getParameter("aActProveedor") != null) {
            pPrveedor = new proveedores();
            pPrveedor.setIdProveedor(Integer.parseInt(request.getParameter("aActProveedor")));
            dprovd = new DAOPROVEEDOR();
            try {
                pPrveedor = dprovd.leerProveedor(pPrveedor);
                if (pPrveedor != null) {
                    request.setAttribute("proveedores", pPrveedor);
                } else {
                    System.err.println("Socio No Puedo Listar el Proveedor: ");
                }
            } catch (Exception e) {
                System.err.println("No Puedo Acceder A La Base De Datos: " + e.getMessage());
            }
        } else {
            System.err.println("No Se Tiene El Parametro Necesario");
        }
        try {
            this.getServletConfig().getServletContext().
                    getRequestDispatcher("/vistas/Actualizar/actualizarProveedor.jsp"
                    ).forward(request, response);
        } catch (Exception e) {
            System.err.println("No Se Puede Realizar La Operacion");
        }
    }

    private void presentarUsuario(HttpServletRequest request, HttpServletResponse response) {
        DAOUSUARIO dao;
        usuario usus;
        if (request.getParameter("cod") != null) {
            usus = new usuario();
            usus.setId_usuario(Integer.parseInt(request.getParameter("cod")));

            dao = new DAOUSUARIO();
            try {
                usus = dao.leerUsuario(usus);
                if (usus != null) {
                    request.setAttribute("usuario", usus);
                } else {
                    request.setAttribute("msje", "No se encontró el Usuario");
                }
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo acceder a la base de datos" + e.getMessage());
            }
        } else {
            request.setAttribute("msje", "No se tiene el parámetro necesario");
        }
        try {
            this.cargarCargos(request);
            this.getServletConfig().getServletContext().
                    getRequestDispatcher("/vistas/Actualizar/actualizarUsuario.jsp"
                    ).forward(request, response);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo realizar la operacion" + e.getMessage());
        }
    }

    private void actualizarMarca(HttpServletRequest request, HttpServletResponse response) {
        DAOMARCA daoMarca;
        marca actmarca = null;

        if (request.getParameter("marcaCodigo") != null
                && request.getParameter("txtNombreMarca") != null
                && request.getParameter("txtEstado") != null) {

            actmarca = new marca();
            actmarca.setIdMarca(Integer.parseInt(request.getParameter("marcaCodigo")));
            actmarca.setNombreMarca(request.getParameter("txtNombreMarca"));
            actmarca.setEstado(request.getParameter("txtEstado"));

            daoMarca = new DAOMARCA();
            try {
                daoMarca.actualizarMarca(actmarca);
                response.sendRedirect("srvUsuario?accion=listarMarca");
            } catch (Exception a) {
                request.setAttribute("msje",
                        "No se pudo actualizar el usuario" + a.getMessage());
                request.setAttribute("usuario", actmarca);
            }
            try {
                this.getServletConfig().getServletContext().
                        getRequestDispatcher("/vistas/Actualizar/actualizarMarca.jsp"
                        ).forward(request, response);
            } catch (Exception b) {
                request.setAttribute("msje", "No se pudo realizar la operacion" + b.getMessage());
            }
        }
    }

    private void actualizarEmpleado(HttpServletRequest request, HttpServletResponse response) {
        DAOEMPLEADO daoEmpleado;
        empleado actEmpleado = null;
        usuario eUsuario;

        if (request.getParameter("empCodigo") != null
                && request.getParameter("txtNombreEmpl") != null
                && request.getParameter("txtApellidosEmpl") != null
                && request.getParameter("txtIgeneroEmpl") != null
                && request.getParameter("txtTelefonoEmpl") != null
                && request.getParameter("txtTipoDocEmpl") != null
                && request.getParameter("txtFfinal") != null
                && request.getParameter("txtNumerod") != null
                && request.getParameter("txtRol") != null) {

            actEmpleado = new empleado();
            actEmpleado.setIDEMPLEADO(Integer.parseInt(request.getParameter("empCodigo")));
            actEmpleado.setNOMBRE(request.getParameter("txtNombreEmpl"));
            actEmpleado.setAPELLIDOS(request.getParameter("txtApellidosEmpl"));
            actEmpleado.setSEXO(request.getParameter("txtIgeneroEmpl"));
            actEmpleado.setTELEFONO(request.getParameter("txtTelefonoEmpl"));
            actEmpleado.setTIPODOCUMENTO(request.getParameter("txtTipoDocEmpl"));
            actEmpleado.setFECHANACIMIENTO(request.getParameter("txtFfinal"));
            actEmpleado.setNUMERODOCUMENTO(request.getParameter("txtNumerod"));
            eUsuario = new usuario();
            eUsuario.setId_usuario(Integer.parseInt(request.getParameter("txtRol")));
            actEmpleado.setUsuario(eUsuario);

            daoEmpleado = new DAOEMPLEADO();
            try {
                daoEmpleado.actualizarEmpleado(actEmpleado);
                response.sendRedirect("srvUsuario?accion=listarEmpleado");
            } catch (Exception e) {
                System.err.println("No Puedo Actualizar El Empleado" + e.getMessage());
            }
            try {
                this.getServletConfig().getServletContext().
                        getRequestDispatcher("/vistas/Actualizar/actualizarEmpleado.jsp"
                        ).forward(request, response);
            } catch (Exception e) {
                System.err.println("No Puedo Realizar La Operación" + e.getMessage());
            }
        }
    }

    private void actualizarProducto(HttpServletRequest request, HttpServletResponse response) {
        DAOPRODUCTOS daoProductos;
        productos actProductos = null;

        categoria catProd;
        marca marProd;
        proveedores provProd;

        if (request.getParameter("pCodigo") != null
                && request.getParameter("txtPnombreProducto") != null
                && request.getParameter("txtPdescripcion") != null
                && request.getParameter("txtPprecio") != null
                && request.getParameter("txtPcantidad") != null
                && request.getParameter("txtMarcaPrd") != null
                && request.getParameter("txtCategoriaPrd") != null
                && request.getParameter("txtProveedorPrd") != null) {

            actProductos = new productos();
            actProductos.setIdProducto(Integer.parseInt(request.getParameter("pCodigo")));
            actProductos.setNombreProducto(request.getParameter("txtPnombreProducto"));
            actProductos.setDescripcion(request.getParameter("txtPdescripcion"));
            actProductos.setPrecio(Integer.parseInt(request.getParameter("txtPprecio")));
            actProductos.setCantidad(request.getParameter("txtPcantidad"));

            catProd = new categoria();
            catProd.setIdCategoria(Integer.parseInt(request.getParameter("txtCategoriaPrd")));
            actProductos.setCategoria(catProd);

            marProd = new marca();
            marProd.setIdMarca(Integer.parseInt(request.getParameter("txtMarcaPrd")));
            actProductos.setMarca(marProd);

            provProd = new proveedores();
            provProd.setIdProveedor(Integer.parseInt(request.getParameter("txtProveedorPrd")));
            actProductos.setProveedores(provProd);

            daoProductos = new DAOPRODUCTOS();
            try {
                daoProductos.actualizarProductos(actProductos);
                response.sendRedirect("srvUsuario?accion=listarProductos");
            } catch (Exception e) {
                System.err.println("No Puedo Actualizar El Producto" + e.getMessage());
            }
            try {
                this.cargarMarcas(request);
                this.cargarCategorias(request);
                this.cargarProveedor(request);
                this.getServletConfig().getServletContext().
                        getRequestDispatcher("/vistas/Actualizar/actualizarProducto.jsp"
                        ).forward(request, response);
            } catch (Exception e) {
                System.err.println("No Puedo Realizar La Operación" + e.getMessage());
            }
        }
    }

    private void actualizarProveedor(HttpServletRequest request, HttpServletResponse response) {

        DAOPROVEEDOR daoprv;
        proveedores actprv = null;

        if (request.getParameter("pvrCodigo") != null
                && request.getParameter("txtNombrePrvd") != null
                && request.getParameter("txtDireccion") != null
                && request.getParameter("txtTelefono") != null
                && request.getParameter("txtNit") != null
                && request.getParameter("txtEstadoPrd") != null) {

            actprv = new proveedores();
            actprv.setIdProveedor(Integer.parseInt(request.getParameter("pvrCodigo")));
            actprv.setNombre(request.getParameter("txtNombrePrvd"));
            actprv.setDireccion(request.getParameter("txtDireccion"));
            actprv.setTelefono(request.getParameter("txtTelefono"));
            actprv.setNit(request.getParameter("txtNit"));
            actprv.setEstado(request.getParameter("txtEstadoPrd"));

            daoprv = new DAOPROVEEDOR();
            try {
                daoprv.actualizarProveedor(actprv);
                response.sendRedirect("srvUsuario?accion=listarProveedor");
            } catch (Exception e) {
                System.err.println("No Puedo Actualizar El Proveedor: " + e.getMessage());
            }
            try {
                this.getServletConfig().getServletContext().
                        getRequestDispatcher("/vistas/Actualizar/actualizarProveedor.jsp"
                        ).forward(request, response);
            } catch (Exception e) {
                System.err.println("Socio No Se Puede Ralizar La Operacion: " + e.getMessage());
            }
        }
    }

    private void actualizarUsuario(HttpServletRequest request, HttpServletResponse response) {
        DAOUSUARIO daoUsu;
        usuario usus = null;
        cargo car;

        if (request.getParameter("hCodigo") != null
                && request.getParameter("txtNombre") != null
                && request.getParameter("txtClave") != null
                && request.getParameter("cboCargo") != null) {

            usus = new usuario();
            usus.setId_usuario(Integer.parseInt(request.getParameter("hCodigo")));
            usus.setNombreUsuario(request.getParameter("txtNombre"));
            usus.setClave(request.getParameter("txtClave"));
            car = new cargo();
            car.setCodigo(Integer.parseInt(request.getParameter("cboCargo")));
            usus.setCargo(car);
            if (request.getParameter("chkEstado") != null) {
                usus.setEstado(true);
            } else {
                usus.setEstado(false);
            }
            daoUsu = new DAOUSUARIO();
            try {
                daoUsu.actualizarUsuarios(usus);
                response.sendRedirect("srvUsuario?accion=listarUsuarios");
            } catch (Exception e) {
                request.setAttribute("msje",
                        "No se pudo actualizar el usuario" + e.getMessage());
                request.setAttribute("usuario", usus);
            }
            try {
                this.cargarCargos(request);
                this.getServletConfig().getServletContext().
                        getRequestDispatcher("/vistas/Actualizar/actualizarUsuario.jsp"
                        ).forward(request, response);
            } catch (Exception ex) {
                request.setAttribute("msje", "No se pudo realizar la operacion" + ex.getMessage());
            }
        }
    }

    private void eliminarMarca(HttpServletRequest request, HttpServletResponse response) {
        DAOMARCA dnarca = new DAOMARCA();
        marca mtc = new marca();
        if (request.getParameter("codMarca") != null) {
            mtc.setIdMarca(Integer.parseInt(request.getParameter("codMarca")));
            try {
                dnarca.eliminarMarca(mtc);
                response.sendRedirect("srvUsuario?accion=listarMarca");
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo acceder a la base de datos" + e.getMessage());
            }
        } else {
            request.setAttribute("msje", "No se encontro la Marca");
        }
    }

    private void eliminarEmpleado(HttpServletRequest request, HttpServletResponse response) {
        DAOEMPLEADO dEmpleado = new DAOEMPLEADO();
        empleado tmcempleado = new empleado();
        if (request.getParameter("codEmpleado") != null) {
            tmcempleado.setIDEMPLEADO(Integer.parseInt(request.getParameter("codEmpleado")));
            try {
                dEmpleado.eliminarEmpleado(tmcempleado);
                response.sendRedirect("srvUsuario?accion=listarEmpleado");
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo acceder a la base de datos" + e.getMessage());
            }
        } else {
            request.setAttribute("msje", "No se encontro el Empleado");
        }
    }

    private void eliminarProducto(HttpServletRequest request, HttpServletResponse response) {
        DAOPRODUCTOS dProductos = new DAOPRODUCTOS();
        productos tmcproductos = new productos();
        if (request.getParameter("codProductos") != null) {
            tmcproductos.setIdProducto(Integer.parseInt(request.getParameter("codProductos")));
            try {
                dProductos.eliminarProductos(tmcproductos);
                response.sendRedirect("srvUsuario?accion=listarProductos");
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo acceder a la base de datos" + e.getMessage());
            }
        } else {
            request.setAttribute("msje", "No se encontro el Producto");
        }
    }

    private void eliminarProveedor(HttpServletRequest request, HttpServletResponse response) {
        DAOPROVEEDOR dproveedor = new DAOPROVEEDOR();
        proveedores tmcprv = new proveedores();
        if (request.getParameter("codProveedor") != null) {
            tmcprv.setIdProveedor(Integer.parseInt(request.getParameter("codProveedor")));
            try {
                dproveedor.eliminarProveedor(tmcprv);
                response.sendRedirect("srvUsuario?accion=listarProveedor");
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo acceder a la base de datos" + e.getMessage());
            }
        } else {
            request.setAttribute("msje", "No se encontro el Proveedor");
        }
    }

    private void eliminarUsuario(HttpServletRequest request, HttpServletResponse response) {
        DAOUSUARIO dao = new DAOUSUARIO();
        usuario usus = new usuario();
        if (request.getParameter("cod") != null) {
            usus.setId_usuario(Integer.parseInt(request.getParameter("cod")));
            try {
                dao.eliminarUsuario(usus);
                response.sendRedirect("srvUsuario?accion=listarUsuarios");
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo acceder a la base de datos" + e.getMessage());
            }
        } else {
            request.setAttribute("msje", "No se encontro el usuario");
        }
    }

    private void retornarVista(HttpServletRequest request, HttpServletResponse response) {
        try {
            this.getServletConfig().getServletContext()
                    .getRequestDispatcher("/vistas/index.jsp").forward(request, response);
        } catch (Exception e) {
        }
    }

    private void cerrarsession(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession sesion = request.getSession();
        sesion.setAttribute("usuario", null);
        sesion.invalidate();
        response.sendRedirect("identificar.jsp");
    }

    private usuario obtenerUsuario(HttpServletRequest request) {
        usuario u = new usuario();
        u.setNombreUsuario(request.getParameter("txtUsu"));
        u.setClave(request.getParameter("txtPass"));
        return u;
    }

    private void cargarCargos(HttpServletRequest request) {
        DAOCARGO dao = new DAOCARGO();
        List<cargo> car = null;
        try {
            car = dao.listarCargos();
            request.setAttribute("cargos", car);
        } catch (Exception e) {
            request.setAttribute("msje", "No se pudo cargar los cargos :( " + e.getMessage());
        } finally {
            car = null;
            dao = null;
        }
    }

    public void cargarMarcas(HttpServletRequest request) {
        DAOMARCA dMarca = new DAOMARCA();
        List<marca> carMarca = null;
        try {
            carMarca = dMarca.listarMarca();
            request.setAttribute("marcas", carMarca);
        } catch (Exception e) {
            System.err.print("No Se Pudo Cargar La Marca" + e.getMessage());
        }
    }

    public void cargarCategorias(HttpServletRequest request) {
        DAOCATEGORIAS dCategoria = new DAOCATEGORIAS();
        List<categoria> cCategorias = null;
        try {
            cCategorias = dCategoria.listarCategorias();
            request.setAttribute("categorias", cCategorias);
        } catch (Exception e) {
            System.err.print("No Se Pudo Cargar La Categoria" + e.getMessage());
        }
    }

    public void cargarProveedor(HttpServletRequest request) {
        DAOPROVEEDOR cProveedor = new DAOPROVEEDOR();
        List<proveedores> lProveedor = null;
        try {
            lProveedor = cProveedor.listarProveedor();
            request.setAttribute("proveedores", lProveedor);
        } catch (Exception e) {
            System.err.print("No Se Pudo Cargar La Categoria" + e.getMessage());
        }

    }
}

//System.err.println("Socio No Puedo Listar La Marca: " + a.getMessage());
