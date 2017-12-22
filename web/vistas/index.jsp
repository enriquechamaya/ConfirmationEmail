<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <!--HEADER - LIBRERIAS DEFAULT-->
        <%@include file="template/header-lib.jsp" %>
        <!--HEADER - LIBRERIAS DEFAULT-->

    </head>
    <body class="hold-transition login-page">

        <div class="login-box">
            <div class="login-logo">
                <a href="index.jsp"><b>Admin</b>LTE</a>
            </div>
            <div class="login-box-body">
                <p class="login-box-msg">Ingrese sus credenciales</p>
                <form action="principal.jsp" method="post">
                    <div class="form-group has-feedback">
                        <input type="email" class="form-control" placeholder="Email">
                        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <input type="password" class="form-control" placeholder="Password">
                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <button type="submit" class="btn btn-primary btn-block btn-flat">Ingresar</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <!--FOOTER - LIBRERIAS DEFAULT-->
        <%@include file="template/footer-lib.jsp" %>
        <!--FOOTER - LIBRERIAS DEFAULT-->

    </body>
</html>
