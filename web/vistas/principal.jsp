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
                                    <button type="button" class="btn bg-blue btn-flat">
                                        <i class="glyphicon glyphicon-search"></i> Buscar
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--panel de busqueda-->


                    <!--tabla de usuarios-->
                    <div class="row">
                        <div class="col-md-offset-2 col-md-8">
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
                                            <button type="button" class="btn bg-blue btn-flat" data-toggle="modal" data-target="#mdl_registro_persona">
                                                <i class="glyphicon glyphicon-plus"></i> Nuevo
                                            </button>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <table class="table table-bordered table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Tipo Doc</th>
                                                        <th>Nro Doc</th>
                                                        <th>Correo</th>
                                                        <th>Fecha Registro</th>
                                                        <th>Estado</th>
                                                        <th class="text-center">Accion</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="dataPersona">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--tabla de usuarios-->


                    <!--modal de registro de persona y generacion de codigo de verificacion-->
                    <div class="modal fade" id="mdl_registro_persona" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" data-keyboard="false">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header bg-blue">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">
                                        <i class="glyphicon glyphicon-plus"></i> Nuevo registro
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="cbo_nacionalidad">Nacionalidad <span class="text-red">(*)</span></label>
                                                <select class="form-control" id="cbo_nacionalidad">
                                                    <option value="0">[SELECCIONAR]</option>
                                                    <option value="1">NACIONAL</option>
                                                    <option value="2">EXTRANJERO</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="txt_nro_documento">N° Documento <span class="text-red">(*)</span></label>
                                                <input type="text" class="form-control text-uppercase" id="txt_nro_documento" placeholder="Ingrese su nro de documento">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" id="div_validarDNI" style="display: none;">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="lbl_datos_reniec" class="text-green"><i class="fa fa-check fa-lg"></i> Verificado por reniec</label>
                                                <input type="text" class="form-control text-uppercase text-green" id="lbl_datos_reniec" disabled="true">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="txt_coreo">Correo Electrónico <span class="text-red">(*)</span></label>
                                                <input type="text" class="form-control text-lowercase" id="txt_coreo" placeholder="Ingrese su correo electronico">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="overlay" id="load" style="display: none;">
                                        <i class="fa fa-refresh fa-spin"></i> verificando dni...
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-flat bg-red" data-dismiss="modal" id="btn_cerrar_mdl_reg_per">Cerrar</button>
                                    <button type="button" class="btn btn-flat bg-blue" id="btn_registrar_mdl_reg_per">Registrar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--modal de registro de persona y generacion de codigo de verificacion-->
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

        <!--FOOTER - LIBRERIAS EXTRAS-->
        <!--local-->
        <script src="../js/pages/principal.js" type="text/javascript"></script>
        
        <!--validar inputs-->
        <script src="../AdminLTE/plugins/validateInput/validate_inputs.js" type="text/javascript"></script>
        <!--FOOTER - LIBRERIAS EXTRAS-->

    </body>
</html>
