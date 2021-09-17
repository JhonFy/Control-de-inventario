<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    if (session.getAttribute("usuario") != null) {
%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Sistema TMC| Politicas</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
        <link href="dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
        <link href="bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="swetalert/sweetalert.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
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
                            <a href="#"><i class="glyphicon glyphicon-th-large"></i> <span>Políticas TMC</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="srvUsuario?accion=listarEmpleado"><i class="fa fa-address-book"></i> Empleados</a></li>                               
                                <li><a href="srvUsuario?accion=listarMarca"><i class="fa fa-deaf"></i> Marcas</a></li>
                                <li class="active"><a href="srvUsuario?accion=listarPoliticas"><i class="fa fa-cogs"></i> Políticas</a></li>
                                <li><a href="srvUsuario?accion=listarProductos"><i class="fa fa-cogs"></i> Productos</a></li>
                                <li><a href="srvUsuario?accion=listarProveedor"><i class="fa fa-motorcycle"></i> Proveedores</a></li>
                                <li><a href="srvUsuario?accion=listarUsuarios"><i class="fa fa-user"></i> Usuarios</a></li>
                            </ul>
                        </li>
                    </ul>
                </section>
            </aside>
            <div class="content-wrapper">
                <section class="content">
                    <div>
                        <FONT FACE="arial" SIZE=4 ><b>Política De Seguridad De La Información Y SGSI TecnicMotorCycles</b></FONT>
                        <br><br>
                        <FONT FACE="times new roman" SIZE=4>1.Resumen de la política:</FONT>
                        <FONT FACE="arial">La información debe ser siempre protegida, cualquiera que sea su forma de ser compartida, comunicada o almacenada.</FONT>
                        <br><br>
                        <FONT FACE="times new roman" SIZE=4>2.Introducción</FONT>
                        <FONT FACE="arial"> La información puede existir en diversas formas: impresa o escrita en papel, almacenada electrónicamente, transmitida por correo o por medios electrónicos, mostrada en proyecciones o en forma oral en las conversaciones.</FONT>
                        <br>
                        <FONT FACE="arial"> 2.1 La seguridad de la información es la protección de la información contra una amplia gama de amenazas con el fin de garantizar la continuidad del negocio, minimizar los riesgos empresariales y maximizar el retorno de las inversiones y oportunidades de negocio TMC.</FONT>
                        <br><br>
                        <FONT FACE="times new roman" SIZE=4>3.Alcance</FONT>
                        <br>
                        <FONT FACE="arial"> 3.1 La política general del Sistema de Gestión de Seguridad de la Información en TMC es  de consideración por parte de todos los miembros de la organización.</FONT>
                        <br><br>
                        <FONT FACE="times new roman" SIZE=4>4.Objetivos de seguridad de la información</FONT>
                        <br>
                        <FONT FACE="arial"> 4.1 Comprender y tratar los riesgos operacionales y estratégicos en seguridad de la información para que permanezcan en niveles aceptables para la organización.</FONT>
                        <br>
                        <FONT FACE="arial"> 4.2 Ser comprometido con la protección y confidencialidad de la información relacionada con los clientes y con los planes de desarrollo TMC.</FONT>
                        <br>
                        <FONT FACE="arial"> 4.3 Los servicios Web de acceso público y las redes internas cumplen con las especificaciones de disponibilidad requeridas, en especial esta herramienta.</FONT>
                        <br>
                        <FONT FACE="arial"> 4.4 Entender y dar cobertura a las necesidades de todas las partes interesadas.</FONT>
                        <br><br>
                        <FONT FACE="times new roman" SIZE=4>5.Responsabilidades</FONT>
                        <br>
                        <FONT FACE="arial"> 5.1 El equipo Administradores sera el responsable de garantizar que la seguridad de la información se gestiona adecuadamente en toda la organización.</FONT>
                        <br>
                        <FONT FACE="arial"> 5.2 Cada Administrador es responsable de garantizar que las personas que trabajan bajo su control protegen la información de acuerdo con las normas establecidas.</FONT>
                        <br>
                        <FONT FACE="arial"> 5.3 Cada miembro del personal tiene la responsabilidad de mantener la seguridad de información dentro de las actividades relacionadas con su trabajo.</FONT>
                        <br><br>
                        <FONT FACE="times new roman" SIZE=4>6.Indicadores Clave</FONT>
                        <br>
                        <FONT FACE="arial"> 6.1 Los incidentes en seguridad de la información  se traducirán en costes graves e inesperados, causales de  perturbación de los servicios y actividades comerciales.</FONT>
                        <br>
                        <FONT FACE="arial"> 6.2 Las pérdidas por fraude serán detectadas, acarreara consecuencias.</FONT>
                    </div>
                </section>
            </div>
            <div class="control-sidebar-bg"></div>
        </div>
        <script src="bower_components/jquery/dist/jquery.min.js"></script>
        <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="dist/js/adminlte.min.js"></script>
        <script src="bower_components/datatables.net/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <script src="swetalert/sweetalert.js" type="text/javascript"></script>
        <script src="js/funcionesUsuario.js" type="text/javascript"></script>
        <script>
        </script>
    </body>
</html>
<%
    } else {
        response.sendRedirect("identificar.jsp");
    }
%>
