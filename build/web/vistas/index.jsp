<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    if (session.getAttribute("usuario") != null) {
%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Sistema TMC| Inicio</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
        <link href="dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <header class="main-header">
                <a href="#" class="logo">
                    <span class="logo-mini"><b>T</b>MC</span>
                    <span class="logo-lg"><b>TMC </b>Administrador</span>
                </a>
                <nav class="navbar navbar-static-top" role="navigation">
                    <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                        <span class="sr-only">Toggle navigation</span>
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
                                        <img src="dist/img/user8-128x128.jpg" class="img-circle" alt="User Image">
                                        <p>                    
                                            Bienvenido - ${usuario.nombreUsuario}
                                            <small>Usted es,${usuario.cargo.nombreCargo} </small>
                                        </p>
                                    </li>
                                    <li class="user-footer">
                                        <div class="pull-right">
                                            <a href="srvUsuario?accion=cerrar" class="btn btn-default btn-flat">Cerrar Session</a>
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
                            <p>Bienvenido,  ${usuario.nombreUsuario} </p>
                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>
                    <ul class="sidebar-menu" data-widget="tree">
                        <li><a href="#"><i ></i> <span></span></a></li>
                        <li class="treeview">
                            <a href="#"><i class="glyphicon glyphicon-th-large"></i> <span>E-Mail</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="#"><i class="fa fa-refresh fa-spin fa-1x fa-fw"></i>Redactar</a></li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#"><i class="glyphicon glyphicon-th-large"></i> <span>Masivo</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="#"><i class="fa fa-refresh fa-spin fa-1x fa-fw"></i>Redactar</a></li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#"><i class="glyphicon glyphicon-th-large"></i> <span>Registros</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="srvUsuario?accion=listarEmpleado"><i class="fa fa-address-book"></i> Empleados</a></li>                               
                                <li><a href="srvUsuario?accion=listarMarca"><i class="fa fa-deaf"></i> Marcas</a></li>
                                <li><a href="srvUsuario?accion=listarProductos"><i class="fa fa-cogs"></i> Productos</a></li>
                                <li><a href="srvUsuario?accion=listarProveedor"><i class="fa fa-motorcycle"></i> Proveedores</a></li>
                                <li><a href="srvUsuario?accion=listarUsuarios"><i class="fa fa-user"></i> Usuarios</a></li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#"><i class="glyphicon glyphicon-th-large"></i> <span>Reportes</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="#"><i class="fa fa-refresh fa-spin fa-1x fa-fw"></i>Redactar</a></li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#"><i class="glyphicon glyphicon-th-large"></i> <span>Políticas</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="srvUsuario?accion=listarPoliticas"><i class="fa fa-cogs"></i>Politicas</a></li>
                            </ul>
                        </li>
                    </ul>
                </section>
            </aside>
            <div class="content-wrapper">
                <br><br>
                <section class="content">
                    <div class="row">
                        <div class="col-lg-3 col-xs-6">
                            <div class="small-box bg-aqua">
                                <div class="inner">
                                    <h3>#1</h3>
                                    <p>Colaboradores TMC</p>
                                </div>
                                <div class="icon">
                                    <i class="ion-person-stalker"></i>
                                </div>
                                <a href="srvUsuario?accion=listarEmpleado" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-xs-6">
                            <div class="small-box bg-red-gradient">
                                <div class="inner">
                                    <h3>#2<sup style="font-size: 20px">%</sup></h3>
                                    <p>Categorias TMC</p>
                                </div>
                                <div class="icon">
                                    <i class="ion-android-wifi"></i>
                                </div>
                                <a href="srvUsuario?accion=listarCategorias" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-xs-6">
                            <div class="small-box bg-olive">
                                <div class="inner">
                                    <h3>#3</h3>
                                    <p>Usuarios TMC</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-person-add"></i>
                                </div>
                                <a href="srvUsuario?accion=listarUsuarios" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-xs-6">
                            <div class="small-box bg-yellow-gradient">
                                <div class="inner">
                                    <h3>#4</h3>
                                    <p>Marcas TMC</p>
                                </div>
                                <div class="icon">
                                    <i class="ion-ios-world"></i>
                                </div>
                                <a href="srvUsuario?accion=listarMarca" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-xs-6">
                            <div class="small-box bg-purple-gradient">
                                <div class="inner">
                                    <h3>#5</h3>

                                    <p>Productos TMC</p>
                                </div>
                                <div class="icon">
                                    <i class="ion-ios-cog"></i>
                                </div>
                                <a href="srvUsuario?accion=listarProductos" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-xs-6">
                            <div class="small-box bg-light-blue-gradient">
                                <div class="inner">
                                    <h3>#6</h3>

                                    <p>Proveedores TMC</p>
                                </div>
                                <div class="icon">
                                    <i class="ion-android-star-half"></i>
                                </div>
                                <a href="srvUsuario?accion=listarProveedor" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-xs-6">
                            <div class="small-box bg-maroon-gradient">
                                <div class="inner">
                                    <h3>#7</h3>

                                    <p>Cargo TMC</p>
                                </div>
                                <div class="icon">
                                    <i class="ion-steam"></i>
                                </div>
                                <a href="srvUsuario?accion=listarCargo" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-xs-6">
                            <div class="small-box bg-teal">
                                <div class="inner">
                                    <h3>Politicas</h3>
                                    <p>Administrativas</p>
                                </div>
                                <div class="icon">
                                    <i class="ion-social-buffer"></i>
                                </div> 
                                <a href="srvUsuario?accion=listarPoliticas"class="small-box-footer">TecnicMotorCycles<i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <footer class="main-footer">
                <div class="pull-right hidden-xs" style="font-weight:bold">
                    Menú/TMC
                </div>
                <a  href="https://github.com/JhonFy/Control-de-inventario.git" class="fa fa-github-alt" target="_blank"> <b>TecnicMotorCycles</b></a>
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
