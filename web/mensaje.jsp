<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Sistema Bodega| Error</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <link rel="stylesheet" href="plugins/iCheck/square/blue.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    </head>
    <body class="sidebar-closed sidebar-collapse" style="height: auto;">
        <div class="content-wrapper">
            <section class="content-header">
                <h1>
                    Error 500
                </h1>
                <ol class="breadcrumb">
                    <li><a href="srvUsuario?accion=verificar"><i class="fa fa-dashboard"></i> Inicio</a></li>
                    <li class="active"><a href="#">Error 500</a></li>
                </ol>
            </section>
            <section class="content">
                <div class="error-page">
                    <h2 class="headline text-red">500</h2>
                    <div class="error-content">
                        <h3><i class="fa fa-warning text-red"></i>Oops! Algo salió mal</h3>
                        <p>
                            Trabajaremos para solucionarlo de inmediato.
                            Mientras tanto, puedes solucionarlo <a href="#"> -- </a>
                        </p>
                        <form class="search-form">
                            <div class="input-group">
                                <input type="text" name="search" class="form-control" placeholder="Search">
                                <div class="input-group-btn">
                                    <button type="submit" name="submit" class="btn btn-danger btn-flat"><i class="fa fa-search"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </section>
        </div>
        <script src="bower_components/jquery/dist/jquery.min.js"></script>
        <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="plugins/iCheck/icheck.min.js"></script>
    </body>
</html>
