<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    if (session.getAttribute("usuario") != null) {
%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Sistema TMC| act/Producto</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
        <link href="dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
        <link href="bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="swetalert/sweetalert.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css">
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <header class="main-header">
                <a href="#" class="logo">
                    <span class="logo-mini"><b>T</b>MC</span>
                    <span class="logo-lg"><b>Administrador </b>TMC</span>
                </a>
                <nav class="navbar navbar-static-top" role="navigation">
                    <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                        <span class="sr-only"></span>
                    </a>
                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                            <li class="dropdown user user-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <img src="dist/img/user8-128x128.jpg" class="user-image" alt="User Image">
                                    <span class="hidden-xs"> ${usuario.nombreUsuario}</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="user-header">
                                        <p align= left>                    
                                            <small>Señor ${usuario.cargo.nombreCargo} usted como  miembro del personal TMC System, tiene la responsabilidad de mantener la seguridad de información dentro de las actividades relacionadas con su actividad laboral</small>
                                        </p>
                                    </li>
                                    <li class="user-footer">
                                        <div class="pull-right">
                                            <a href="srvUsuario?accion=retornarVista" class="btn btn-default btn-flat">PANEL PRINCIPAL</a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>
            <aside class="main-sidebar">
                <section class="sidebar">
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="dist/img/user8-128x128.jpg" class="img-circle" alt="User Image">
                        </div>
                        <div class="pull-left info">
                            <p>${usuario.nombreUsuario} </p>
                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>
                    <ul class="sidebar-menu" data-widget="tree">
                        <li><a href="#"><i ></i> <span></span></a></li>
                        <li class="treeview active">
                            <a href="#"><i class="glyphicon glyphicon-th-large"></i> <span>Actualizar</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="srvUsuario?accion=listarEmpleado"><i class="fa fa-address-book"></i> Empleados</a></li>                               
                                <li><a href="srvUsuario?accion=listarMarca"><i class="fa fa-deaf"></i> Marcas</a></li>
                                <li class="active"><a href="srvUsuario?accion=listarProductos"><i class="fa fa-cogs"></i> Productos</a></li>
                                <li><a href="srvUsuario?accion=listarProveedor"><i class="fa fa-motorcycle"></i> Proveedores</a></li>
                                <li><a href="srvUsuario?accion=listarUsuarios"><i class="fa fa-user"></i> Usuarios</a></li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#"><i class="fa fa-cart-arrow-down"></i> <span>Ventas</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="#"><i class="fa fa-cart-arrow-down"></i>Nueva Venta</a></li>
                                <li><a href="#"><i class="fa fa-tags"></i>Administrar Ventas</a></li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#"><i class="fa fa-area-chart"></i> <span>Reportes</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="#"><i class="fa fa-bar-chart"></i>Reportes Ventas</a></li>
                            </ul>
                        </li>
                    </ul>
                </section>
            </aside>
            <div class="content-wrapper">
                <section class="content-header">
                    <div class="row">
                        <div class="col-xs-12 col-md-3">
                        </div>
                        <div class="col-md-3 hidden-xs"></div>
                        <div class="col-xs-2 col-md-1">
                        </div>
                        <div class="col-xs-10 col-md-5 ">
                            <div class="btn-group pull-right">
                                <a href="srvUsuario?accion=listarProductos" class="btn btn-danger">
                                    <i class="fa fa-align-justify"></i> Cancelar</a>                                              
                            </div>
                        </div>
                    </div>
                </section>
                <section class="content">
                    <div class="box">
                        <div class="box-header with-border">
                            <i class="fa fa-edit"></i> <h3 class="box-title">Actualizar Datos Productos</h3>  
                        </div>
                        <form class="form-horizontal" action="srvUsuario?accion=actualizarProducto" method="post">
                            <input type="hidden" name="pCodigo" value="${productos.idProducto}">
                            <div class="box-body">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Nombres</label>
                                    <div class="col-sm-4 input-group">
                                        <span class="input-group-addon"><i class="fa fa-database"></i></span>
                                        <input id="nombre" type="text" class="form-control" placeholder="Ejem: JhonFy" name="txtPnombreProducto" maxlength="30"
                                               value="${productos.nombreProducto}"> 
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Descripcion</label>
                                    <div class="col-sm-4 input-group">
                                        <span class="input-group-addon"><i class="fa fa-database"></i></span>
                                        <input id="nombre" type="text" class="form-control" placeholder="Ejem: JhonFy" name="txtPdescripcion" maxlength="30"
                                               value="${productos.descripcion}"> 
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Precio</label>
                                    <div class="col-sm-4 input-group">
                                        <span class="input-group-addon"><i class="fa fa-database"></i></span>
                                        <input id="nombre" type="text" class="form-control" placeholder="Ejem: JhonFy" name="txtPprecio" maxlength="30"
                                               value="${productos.precio}"> 
                                    </div>
                                </div>
                                <div>
                                    <input  id="nombre"  type="hidden" class="form-control" placeholder="Ejem: Código Bogotá" name="txtPcantidad" maxlength="4" value="${productos.cantidad}">
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Marca</label>
                                    <div class="col-sm-4 input-group">
                                        <span class="input-group-addon"><i class="fa fa-motorcycle"></i></span>
                                        <select class="form-control"  name="txtMarcaPrd" autofocus=""  required="">
                                            <c:forEach items="${marcas}" var="lMarca">
                                                <option value="${lMarca.idMarca}"  
                                                        <c:if test="${lMarca.idMarca ==
                                                                      productos.marca.idMarca}">
                                                              selected
                                                        </c:if>
                                                        >${lMarca.nombreMarca}</option>
                                            </c:forEach>
                                        </select>
                                    </div>                                  
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Categoria</label>
                                    <div class="col-sm-4 input-group">
                                        <span class="input-group-addon"><i class="fa fa-database"></i></span>
                                        <select class="form-control"  name="txtCategoriaPrd" autofocus=""  required="">
                                            <c:forEach items="${categorias}" var="lCategoria">
                                                <option value="${lCategoria.idCategoria}"  
                                                        <c:if test="${lCategoria.idCategoria ==
                                                                      productos.categoria.idCategoria}">
                                                              selected
                                                        </c:if>
                                                        >${lCategoria.nombreCategoria}</option>
                                            </c:forEach>
                                        </select>
                                    </div>                                  
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Proveedor</label>
                                    <div class="col-sm-4 input-group">
                                        <span class="input-group-addon"><i class="fa fa-database"></i></span>
                                        <select class="form-control"  name="txtProveedorPrd" autofocus=""  required="">
                                            <c:forEach items="${proveedores}" var="lProveedores">
                                                <option value="${lProveedores.idProveedor}"  
                                                        <c:if test="${lProveedores.idProveedor ==
                                                                      productos.proveedores.idProveedor}">
                                                              selected
                                                        </c:if>
                                                        >${lProveedores.nombre}</option>
                                            </c:forEach>
                                        </select>
                                    </div>                                  
                                </div>  
                            </div>
                            <div class="box-footer">
                                <button type="submit" id="" name="actPrds" value="Actualizar" class="btn btn-success"><i class="fa fa-refresh"></i> Actualizar</button>
                            </div>
                        </form>
                    </div>
                </section> 
            </div>
            <footer class="main-footer">
                <div class="pull-right hidden-xs" style="font-weight:bold">
                    Administrador/PRODUCTOS
                </div>
                <strong>Copyright &copy; 2021 <a href="#">TecnicMotorCycles</a>.</strong> Todos los derechos reservados.
            </footer>
            <div class="control-sidebar-bg"></div>
        </div>
        <script src="bower_components/jquery/dist/jquery.min.js"></script>
        <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="dist/js/adminlte.min.js"></script>
    </body>
</html>
<%
    } else {
        response.sendRedirect("identificar.jsp");
    }
%>