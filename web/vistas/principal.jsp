<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <!--HEADER - LIBRERIAS DEFAULT-->
        <%@include file="template/header-lib.jsp" %>
        <!--HEADER - LIBRERIAS DEFAULT-->

    </head>
    <body class="hold-transition skin-blue sidebar-mini">

        <div class="wrapper">

            <!--HEADER-->
            <%@include file="template/header.jsp" %>
            <!--HEADER-->

            <!--SIDEBAR-->
            <%@include file="template/sidebar.jsp" %>
            <!--SIDEBAR-->

            <div class="content-wrapper">

                <!--titulo de pagina-->
                <section class="content-header">
                    <h1>
                        Mantenimiento de Usuarios
                        <small>Vista principal</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>
                        <li><a href="#">Mantenimiento</a></li>
                        <li class="active">Usuarios</li>
                    </ol>
                </section>
                <!--titulo de pagina-->

                <!-- ********************************************************************************************************** -->
                <!-- ********************************************* CONTENIDO ************************************************** -->
                <!-- ********************************************************************************************************** -->                
                <section class="content">

                    <!--panel de busqueda-->
                    <div class="row">
                        <div class="col-md-offset-3 col-md-6">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title"><i class="glyphicon glyphicon-search"></i> Panel de busqueda</h3>
                                    <div class="box-tools pull-right">
                                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                    </div>
                                </div>
                                <div class="box-body">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="cboTipoBusqueda">Buscar por:</label>
                                                <select class="form-control" id="cboTipoBusqueda" name="cboTipoBusqueda">
                                                    <option>option 1</option>
                                                    <option>option 2</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="box-footer clearfix text-center">
                                    <button type="button" class="btn btn-sm btn-primary btn-flat">
                                        <i class="glyphicon glyphicon-search"></i> Buscar
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--panel de busqueda-->


                    <!--tabla de usuarios-->
                    <div class="row">
                        <div class="col-md-offset-3 col-md-6">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title"><i class="glyphicon glyphicon-user"></i> Lista de Usuarios</h3>
                                    <div class="box-tools pull-right">
                                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                        <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                    </div>
                                </div>
                                <div class="box-body">
                                    <div class="row">
                                        <div class="col-md-offset-4 col-md-4 text-center">
                                            <button type="button" class="btn btn-success btn-flat">
                                                <i class="glyphicon glyphicon-plus"></i> Nuevo
                                            </button>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <table class="table table-bordered table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Nombres y Apellidos</th>
                                                        <th>Usuario</th>
                                                        <th class="text-center">Fecha creacion</th>
                                                        <th>Estado</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>1</td>
                                                        <td>Enrique Alexander Chamaya de la Cruz</td>
                                                        <td>echamaya</td>
                                                        <td class="text-center">23/12/2017</td>
                                                        <td></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--tabla de usuarios-->



                </section>
                <!-- ********************************************************************************************************** -->
                <!-- ********************************************* CONTENIDO ************************************************** -->
                <!-- ********************************************************************************************************** -->

            </div>

            <!--FOOTER-->
            <%@include file="template/footer.jsp" %>
            <!--FOOTER-->

        </div>

        <!--FOOTER - LIBRERIAS DEFAULT-->
        <%@include file="template/footer-lib.jsp" %>
        <!--FOOTER - LIBRERIAS DEFAULT-->

    </body>
</html>
